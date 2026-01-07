;==============================================================================
; Dragon Quest III - Bank $12
; Type: Audio/Music
; Purpose: Audio DMA operations and music/sound effect management
; Address Range: $C90000-$C97FFF
; Instructions: 12797
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_12"

;------------------------------------------------------------------------------
; AudioSystemInit
; Address: $C98001
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioSystemInit:
	; Initialize audio system and setup DMA channels for sound
	JSL $C79E65		  ; 22 65 9E C7 | Jump to subroutine long
	BCS $05			  ; B0 05 | Branch if carry set
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; LoadMusicData
; Address: $C9800C
; Size: 35 bytes
;------------------------------------------------------------------------------
LoadMusicData:
	; Load music sample data into memory for playback
	JSR $7D37			; 20 37 7D | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ADC $479C,X		  ; 7D 9C 47 | Add with carry (absolute,X)
	LSR $00A2			; 4E A2 00 | Logical shift right (absolute)
	STX $4E41			; 8E 41 4E | Store X register to absolute address
	LDA $4E9A,X		  ; BD 9A 4E | Load from absolute,X into accumulator
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $4EB2,X		  ; BD B2 4E | Load from absolute,X into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $4EBA,X		  ; BD BA 4E | Load from absolute,X into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDY $4E9A,X		  ; BC 9A 4E | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; ProcessAudioSamples
; Address: $C98036
; Size: 71 bytes
;------------------------------------------------------------------------------
ProcessAudioSamples:
	; Process audio sample data and manage DMA transfer to sound hardware
	JSL $C010B4		  ; 22 B4 10 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $4E47			; 6D 47 4E | Add with carry (absolute)
	STA $4E47			; 8D 47 4E | Store accumulator to absolute address
	LDX $4E41			; AE 41 4E | Load from absolute address into X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $D0			  ; 90 D0 | Branch if carry clear
	LDA $4EDA			; AD DA 4E | Load from absolute address into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $4EDC			; AD DC 4E | Load from absolute address into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $4E47			; 6D 47 4E | Add with carry (absolute)
	CMP #$61			 ; C9 61 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	STZ $4E59,X		  ; 9E 59 4E | Store zero to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $4E41			; 8E 41 4E | Store X register to absolute address
	LDA $4E9A,X		  ; BD 9A 4E | Load from absolute,X into accumulator
	BEQ $2C			  ; F0 2C | Branch if equal
	LDA $4EB2,X		  ; BD B2 4E | Load from absolute,X into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $4EBA,X		  ; BD BA 4E | Load from absolute,X into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; UpdateSoundChannels
; Address: $C98085
; Size: 16 bytes
;------------------------------------------------------------------------------
UpdateSoundChannels:
	; Update individual sound channels with new data
	JSR $7D48			; 20 48 7D | Jump to subroutine
	LDA $4E9A,X		  ; BD 9A 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4E79,Y		  ; B9 79 4E | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; VolumeControlUpdate
; Address: $C98096
; Size: 37 bytes
;------------------------------------------------------------------------------
VolumeControlUpdate:
	; Update volume levels and audio channel mixing
	JSL $C010B4		  ; 22 B4 10 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $4E59,Y		  ; 79 59 4E | Add with carry (absolute,Y)
	STA $4E59,Y		  ; 99 59 4E | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX $4E41			; AE 41 4E | Load from absolute address into X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	LDA $4EDA			; AD DA 4E | Load from absolute address into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $4EDC			; AD DC 4E | Load from absolute address into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; SoundEffectHandler
; Address: $C980BD
; Size: 37 bytes
;------------------------------------------------------------------------------
SoundEffectHandler:
	; Handle sound effect playback and priority management
	JSR $7D48			; 20 48 7D | Jump to subroutine
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4E79,Y		  ; B9 79 4E | Load from absolute,Y into accumulator
	BEQ $10			  ; F0 10 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ADC $4E59,Y		  ; 79 59 4E | Add with carry (absolute,Y)
	STA $4E59,Y		  ; 99 59 4E | Store accumulator to absolute,Y
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	BCC $05			  ; 90 05 | Branch if carry clear
	REP #$30			 ; C2 30 | Reset processor status bits
	BCS $00			  ; B0 00 | Branch if carry set
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $E5			  ; 90 E5 | Branch if carry clear
	REP #$30			 ; C2 30 | Reset processor status bits
	LDY $4ED2			; AC D2 4E | Load from absolute address into Y register

;------------------------------------------------------------------------------
; MusicSequencer
; Address: $C980EB
; Size: 17 bytes
;------------------------------------------------------------------------------
MusicSequencer:
	; Main music sequence controller and timing
	JSR $81B4			; 20 B4 81 | Jump to subroutine
	LDA $7FE374		  ; AF 74 E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $4E4F			; 8D 4F 4E | Store accumulator to absolute address
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $4A			  ; 85 4A | Store accumulator to zero page

;------------------------------------------------------------------------------
; AudioDriverMain
; Address: $C980FE
; Size: 93 bytes
;------------------------------------------------------------------------------
AudioDriverMain:
	; Main audio driver routine - processes all audio subsystems
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	STA $04			  ; 85 04 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $4E41			; 8E 41 4E | Store X register to absolute address
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	LDY $4EE2,X		  ; BC E2 4E | Load from absolute,X into Y register
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	BRA $18			  ; 80 18 | Branch always
	LDA $7FE374		  ; AF 74 E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$F8			 ; 69 F8 | Add with carry (immediate)
	SEC				  ; 38 | Set carry flag
	SBC $4E4F			; ED 4F 4E | Subtract with carry (absolute)
	BCC $33			  ; 90 33 | Branch if carry clear
	CMP $4E53			; CD 53 4E | Compare accumulator (absolute)
	BCC $2E			  ; 90 2E | Branch if carry clear
	LDA $4E4F			; AD 4F 4E | Load from absolute address into accumulator
	BRA $11			  ; 80 11 | Branch always
	STA $00			  ; 85 00 | Store accumulator to zero page
	SEC				  ; 38 | Set carry flag
	SBC $4E4F			; ED 4F 4E | Subtract with carry (absolute)
	CMP $4E53			; CD 53 4E | Compare accumulator (absolute)
	BCC $1E			  ; 90 1E | Branch if carry clear
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $4E53			; ED 53 4E | Subtract with carry (absolute)
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	BCS $04			  ; B0 04 | Branch if carry set
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP $4A			  ; C5 4A | Compare accumulator (zero page)
	BCS $07			  ; B0 07 | Branch if carry set
	STA $4A			  ; 85 4A | Store accumulator to zero page
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $4EDE			; 8D DE 4E | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioBufferManager
; Address: $C98164
; Size: 15 bytes
;------------------------------------------------------------------------------
AudioBufferManager:
	JSR $7CA7			; 20 A7 7C | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $4E4F			; 8D 4F 4E | Store accumulator to absolute address
	LDX $4E41			; AE 41 4E | Load from absolute address into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; AudioChannelValidator
; Address: $C98173
; Size: 20 bytes
;------------------------------------------------------------------------------
AudioChannelValidator:
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $8F			  ; 80 8F | Branch always
	LDA $4A			  ; A5 4A | Load from zero page into accumulator
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioBitShiftProcessor
; Address: $C9818B
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioBitShiftProcessor:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $F0			  ; 80 F0 | Branch always
	LDY $4ED2			; AC D2 4E | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioChannelInitializer
; Address: $C98196
; Size: 53 bytes
;------------------------------------------------------------------------------
AudioChannelInitializer:
	JSR $7CA7			; 20 A7 7C | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$78			 ; 69 78 | Add with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	STA $4EDE			; 8D DE 4E | Store accumulator to absolute address
	BRA $CF			  ; 80 CF | Branch always
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4EE2,X		  ; BD E2 4E | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	STA $4F12,Y		  ; 99 12 4F | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $4F12,Y		  ; 99 12 4F | Store accumulator to absolute,Y
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioChannelSwapper
; Address: $C981D9
; Size: 70 bytes
;------------------------------------------------------------------------------
AudioChannelSwapper:
	STY $4E41			; 8C 41 4E | Store Y register to absolute address
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $3C			  ; F0 3C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $21			  ; F0 21 | PPU graphics register access
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	EOR ($4E,X)		  ; 41 4E | Exclusive OR with accumulator ((zero page,X))
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F12,Y		  ; 99 12 4F | Store accumulator to absolute,Y
	BRA $D5			  ; 80 D5 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	LDY $4E41			; AC 41 4E | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $B9			  ; 80 B9 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; InterruptHandler
; Address: $C98224
; Size: 16 bytes
;------------------------------------------------------------------------------
InterruptHandler:
	; Audio interrupt handler for real-time processing
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$199A		   ; F4 9A 19 | Push effective address to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; RestoreInterruptState
; Address: $C9823C
; Size: 5 bytes
;------------------------------------------------------------------------------
RestoreInterruptState:
	; Restore processor state after interrupt handling
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioCallHandler
; Address: $C98243
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioCallHandler:
	JSL $C2CC8B		  ; 22 8B CC C2 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; AudioDataRouter
; Address: $C9824C
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioDataRouter:
	JSL $C2CC8B		  ; 22 8B CC C2 | Jump to subroutine long
	ORA $FF00			; 0D 00 FF | Logical OR with accumulator (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; AudioCleanup
; Address: $C98256
; Size: 5 bytes
;------------------------------------------------------------------------------
AudioCleanup:
	JSR $825B			; 20 5B 82 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioDMASetup
; Address: $C9825B
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioDMASetup:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $4245			; 8D 45 42 | Hardware register operation
	STX $4E4B			; 8E 4B 4E | Store X register to absolute address

;------------------------------------------------------------------------------
; AudioChannelScanner
; Address: $C98264
; Size: 29 bytes
;------------------------------------------------------------------------------
AudioChannelScanner:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $4F			  ; 80 4F | Branch always
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $4E4D			; 8D 4D 4E | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4EE2,X		  ; BD E2 4E | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $F4			  ; 80 F4 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $A9			  ; 05 A9 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; AudioHardwareConfig
; Address: $C98287
; Size: 23 bytes
;------------------------------------------------------------------------------
AudioHardwareConfig:
	JSR $418D			; 20 8D 41 | Jump to subroutine
	WDM #$A9			 ; 42 A9 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $4243			; 8D 43 42 | Hardware register operation
	LDX $4EDE			; AE DE 4E | Load from absolute address into X register
	LDA $7FE37E		  ; AF 7E E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$88			 ; 69 88 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4E4D			; AD 4D 4E | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; AudioMemoryMapper
; Address: $C982A0
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioMemoryMapper:
	JSL $C79C43		  ; 22 43 9C C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA $A8			  ; 05 A8 | Logical OR with accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; AudioChannelWriter
; Address: $C982AB
; Size: 16 bytes
;------------------------------------------------------------------------------
AudioChannelWriter:
	STA $4EFA,Y		  ; 99 FA 4E | Store accumulator to absolute,Y
	LDA $4E4B			; AD 4B 4E | Load from absolute address into accumulator
	STA $4EE2,Y		  ; 99 E2 4E | Store accumulator to absolute,Y
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioSubroutineCall
; Address: $C982C1
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioSubroutineCall:
	JSL $C0936F		  ; 22 6F 93 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioProcessorSetup
; Address: $C982C9
; Size: 52 bytes
;------------------------------------------------------------------------------
AudioProcessorSetup:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$199A		   ; F4 9A 19 | Push effective address to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $4EDE			; AD DE 4E | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEC $204E,X		  ; DE 4E 20 | Decrement (absolute,X)
	WDM #$82			 ; 42 82 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	STY $4EDE			; 8C DE 4E | Store Y register to absolute address
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	ADC $C48C			; 6D 8C C4 | Add with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioInterruptHandler
; Address: $C98301
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioInterruptHandler:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; AudioStackSetup
; Address: $C98308
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioStackSetup:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$199A		   ; F4 9A 19 | Push effective address to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; AudioTaskHandler
; Address: $C98313
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioTaskHandler:
	JSR $8242			; 20 42 82 | Jump to subroutine
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioContextSave
; Address: $C98320
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioContextSave:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; AudioLongCall
; Address: $C98330
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioLongCall:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioLongCallWithFlag
; Address: $C9833A
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioLongCallWithFlag:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioBranchHandler
; Address: $C98344
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioBranchHandler:
	JSL $C48320		  ; 22 20 83 C4 | Jump to subroutine long
	BCC $FA			  ; 90 FA | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioConditionalProcessor
; Address: $C9834B
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioConditionalProcessor:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; AudioRetryHandler
; Address: $C98357
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioRetryHandler:
	JSL $C48320		  ; 22 20 83 C4 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal

;------------------------------------------------------------------------------
; AudioOperationHandler
; Address: $C9835E
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioOperationHandler:
	JSL $C02BB2		  ; 22 B2 2B C0 | Jump to subroutine long
	ORA $B0			  ; 05 B0 | Logical OR with accumulator (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; AudioLoopController
; Address: $C98367
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioLoopController:
	JSR $C483			; 20 83 C4 | Jump to subroutine
	BRA $F2			  ; 80 F2 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioQuickInit
; Address: $C98371
; Size: 4 bytes
;------------------------------------------------------------------------------
AudioQuickInit:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; AudioCounterLoop
; Address: $C98375
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioCounterLoop:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioEnvironmentSetup
; Address: $C9837F
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioEnvironmentSetup:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; AudioRegisterCopy
; Address: $C98390
; Size: 40 bytes
;------------------------------------------------------------------------------
AudioRegisterCopy:
	JSL $C688AD		  ; 22 AD 88 C6 | Jump to subroutine long
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	STA $4F30			; 8D 30 4F | Store accumulator to absolute address
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	STA $4F32			; 8D 32 4F | Store accumulator to absolute address
	LDA $7F9E			; AD 9E 7F | Load from absolute address into accumulator
	STA $4F38			; 8D 38 4F | Store accumulator to absolute address
	LDA $7FA6			; AD A6 7F | Load from absolute address into accumulator
	STA $4F3A			; 8D 3A 4F | Store accumulator to absolute address
	LDA $7F90			; AD 90 7F | Load from absolute address into accumulator
	STA $4F42			; 8D 42 4F | Store accumulator to absolute address
	LDA $7FD8			; AD D8 7F | Load from absolute address into accumulator
	STA $4F40			; 8D 40 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioCleanupHandler
; Address: $C983B8
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioCleanupHandler:
	JSL $C4C04A		  ; 22 4A C0 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioSystemConfig
; Address: $C983C2
; Size: 79 bytes
;------------------------------------------------------------------------------
AudioSystemConfig:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FBA			; 8D BA 7F | Store accumulator to absolute address
	STA $7FBC			; 8D BC 7F | Store accumulator to absolute address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $7FC2			; 8D C2 7F | Store accumulator to absolute address
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FCC			; 8D CC 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FCE			; 8D CE 7F | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA $4F30			; AD 30 4F | Load from absolute address into accumulator
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	LDA $4F32			; AD 32 4F | Load from absolute address into accumulator
	STA $7FA6			; 8D A6 7F | Store accumulator to absolute address
	LDA $4F38			; AD 38 4F | Load from absolute address into accumulator
	STA $7F9E			; 8D 9E 7F | Store accumulator to absolute address
	LDA $4F3A			; AD 3A 4F | Load from absolute address into accumulator
	STA $7FA6			; 8D A6 7F | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioBitProcessor
; Address: $C9841A
; Size: 21 bytes
;------------------------------------------------------------------------------
AudioBitProcessor:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $7FD4			; 9C D4 7F | Store zero to absolute
	ORA $4A			  ; 05 4A | Logical OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $04			  ; 90 04 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; AudioShiftOperator
; Address: $C98434
; Size: 21 bytes
;------------------------------------------------------------------------------
AudioShiftOperator:
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $08			  ; 90 08 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $07			  ; 90 07 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioWordProcessor
; Address: $C9844F
; Size: 25 bytes
;------------------------------------------------------------------------------
AudioWordProcessor:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; AudioSubroutineWrapper
; Address: $C9846D
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSubroutineWrapper:
	JSR $841A			; 20 1A 84 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioWorkRamAccess
; Address: $C98474
; Size: 25 bytes
;------------------------------------------------------------------------------
AudioWorkRamAccess:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; AudioStackRestore
; Address: $C98496
; Size: 3 bytes
;------------------------------------------------------------------------------
AudioStackRestore:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioParameterSetup
; Address: $C98499
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioParameterSetup:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; AudioLongHandler
; Address: $C984A2
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioLongHandler:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioRamLoader
; Address: $C984AC
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioRamLoader:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	LDY $4F40			; AC 40 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioSystemCall
; Address: $C984B6
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioSystemCall:
	JSL $C4C52A		  ; 22 2A C5 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_03C
; Address: $C984BE
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioBufferSetup:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; AudioBranchHandler2
; Address: $C984C7
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioBranchHandler2:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $43			  ; 10 43 | Branch if positive

;------------------------------------------------------------------------------
; AudioRamLoader2
; Address: $C984D1
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioRamLoader2:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	LDY $4F40			; AC 40 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioSystemCall2
; Address: $C984DB
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioSystemCall2:
	JSL $C4C52A		  ; 22 2A C5 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioSetupRoutine
; Address: $C984E3
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSetupRoutine:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; AudioHandler3
; Address: $C984EC
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioHandler3:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioRamLoader3
; Address: $C984F6
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioRamLoader3:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	LDY $4F40			; AC 40 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioStackHandler
; Address: $C98500
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioStackHandler:
	JSL $C4C52A		  ; 22 2A C5 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; AudioSetupRoutine2
; Address: $C98508
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSetupRoutine2:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_046
; Address: $C98511
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioChannelProcessor:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDX $48C6			; AE C6 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioChannelProcessor2
; Address: $C98524
; Size: 18 bytes
;------------------------------------------------------------------------------
AudioChannelProcessor2:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDX $48CA			; AE CA 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	LDY $4F40			; AC 40 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioChannelProcessor3
; Address: $C98537
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioChannelProcessor3:
	JSL $C4C52A		  ; 22 2A C5 C4 | Jump to subroutine long
	LDX $48CC			; AE CC 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioMinimalSetup
; Address: $C98548
; Size: 3 bytes
;------------------------------------------------------------------------------
AudioMinimalSetup:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
AudioRegisterConfig
; Address: $C98553
; Size: 27 bytes
;------------------------------------------------------------------------------
AudioRegisterConfig:
	JSL $C4C65B		  ; 22 5B C6 C4 | Jump to subroutine long
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA $7FD8			; AD D8 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; AudioSubroutineCall3
; Address: $C98572
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSubroutineCall3:
	JSR $841A			; 20 1A 84 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioQuickSetup
; Address: $C98579
; Size: 3 bytes
;------------------------------------------------------------------------------
AudioQuickSetup:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; AudioBranchHandler3
; Address: $C98582
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioBranchHandler3:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $43			  ; 10 43 | Branch if positive

;------------------------------------------------------------------------------
; AudioRamInitializer - Initialize audio system with RAM access
; Address: $C9858C
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioRamInitializer:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	LDY $4F40			; AC 40 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioStackRestorer - Restore audio registers from stack
; Address: $C98596
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioStackRestorer:
	JSL $C4C52A		  ; 22 2A C5 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioStackPusher - Push audio registers to stack
; Address: $C9859E
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioStackPusher:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	LDY #$17			 ; A0 17 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioChannelWriter - Write data to audio channel buffer
; Address: $C985A7
; Size: 19 bytes
;------------------------------------------------------------------------------
AudioChannelWriter:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDX $48C6			; AE C6 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $43			  ; 10 43 | Branch if positive

;------------------------------------------------------------------------------
; AudioRamChannelWriter - Write to audio channel with RAM access
; Address: $C985BA
; Size: 18 bytes
;------------------------------------------------------------------------------
AudioRamChannelWriter:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDX $48CA			; AE CA 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	LDY $4F40			; AC 40 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; AudioChannelWriterWithRestore - Write to channel then restore stack
; Address: $C985CD
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioChannelWriterWithRestore:
	JSL $C4C52A		  ; 22 2A C5 C4 | Jump to subroutine long
	LDX $48CC			; AE CC 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioSystemInitializer - Initialize audio system registers
; Address: $C985E1
; Size: 21 bytes
;------------------------------------------------------------------------------
AudioSystemInitializer:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	STA $7FBA			; 8D BA 7F | Store accumulator to absolute address
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address
	STA $7FCE			; 8D CE 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioRegisterSetup - Setup audio hardware registers
; Address: $C985F9
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioRegisterSetup:
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; AudioSubroutineHandler - Call audio subroutine and restore stack
; Address: $C98608
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSubroutineHandler:
	JSR $841A			; 20 1A 84 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioSystemReset - Reset audio system to default state
; Address: $C9860F
; Size: 36 bytes
;------------------------------------------------------------------------------
AudioSystemReset:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FBA			; 8D BA 7F | Store accumulator to absolute address
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FCE			; 8D CE 7F | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA $7FD8			; AD D8 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; AudioSubroutineHandler2 - Another audio subroutine handler
; Address: $C98639
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSubroutineHandler2:
	JSR $841A			; 20 1A 84 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioStackPusher2 - Push registers to stack
; Address: $C98640
; Size: 3 bytes
;------------------------------------------------------------------------------
AudioStackPusher2:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; AudioChannelManager - Manage audio channels with buffer writes
; Address: $C98643
; Size: 22 bytes
;------------------------------------------------------------------------------
AudioChannelManager:
	JSR $85E1			; 20 E1 85 | Jump to subroutine
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BPL $AE			  ; 10 AE | Branch if positive
	DEX				  ; CA | Decrement X register
	PHA				  ; 48 | Push accumulator to stack
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioStackPusher3 - Push registers to stack with zero init
; Address: $C98659
; Size: 5 bytes
;------------------------------------------------------------------------------
AudioStackPusher3:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioRegisterWriter - Write to audio control registers
; Address: $C9865F
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioRegisterWriter:
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; AudioSubroutineHandler3 - Third audio subroutine handler
; Address: $C9866B
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSubroutineHandler3:
	JSR $841A			; 20 1A 84 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioInitializer - Initialize audio with value 2
; Address: $C98672
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioInitializer:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioLongCallHandler - Handle long calls with stack restore
; Address: $C9867B
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioLongCallHandler:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioSetupWithValue2 - Setup audio with immediate value 2
; Address: $C98683
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSetupWithValue2:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioChannelWriterLong - Long call channel writer with restore
; Address: $C9868C
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioChannelWriterLong:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDX $48CA			; AE CA 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioStackPusher4 - Fourth stack pusher variant
; Address: $C9869D
; Size: 3 bytes
;------------------------------------------------------------------------------
AudioStackPusher4:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; AudioControlRegisterSetup - Setup audio control registers
; Address: $C986A0
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioControlRegisterSetup:
	JSL $C4C50B		  ; 22 0B C5 C4 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA $7FD8			; AD D8 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; AudioSubroutineHandler4 - Fourth audio subroutine handler
; Address: $C986B3
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSubroutineHandler4:
	JSR $841A			; 20 1A 84 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioStatusFlagSetter - Set audio status flags
; Address: $C986BA
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioStatusFlagSetter:
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7FBE			; AD BE 7F | Load from absolute address into accumulator
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; AudioStatusFlagClearer - Clear audio status flags
; Address: $C986C2
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioStatusFlagClearer:
	AND #$BF			 ; 29 BF | Logical AND with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioDirectWrite - Direct write to audio register
; Address: $C986CB
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioDirectWrite:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioBankSetup - Setup audio data bank registers
; Address: $C986D4
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioBankSetup:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; AudioMemoryHandler - Handle audio memory operations with increment
; Address: $C986DC
; Size: 16 bytes
;------------------------------------------------------------------------------
AudioMemoryHandler:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LSR $A200,X		  ; 5E 00 A2 | Logical shift right (absolute,X)
	INC $7FA8			; EE A8 7F | Increment (absolute)
	INC $7FA8			; EE A8 7F | Increment (absolute)
	PHX				  ; DA | Push X register to stack
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioMemoryDecrementer - Audio memory operations with decrement
; Address: $C986EF
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioMemoryDecrementer:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEC $7FA8			; CE A8 7F | Decrement (absolute)
	DEC $7FA8			; CE A8 7F | Decrement (absolute)
	PHX				  ; DA | Push X register to stack
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioAddressIncrementer - Increment audio address pointers
; Address: $C986FE
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioAddressIncrementer:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INC $7FA0			; EE A0 7F | Increment (absolute)
	INC $7FA0			; EE A0 7F | Increment (absolute)
	PHX				  ; DA | Push X register to stack
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioAddressDecrementer - Decrement audio address pointers
; Address: $C9870D
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioAddressDecrementer:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEC $7FA0			; CE A0 7F | Decrement (absolute)
	DEC $7FA0			; CE A0 7F | Decrement (absolute)
	PHX				  ; DA | Push X register to stack
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioLoopController - Control audio loops with counter
; Address: $C9871C
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioLoopController:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $C1			  ; D0 C1 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioBankSetup2 - Second audio data bank setup
; Address: $C98726
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioBankSetup2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; AudioHardwareProcessor - Process audio hardware registers
; Address: $C98732
; Size: 19 bytes
;------------------------------------------------------------------------------
AudioHardwareProcessor:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	STZ $00			  ; 64 00 | Store zero to zero page
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	BRA $9D			  ; 80 9D | Branch always
	WDM #$DA			 ; 42 DA | Reserved instruction
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioYCounterController - Control audio Y counter loops
; Address: $C98748
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioYCounterController:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEY				  ; 88 | Decrement Y register
	BNE $EB			  ; D0 EB | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioRegisterSaver - Save audio registers to memory
; Address: $C98752
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioRegisterSaver:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	STX $4F2C			; 8E 2C 4F | Store X register to absolute address
	STY $4F2E			; 8C 2E 4F | Store Y register to absolute address
	STZ $4250			; 9C 50 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioComplexProcessor - Complex audio processing with memory operations
; Address: $C9875E
; Size: 48 bytes
;------------------------------------------------------------------------------
AudioComplexProcessor:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDA $20C4,Y		  ; B9 C4 20 | Load from absolute,Y into accumulator
	LDY $22AF			; AC AF 22 | Load from absolute address into Y register
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$74			 ; C0 74 | Compare Y register (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $486B28		  ; AF 28 6B 48 | Load from absolute long address into accumulator
	PLY				  ; 7A | Pull Y register from stack
	STX $4F2C			; 8E 2C 4F | Store X register to absolute address
	LDA $4EE2,X		  ; BD E2 4E | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	LDX $BD00,Y		  ; BE 00 BD | Load from absolute,Y into X register
	PLX				  ; FA | Pull X register from stack
	LSR $BDAA			; 4E AA BD | Logical shift right (absolute)
	WDM #$C9			 ; 42 C9 | Reserved instruction
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$89			 ; A9 89 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioBranchController - Control audio branching logic
; Address: $C98794
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioBranchController:
	JSR $8844			; 20 44 88 | Jump to subroutine
	BRA $32			  ; 80 32 | Branch always
	CMP #$37			 ; C9 37 | Compare accumulator (immediate)
	BNE $18			  ; D0 18 | Branch if not equal
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; AudioQuickBrancher - Quick branch controller for audio
; Address: $C987A6
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioQuickBrancher:
	BRA $23			  ; 80 23 | Branch always
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BNE $07			  ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; AudioSubtractionProcessor - Audio subtraction with long call
; Address: $C987AD
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioSubtractionProcessor:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	SBC $C489,Y		  ; F9 89 C4 | Subtract with carry (absolute,Y)
	BRA $15			  ; 80 15 | Branch always
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; AudioConditionalBrancher - Conditional branching for audio
; Address: $C987BB
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioConditionalBrancher:
	JSR $888B			; 20 8B 88 | Jump to subroutine
	BRA $0B			  ; 80 0B | Branch always
	CMP #$42			 ; C9 42 | Hardware register operation
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; AudioBufferController - Control audio buffers with temporary storage
; Address: $C987C5
; Size: 15 bytes
;------------------------------------------------------------------------------
AudioBufferController:
	JSR $8902			; 20 02 89 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $44F2,X		  ; BD F2 44 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $44F2,X		  ; 9D F2 44 | Store accumulator to absolute,X
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; AudioHardwareChecker - Check audio hardware status
; Address: $C987F4
; Size: 15 bytes
;------------------------------------------------------------------------------
AudioHardwareChecker:
	JSL $C7A040		  ; 22 40 A0 C7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	LDA $424B			; AD 4B 42 | Hardware register operation
	BEQ $1B			  ; F0 1B | Branch if equal
	LDA $424D			; AD 4D 42 | Hardware register operation
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; AudioArithmeticProcessor - Process audio arithmetic operations
; Address: $C98803
; Size: 19 bytes
;------------------------------------------------------------------------------
AudioArithmeticProcessor:
	JSR $8A7E			; 20 7E 8A | Jump to subroutine
	LDA $4332,X		  ; BD 32 43 | Load from absolute,X into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $9D			  ; 80 9D | Branch always
	LDA $4392,X		  ; BD 92 43 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $4392,X		  ; 9D 92 43 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; AudioStackProcessor - Process audio stack operations
; Address: $C98819
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioStackProcessor:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BCC $D4			  ; 90 D4 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $44F2,X		  ; 9D F2 44 | Store accumulator to absolute,X
	PLP				  ; 28 | Pull processor status from stack
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioXorProcessor - Process XOR operations for audio
; Address: $C9882A
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioXorProcessor:
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	BRA $9D			  ; 80 9D | Branch always
	WDM #$A9			 ; 42 A9 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioHardwareStacker - Audio hardware operations with stack
; Address: $C98842
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioHardwareStacker:
	BRA $FD			  ; 80 FD | Branch always
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioDataLoader - Load audio data with Y register setup
; Address: $C9884D
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioDataLoader:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; AudioLongCallRestore - Long call with register restore
; Address: $C98858
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioLongCallRestore:
	JSL $C0463D		  ; 22 3D 46 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioModeSelector - Select audio mode based on value comparison
; Address: $C9885F
; Size: 31 bytes
;------------------------------------------------------------------------------
AudioModeSelector:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $45B2,X		  ; BD B2 45 | Load from absolute,X into accumulator
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$31			 ; C9 31 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$32			 ; C9 32 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA #$8D			 ; A9 8D | Load immediate value into accumulator
	BRA $0D			  ; 80 0D | Branch always
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator
	BRA $08			  ; 80 08 | Branch always
	LDA #$8B			 ; A9 8B | Load immediate value into accumulator
	BRA $03			  ; 80 03 | Branch always
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioSubroutineStack - Audio subroutine with stack restore
; Address: $C98885
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioSubroutineStack:
	JSR $8844			; 20 44 88 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioYComparator - Compare Y register for audio control
; Address: $C9888B
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioYComparator:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $18			  ; D0 18 | Branch if not equal

;------------------------------------------------------------------------------
; AudioStatusProcessor - Process audio status register operations
; Address: $C9889C
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioStatusProcessor:
	REP #$88			 ; C2 88 | Reset processor status bits
	CPY $C9			  ; C4 C9 | Compare Y register (zero page)
	DEC $D002			; CE 02 D0 | Decrement (absolute)
	ORA #$A9			 ; 09 A9 | Logical OR with accumulator (immediate)
	STX $00			  ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; AudioSubroutineStack2 - Second audio subroutine stack handler
; Address: $C988A7
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioSubroutineStack2:
	JSR $8844			; 20 44 88 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioValueChecker - Check audio value for specific condition
; Address: $C988AD
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioValueChecker:
	CMP #$CF			 ; C9 CF | Compare accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$87			 ; A9 87 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioBranchController2 - Second audio branch controller
; Address: $C988B5
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioBranchController2:
	JSR $8844			; 20 44 88 | Jump to subroutine
	BRA $F0			  ; 80 F0 | Branch always
	LDA #$88			 ; A9 88 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioConfigurationSetter - Set complex audio configuration
; Address: $C988BD
; Size: 30 bytes
;------------------------------------------------------------------------------
AudioConfigurationSetter:
	JSR $8844			; 20 44 88 | Jump to subroutine
	BRA $E8			  ; 80 E8 | Branch always
	LDY #$61			 ; A0 61 | Load immediate value into Y register
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	LDY #$73			 ; A0 73 | Load immediate value into Y register
	STY $4F74			; 8C 74 4F | Store Y register to absolute address
	PEA #$0030		   ; F4 30 00 | Push effective address to stack
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioLoopDecrementer - Long call with Y register loop
; Address: $C988E6
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioLoopDecrementer:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	BNE $F9			  ; D0 F9 | Branch if not equal
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; AudioSimpleXStacker - Simple X register stack operations
; Address: $C988EE
; Size: 5 bytes
;------------------------------------------------------------------------------
AudioSimpleXStacker:
	JSR $844F			; 20 4F 84 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; AudioHardwareInitializer - Initialize audio hardware register
; Address: $C98902
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioHardwareInitializer:
	PHX				  ; DA | Push X register to stack
	STZ $4249			; 9C 49 42 | Hardware register operation
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; AudioIncrementProcessor - Increment audio hardware and push address
; Address: $C9890B
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioIncrementProcessor:
	JSR $B75F			; 20 5F B7 | Jump to subroutine
	INC $4249			; EE 49 42 | Hardware register operation
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; AudioShiftMultiplier - Shift Y register to create index multiplier
; Address: $C98914
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioShiftMultiplier:
	PEA #$892D		   ; F4 2D 89 | Push effective address to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 43 89 C4 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 41 89 C4 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; AudioRegisterTransfer - Transfer and OR operations with audio registers
; Address: $C98927
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioRegisterTransfer:
	JSR $8951			; 20 51 89 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $60			  ; 05 60 | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; AudioHardwareORProcessor - Process hardware register OR operations
; Address: $C9892F
; Size: 16 bytes
;------------------------------------------------------------------------------
AudioHardwareORProcessor:
	JSL $C79DD4		  ; 22 D4 9D C7 | Jump to subroutine long
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	WDM #$DA			 ; 42 FA | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioChannelModeSelector - Select audio channel mode and configure hardware
; Address: $C98941
; Size: 38 bytes
;------------------------------------------------------------------------------
AudioChannelModeSelector:
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $00438A		  ; 5C 8A 43 00 | Jump to address long
	PLA				  ; 68 | Pull accumulator from stack
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($8A),Y		  ; 71 8A | Add with carry ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$4F			 ; A0 4F | Load immediate value into Y register
	LDA $45B2,X		  ; BD B2 45 | Load from absolute,X into accumulator
	CMP #$75			 ; C9 75 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	LDY #$75			 ; A0 75 | Load immediate value into Y register
	STY $4245			; 8C 45 42 | Hardware register operation
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	TAY				  ; A8 | Transfer accumulator to Y register
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; AudioHardwareReader - Read audio hardware register
; Address: $C9896F
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioHardwareReader:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4249			; AD 49 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioHardwareORProcessor2 - Second hardware register OR processor
; Address: $C98976
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioHardwareORProcessor2:
	JSR $B497			; 20 97 B4 | Jump to subroutine
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($BB,X)		  ; 01 BB | Logical OR with accumulator ((zero page,X))
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; AudioSimpleORReturn - Simple OR operation with return
; Address: $C98985
; Size: 5 bytes
;------------------------------------------------------------------------------
AudioSimpleORReturn:
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	WDM #$FA			 ; 42 FA | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioConditionalLoader - Load audio data conditionally
; Address: $C9898F
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioConditionalLoader:
	JSL $C7A040		  ; 22 40 A0 C7 | Jump to subroutine long
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioAddressPusher - Push audio address and rotate
; Address: $C9899D
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioAddressPusher:
	LDA #$73			 ; A9 73 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	PEA #$000C		   ; F4 0C 00 | Push effective address to stack
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; AudioMemoryStorer - Store audio memory configuration
; Address: $C989AF
; Size: 16 bytes
;------------------------------------------------------------------------------
AudioMemoryStorer:
	JSR $844F			; 20 4F 84 | Jump to subroutine
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$11			 ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioAddressIncrementer8 - Increment audio address by 8
; Address: $C989D6
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioAddressIncrementer8:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioShiftSubtractor - Shift and subtract audio operations
; Address: $C989E4
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioShiftSubtractor:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	LSR $90F6,X		  ; 5E F6 90 | Logical shift right (absolute,X)
	SBC #$FA			 ; E9 FA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; AudioMemoryRestorer - Restore audio memory and return long
; Address: $C989F1
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioMemoryRestorer:
	JSR $8548			; 20 48 85 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_0BB
; Address: $C98A16
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_0BB:
	JSR $844F			; 20 4F 84 | Jump to subroutine
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioXORProcessor - Process audio data with XOR operations
; Address: $C98A43
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioXORProcessor:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	EOR $90F6,X		  ; 5D F6 90 | Exclusive OR with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; AudioStackRestorer2 - Restore audio memory and return long
; Address: $C98A50
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioStackRestorer2:
	JSR $8548			; 20 48 85 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioStackCleaner - Clean audio stack and return
; Address: $C98A82
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioStackCleaner:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioHardwareValidator - Validate hardware registers and compare
; Address: $C98A8B
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioHardwareValidator:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $FABD60		  ; AF 60 BD FA | Load from absolute long address into accumulator
	LSR $AADA			; 4E DA AA | Logical shift right (absolute)
	LDA $4252,X		  ; BD 52 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioRegisterClearer - Clear audio registers and return long
; Address: $C98AA3
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioRegisterClearer:
	JSL $C79DD4		  ; 22 D4 9D C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4EE2,X		  ; 9D E2 4E | Store accumulator to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioHardwareConfigurer - Configure audio hardware register $4F74
; Address: $C98AB8
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioHardwareConfigurer:
	JSR $8508			; 20 08 85 | Jump to subroutine
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioOffsetSubtractor - Subtract offset and configure Y channel
; Address: $C98AC7
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioOffsetSubtractor:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioMemoryComparator - Compare audio memory and branch
; Address: $C98ADA
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioMemoryComparator:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; AudioORProcessor2 - Process audio data with OR operation
; Address: $C98AE4
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioORProcessor2:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	BVC $4F			  ; 50 4F | Branch if overflow clear
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; AudioBankPusher - Push data bank and compare memory
; Address: $C98AF3
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioBankPusher:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHB				  ; 8B | Push data bank register to stack
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDX $FAAF,Y		  ; BE AF FA | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; AudioStackManager - Manage audio stack operations
; Address: $C98B19
; Size: 15 bytes
;------------------------------------------------------------------------------
AudioStackManager:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 1E 00 C9 | Load from absolute long,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; AudioChannelProcessor - Complex audio channel processing with hardware register manipulation
; Address: $C98B2A
; Size: 41 bytes
;------------------------------------------------------------------------------
AudioChannelProcessor:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $42F2,Y		  ; 79 F2 42 | Hardware register operation
	STA $42F2,Y		  ; 99 F2 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STZ $C02B			; 9C 2B C0 | Store zero to absolute
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCC $CC			  ; 90 CC | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioInterruptSetter - Set interrupt flags and push X register
; Address: $C98B5B
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioInterruptSetter:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; AudioORStackProcessor - Process audio with OR operations and stack manipulation
; Address: $C98B6C
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioORStackProcessor:
	JSR $8579			; 20 79 85 | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioMemoryDecrementer - Decrement audio memory with flag operations
; Address: $C98B7B
; Size: 18 bytes
;------------------------------------------------------------------------------
AudioMemoryDecrementer:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $9622FA		  ; AF FA 22 96 | Load from absolute long address into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	DEC $2885,X		  ; DE 85 28 | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioRegisterPusher - Push audio registers to stack
; Address: $C98B91
; Size: 5 bytes
;------------------------------------------------------------------------------
AudioRegisterPusher:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; AudioRegisterRestorer - Restore audio registers from stack
; Address: $C98BA6
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioRegisterRestorer:
	JSR $85DE			; 20 DE 85 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioLongCallProcessor - Process long call audio operations with stack
; Address: $C98BAE
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioLongCallProcessor:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioHardwareStackController - Complex hardware control with stack operations
; Address: $C98BC1
; Size: 26 bytes
;------------------------------------------------------------------------------
AudioHardwareStackController:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$0D			 ; C0 0D | Compare Y register (immediate)
	STY $A9C4			; 8C C4 A9 | Store Y register to absolute address
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$7A			 ; A9 7A | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioHardware4245Controller - Control hardware register $4245 with stack operations
; Address: $C98BE1
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioHardware4245Controller:
	JSL $C4B0EC		  ; 22 EC B0 C4 | Jump to subroutine long
	LDA #$7B			 ; A9 7B | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioRegisterSetter86 - Set Y register to $86 and accumulator to $6B
; Address: $C98BF0
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioRegisterSetter86:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	LDY #$86			 ; A0 86 | Load immediate value into Y register
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioAccumulatorTransfer - Transfer accumulator to X and clear accumulator
; Address: $C98BF9
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioAccumulatorTransfer:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioRegisterANDer - Perform AND operation with immediate value
; Address: $C98C0D
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioRegisterANDer:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$A0			 ; 29 A0 | Logical AND with accumulator (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioStackPusherX20 - Push X register and set to $20
; Address: $C98C13
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioStackPusherX20:
	JSL $C4B3A8		  ; 22 A8 B3 C4 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioORCompareLoader - OR operations with comparison and hardware loading
; Address: $C98C1B
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioORCompareLoader:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $6B			  ; C4 6B | Compare Y register (zero page)
	LDX $4F50			; AE 50 4F | Load from absolute address into X register

;------------------------------------------------------------------------------
; AudioMemoryAdder - Add memory with carry and compare operations
; Address: $C98C2B
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioMemoryAdder:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC ($8F,X)		  ; 61 8F | Add with carry ((zero page,X))
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $50AE60		  ; AF 60 AE 50 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; AudioHardwareRegisterController - Complex hardware register control with stack and transfers
; Address: $C98C39
; Size: 29 bytes
;------------------------------------------------------------------------------
AudioHardwareRegisterController:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STY $20C4			; 8C C4 20 | Store Y register to absolute address
	LDA $2E2260		  ; AF 60 22 2E | Load from absolute long address into accumulator
	CMP ($48,X)		  ; C1 48 | Compare accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioStackEffectiveLoader - Load with effective address push and stack operations
; Address: $C98C5B
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioStackEffectiveLoader:
	JSR $B578			; 20 78 B5 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	PEA #$CB22		   ; F4 22 CB | Push effective address to stack
	LDA ($C4),Y		  ; B1 C4 | Load from (zero page),Y into accumulator
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; AudioTripleStackPush - Push accumulator, X, and Y registers to stack
; Address: $C98C6D
; Size: 3 bytes
;------------------------------------------------------------------------------
AudioTripleStackPush:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; AudioHardware4F74Setter - Set hardware register $4F74 with OR operation
; Address: $C98C79
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioHardware4F74Setter:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; AudioSubtracter11OR - Subtract $11, OR operation, and set Y register to $70
; Address: $C98C8B
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioSubtracter11OR:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$11			 ; E9 11 | Subtract with carry (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	LDA #$12			 ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioMemoryComparator2 - Compare audio memory and branch always
; Address: $C98C9E
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioMemoryComparator2:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; AudioORProcessorX1C - Process OR operations and set X register to $1C
; Address: $C98CA8
; Size: 13 bytes
;------------------------------------------------------------------------------
AudioORProcessorX1C:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDA $F65E,X		  ; BD 5E F6 | Load from absolute,X into accumulator
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$1C			 ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioStackStorer - Load from Y-indexed memory and store to stack/zero page
; Address: $C98CC0
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioStackStorer:
	JSL $20C48D		  ; 22 8D C4 20 | Jump to subroutine long
	LDX $20AF,Y		  ; BE AF 20 | Load from absolute,Y into X register
	PHA				  ; 48 | Push accumulator to stack
	STA $FA			  ; 85 FA | Store accumulator to zero page

;------------------------------------------------------------------------------
; AudioHardware4F7AController - Control hardware register $4F7A with OR operations
; Address: $C98CCD
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioHardware4F7AController:
	JSR $8579			; 20 79 85 | Jump to subroutine
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $4F7A			; 8C 7A 4F | Store Y register to absolute address
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioHardwareRegisterOperator - Operate on hardware registers with overflow clear
; Address: $C98CDF
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioHardwareRegisterOperator:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDY $A3AF			; AC AF A3 | Load from absolute address into Y register
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EDE			; AD DE 4E | Load from absolute address into accumulator
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioFFLoader4F7A - Load $FF and control hardware register $4F7A
; Address: $C98CF2
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioFFLoader4F7A:
	JSR $AFAC			; 20 AC AF | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $4F7A			; 8C 7A 4F | Store Y register to absolute address
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioHardware4F7AController80 - Control hardware register $4F7A with $80 value
; Address: $C98D01
; Size: 16 bytes
;------------------------------------------------------------------------------
AudioHardware4F7AController80:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $85DE20		  ; AF 20 DE 85 | Load from absolute long address into accumulator
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	STY $4F7A			; 8C 7A 4F | Store Y register to absolute address

;------------------------------------------------------------------------------
; AudioMemoryIncrementer - Increment X and load long address, then return long
; Address: $C98D14
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioMemoryIncrementer:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $68FA7A		  ; AF 7A FA 68 | Load from absolute long address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioHardware42ZeroController - Control hardware registers $4249 and $4245 with zero operations
; Address: $C98D25
; Size: 19 bytes
;------------------------------------------------------------------------------
AudioHardware42ZeroController:
	JSR $B50E			; 20 0E B5 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	STZ $4249			; 9C 49 42 | Hardware register operation
	LDA #$79			 ; A9 79 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioHardware4249Reader - Read from hardware register $4249
; Address: $C98D3A
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioHardware4249Reader:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4249			; AD 49 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioContextSaver - Save complete audio context with interrupt disable
; Address: $C98D49
; Size: 16 bytes
;------------------------------------------------------------------------------
AudioContextSaver:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$199A		   ; F4 9A 19 | Push effective address to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; AudioHardware4F4CDecrementer - Decrement hardware register $4F4C value
; Address: $C98D5B
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioHardware4F4CDecrementer:
	JSR $B70D			; 20 0D B7 | Jump to subroutine
	PEA #$8D66		   ; F4 66 8D | Push effective address to stack
	LDA $4F4C			; AD 4C 4F | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioContextRestorer - Restore complete audio context and return long
; Address: $C98D67
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioContextRestorer:
	JSR $B783			; 20 83 B7 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Audio data block (not executable code)
; Address: $C98D75
; Size: 18 bytes
;------------------------------------------------------------------------------
AudioDataBlock_118:
	db $22, $72, $05, $C9   ; Data bytes
	db $01, $13			 ; Data bytes
	db $42, $11			 ; Data bytes (WDM instruction indicates data)
	db $C4, $09			 ; Data bytes
	db $7E, $00, $00		; Data bytes
	db $C9, $00			 ; Data bytes
	db $F0, $4E			 ; Data bytes
	db $AA				  ; Data byte

;------------------------------------------------------------------------------
; AudioBitTester - Test bits in memory with long call
; Address: $C98D8A
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioBitTester:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	BIT $FEE8			; 2C E8 FE | Test bits in accumulator (absolute)
	BEQ $3F			  ; F0 3F | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; AudioSimpleBitTester - Simple bit test and push
; Address: $C98D9A
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioSimpleBitTester:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	BIT $FEE8			; 2C E8 FE | Test bits in accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; AudioLoopProcessor - Process audio loop with counter and OR operations
; Address: $C98DAA
; Size: 30 bytes
;------------------------------------------------------------------------------
AudioLoopProcessor:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	BIT $FEE8			; 2C E8 FE | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CLD				  ; D8 | Clear decimal mode flag
	STA $F0C4			; 8D C4 F0 | Store accumulator to absolute address
	ORA $E8E8			; 0D E8 E8 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	PEA #$8DEB		   ; F4 EB 8D | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioSimpleLongLoader - Simple long address load and push
; Address: $C98DD1
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioSimpleLongLoader:
	LDA $C48DDA,X		; BF DA 8D C4 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioHardware4F50Controller - Control hardware register $4F50 and $4F6E operations
; Address: $C98DDB
; Size: 25 bytes
;------------------------------------------------------------------------------
AudioHardware4F50Controller:
	STX $0018			; 8E 18 00 | Store X register to absolute address
	STX $0015			; 8E 15 00 | Store X register to absolute address
	LDY $8E			  ; A4 8E | Load from zero page into Y register
	LDY $8E			  ; A4 8E | Load from zero page into Y register
	STA $8D68,X		  ; 9F 8E 68 8D | Store accumulator to absolute long,X
	EOR $42			  ; 45 42 | Hardware register operation
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	STZ $4F6E			; 9C 6E 4F | Store zero to absolute
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; AudioHardware4F50ORProcessor - OR processing with hardware register $4F50 operations
; Address: $C98DFA
; Size: 19 bytes
;------------------------------------------------------------------------------
AudioHardware4F50ORProcessor:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPX $C4B0			; EC B0 C4 | Compare X register (absolute)
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioCompareProcessor - Compare and rotate operations with branching
; Address: $C98E14
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioCompareProcessor:
	CPX #$B2			 ; E0 B2 | Compare X register (immediate)
	CPY $AD			  ; C4 AD | Compare Y register (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; AudioBranchLoader - Branch and load hardware register $4F50
; Address: $C98E27
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioBranchLoader:
	JSR $AFA7			; 20 A7 AF | Jump to subroutine
	BRA $AB			  ; 80 AB | Branch always
	LDX $4F50			; AE 50 4F | Load from absolute address into X register

;------------------------------------------------------------------------------
; AudioHardware4F8XController - Control hardware registers $4F8E, $4F8C, $4F90
; Address: $C98E2F
; Size: 23 bytes
;------------------------------------------------------------------------------
AudioHardware4F8XController:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC ($8F,X)		  ; 61 8F | Add with carry ((zero page,X))
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SBC $68			  ; E5 68 | Subtract with carry (zero page)
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F90			; 8D 90 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioHardware4FComplexController - Complex hardware register management with loop and comparisons
; Address: $C98E49
; Size: 39 bytes
;------------------------------------------------------------------------------
AudioHardware4FComplexController:
	JSR $AFFE			; 20 FE AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $43			  ; F0 43 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	STZ $4F6E			; 9C 6E 4F | Store zero to absolute
	LDA $4F8E			; AD 8E 4F | Load from absolute address into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4F8C			; AD 8C 4F | Load from absolute address into accumulator
	CMP #$7F			 ; C9 7F | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	LDA $4F90			; AD 90 4F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; AudioCompareLoader02 - Compare operation and load values $02 and $0C
; Address: $C98E7C
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioCompareLoader02:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPX $C4B0			; EC B0 C4 | Compare X register (absolute)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioInterruptBranchProcessor - Process interrupt with branch and increment
; Address: $C98E8E
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioInterruptBranchProcessor:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	BCC $C4			  ; 90 C4 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; AudioHardware4F92Controller - Control hardware register $4F92 with conditional branching
; Address: $C98E9A
; Size: 21 bytes
;------------------------------------------------------------------------------
AudioHardware4F92Controller:
	JSR $AFA7			; 20 A7 AF | Jump to subroutine
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	BRA $03			  ; 80 03 | Branch always
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	STY $4F92			; 8C 92 4F | Store Y register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F90			; 8D 90 4F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; AudioHardware42D2Controller - Complex hardware register $42D2 control with long addressing
; Address: $C98EB8
; Size: 33 bytes
;------------------------------------------------------------------------------
AudioHardware42D2Controller:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STA $FE20C4		  ; 8F C4 20 FE | Store accumulator to absolute long address
	LDA $0000A2		  ; AF A2 00 00 | Load from absolute long address into accumulator
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $26			  ; F0 26 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4EFA,Y		  ; B9 FA 4E | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioComparator4F8C - Compare with hardware register $4F8C and branch on carry
; Address: $C98EDD
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioComparator4F8C:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	CMP $4F8C			; CD 8C 4F | Compare accumulator (absolute)
	BCS $F0			  ; B0 F0 | Branch if carry set

;------------------------------------------------------------------------------
; AudioIncrementerBrancher - Increment X register twice and branch
; Address: $C98EE7
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioIncrementerBrancher:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STX $FAC4			; 8E C4 FA | Store X register to absolute address
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $D2			  ; 80 D2 | Branch always

;------------------------------------------------------------------------------
; AudioHardware4F924F7AController - Control hardware registers $4F92 and $4F7A
; Address: $C98EF7
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioHardware4F924F7AController:
	PHX				  ; DA | Push X register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4F92			; AD 92 4F | Load from absolute address into accumulator
	STY $4F7A			; 8C 7A 4F | Store Y register to absolute address
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioHardware4F7AClearer - Clear hardware register $4F7A
; Address: $C98F04
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioHardware4F7AClearer:
	JSL $C4B2B8		  ; 22 B8 B2 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioAddressCalculator - Calculate audio address with carry operations and hardware register control
; Address: $C98F18
; Size: 21 bytes
;------------------------------------------------------------------------------
AudioAddressCalculator:
	CLC				  ; 18 | Clear carry flag
	ADC #$F0			 ; 69 F0 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7FE37E		  ; AF 7E E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$78			 ; 69 78 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4F90			; AD 90 4F | Load from absolute address into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA $4F8E			; AD 8E 4F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; AudioSimpleTransferClear - Transfer accumulator to X and clear accumulator
; Address: $C98F2F
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioSimpleTransferClear:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioHardware42D2Adder - Add values and manipulate hardware register $42D2
; Address: $C98F36
; Size: 24 bytes
;------------------------------------------------------------------------------
AudioHardware42D2Adder:
	JSR $B497			; 20 97 B4 | Jump to subroutine
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation

;------------------------------------------------------------------------------
; AudioLongCall2 - Simple long call operation
; Address: $C98F5B
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioLongCall2:
	JSL $C79DD4		  ; 22 D4 9D C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioHardware42F2LoopProcessor - Process hardware register $42F2 with loop operations
; Address: $C98F61
; Size: 27 bytes
;------------------------------------------------------------------------------
AudioHardware42F2LoopProcessor:
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	PHX				  ; DA | Push X register to stack
	CLC				  ; 18 | Clear carry flag
	STA $9DFAC4		  ; 8F C4 FA 9D | Store accumulator to absolute long address
	WDM #$22			 ; 42 22 | Reserved instruction
	STZ $C02B			; 9C 2B C0 | Store zero to absolute
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Audio data block (not executable code)
; Address: $C98F82
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioDataBlock_13D:
	db $01, $00		  ; Data bytes
	db $01, $00		  ; Data bytes
	db $FE, $FF, $FF	 ; Data bytes

;------------------------------------------------------------------------------
; AudioHardware4F12Comparator - Compare hardware register $4F12 value with $FF
; Address: $C98F9E
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioHardware4F12Comparator:
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $55			  ; F0 55 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; AudioHardware4F74Setter53 - Set hardware register $4F74 to value $53
; Address: $C98FA8
; Size: 14 bytes
;------------------------------------------------------------------------------
AudioHardware4F74Setter53:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	STX $4F8C			; 8E 8C 4F | Store X register to absolute address
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioSubtracter18 - Subtract $18 from both X and Y registers
; Address: $C98FBA
; Size: 15 bytes
;------------------------------------------------------------------------------
AudioSubtracter18:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioMemoryComparator3 - Compare audio memory and branch always
; Address: $C98FD0
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioMemoryComparator3:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; AudioORComparator90 - OR with $90 and compare Y register
; Address: $C98FE8
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioORComparator90:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	CPY $FA			  ; C4 FA | Compare Y register (zero page)

;------------------------------------------------------------------------------
; AudioIncrementerBrancher2 - Increment X register twice and branch
; Address: $C98FF3
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioIncrementerBrancher2:
	JSR $AFAC			; 20 AC AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $A3			  ; 80 A3 | Branch always

;------------------------------------------------------------------------------
; AudioHardware4F7ASetter1F - Set hardware register $4F7A and load $1F
; Address: $C99005
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioHardware4F7ASetter1F:
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioLongCallLoader60 - Long call and load value $60
; Address: $C99012
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioLongCallLoader60:
	JSL $C4B2D8		  ; 22 D8 B2 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$60			 ; A9 60 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioTripleAddressPusher - Push three effective addresses to stack
; Address: $C99022
; Size: 9 bytes
;------------------------------------------------------------------------------
AudioTripleAddressPusher:
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$008F		   ; F4 8F 00 | Push effective address to stack
	PEA #$000C		   ; F4 0C 00 | Push effective address to stack

;------------------------------------------------------------------------------
; AudioHardware4F12LoopChecker - Check hardware register $4F12 in loop
; Address: $C9902B
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioHardware4F12LoopChecker:
	JSR $AFFE			; 20 FE AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $38			  ; F0 38 | Branch if equal

;------------------------------------------------------------------------------
; AudioCompareTransfer - Compare Y register and transfer accumulator to X
; Address: $C99039
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioCompareTransfer:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; AudioHardware4F72Controller - Control hardware register $4F72 with interrupt and branch operations
; Address: $C99041
; Size: 22 bytes
;------------------------------------------------------------------------------
AudioHardware4F72Controller:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	BCC $C4			  ; 90 C4 | Branch if carry clear
	STZ $4F6E			; 9C 6E 4F | Store zero to absolute
	ORA $8D			  ; 05 8D | Logical OR with accumulator (zero page)
	BVS $4F			  ; 70 4F | Branch if overflow set
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F72			; 8D 72 4F | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$46			 ; A9 46 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioAdder02 - Add with carry and load value $02
; Address: $C9905C
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioAdder02:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC ($B1,X)		  ; 61 B1 | Add with carry ((zero page,X))
	CPY $A3			  ; C4 A3 | Compare Y register (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioTripleStackPuller - Pull from stack and increment X register twice
; Address: $C99069
; Size: 11 bytes
;------------------------------------------------------------------------------
AudioTripleStackPuller:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $C0			  ; 80 C0 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; AudioHardware4F7AORY08 - OR operations and hardware register $4F7A control
; Address: $C99078
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioHardware4F7AORY08:
	PHX				  ; DA | Push X register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	STY $4F7A			; 8C 7A 4F | Store Y register to absolute address
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; AudioHardware4F7ASetter60 - Set hardware register $4F7A to value $60
; Address: $C99085
; Size: 10 bytes
;------------------------------------------------------------------------------
AudioHardware4F7ASetter60:
	JSL $C4B2B8		  ; 22 B8 B2 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; AudioMultipleAddressPusher - Push multiple effective addresses with transfer
; Address: $C99095
; Size: 18 bytes
;------------------------------------------------------------------------------
AudioMultipleAddressPusher:
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	PEA #$0090		   ; F4 90 00 | Push effective address to stack
	TXA				  ; 8A | Transfer X register to accumulator
	PEA #$0002		   ; F4 02 00 | Push effective address to stack
	PEA #$0091		   ; F4 91 00 | Push effective address to stack
	PEA #$0018		   ; F4 18 00 | Push effective address to stack
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; AudioHardware4F74Setter77 - Set hardware register $4F74 to value $77
; Address: $C990B3
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioHardware4F74Setter77:
	JSR $84BE			; 20 BE 84 | Jump to subroutine
	LDA #$77			 ; A9 77 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; AudioMemoryComparator4 - Compare audio memory and branch always
; Address: $C990C7
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioMemoryComparator4:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; AudioHardware4EFA45D2Controller - Control hardware registers $4EFA and $45D2 with shift operations
; Address: $C990D1
; Size: 17 bytes
;------------------------------------------------------------------------------
AudioHardware4EFA45D2Controller:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LSR $04F6			; 4E F6 04 | Logical shift right (absolute)
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; AudioLoader16Transfer - Load value $16 and transfer to Y register
; Address: $C990EA
; Size: 6 bytes
;------------------------------------------------------------------------------
AudioLoader16Transfer:
	JSR $AFBE			; 20 BE AF | Jump to subroutine
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; AudioLongCallComparator - Long call with Y register comparison and branch
; Address: $C99106
; Size: 8 bytes
;------------------------------------------------------------------------------
AudioLongCallComparator:
	JSL $3ADD22		  ; 22 22 DD 3A | Jump to subroutine long
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank12_DmaFunction_16D
; Address: $C9910E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_16D:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	LDX #$40			 ; A2 40 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_170
; Address: $C9911F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_170:
	JSL $C03DF2		  ; 22 F2 3D C0 | Jump to subroutine long
	LDX #$40			 ; A2 40 | Load immediate value into X register
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_174
; Address: $C99136
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_174:
	JSR $84BE			; 20 BE 84 | Jump to subroutine
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_176
; Address: $C9914A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_176:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_177
; Address: $C99154
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_177:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	EOR $F64E			; 4D 4E F6 | Exclusive OR with accumulator (absolute)
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_178
; Address: $C99166
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_178:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STX $91			  ; 86 91 | Store X register to zero page
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDX $A9AF,Y		  ; BE AF A9 | Load from absolute,Y into X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_17E
; Address: $C99186
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_17E:
	PHA				  ; 48 | Push accumulator to stack
	LDX #$94			 ; A2 94 | Load immediate value into X register
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_181
; Address: $C99196
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_181:
	JSR $84BE			; 20 BE 84 | Jump to subroutine
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_186
; Address: $C991BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_186:
	JSR $AFBE			; 20 BE AF | Jump to subroutine
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_18E
; Address: $C991DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_18E:
	JSR $84BE			; 20 BE 84 | Jump to subroutine
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_190
; Address: $C991F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_190:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_191
; Address: $C991FC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_191:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA $F64F			; 0D 4F F6 | Logical OR with accumulator (absolute)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDX $A9AF,Y		  ; BE AF A9 | Load from absolute,Y into X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_197
; Address: $C9921D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_197:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	REP #$00			 ; C2 00 | Reset processor status bits
	LDA #$92			 ; A9 92 | Load immediate value into accumulator
	STA $4F70			; 8D 70 4F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F72			; 8D 72 4F | Store accumulator to absolute address
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$48			 ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_199
; Address: $C99244
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_199:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC ($B1,X)		  ; 61 B1 | Add with carry ((zero page,X))
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$62			 ; C0 62 | Compare Y register (immediate)
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank12_DmaFunction_19D
; Address: $C99262
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_19D:
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_19E
; Address: $C9926F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_19E:
	JSL $C4B2B8		  ; 22 B8 B2 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1A0
; Address: $C9927F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1A0:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	REP #$00			 ; C2 00 | Reset processor status bits
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1A1
; Address: $C9928B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1A1:
	JSR $B50E			; 20 0E B5 | Jump to subroutine
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $4249			; 8D 49 42 | Hardware register operation
	LDA #$48			 ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1A2
; Address: $C99297
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1A2:
	JSL $C7C4B3		  ; 22 B3 C4 C7 | Jump to subroutine long
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$92			 ; A9 92 | Load immediate value into accumulator
	STA $4F70			; 8D 70 4F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F72			; 8D 72 4F | Store accumulator to absolute address
	LDA #$48			 ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1A3
; Address: $C992B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1A3:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4249			; AD 49 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1A5
; Address: $C992BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1A5:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC $C4B1,Y		  ; 79 B1 C4 | Add with carry (absolute,Y)
	LDX #$40			 ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1A7
; Address: $C992CA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1A7:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1AD
; Address: $C992EA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1AD:
	JSR $8499			; 20 99 84 | Jump to subroutine
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1AE
; Address: $C992F9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1AE:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$06			 ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B0
; Address: $C9930F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B0:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B1
; Address: $C99319
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B1:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ADC $50			  ; 65 50 | Add with carry (zero page)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDX $20AF,Y		  ; BE AF 20 | Load from absolute,Y into X register
	LDA $DA20FA		  ; AF FA 20 DA | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B4
; Address: $C99332
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B4:
	JSR $AFFE			; 20 FE AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $3A			  ; F0 3A | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B5
; Address: $C99340
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B5:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	PHX				  ; DA | Push X register to stack
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B7
; Address: $C9934F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B7:
	PLX				  ; FA | Pull X register from stack
	STZ $4F6E			; 9C 6E 4F | Store zero to absolute
	LDA #$94			 ; A9 94 | Load immediate value into accumulator
	STA $4F70			; 8D 70 4F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F72			; 8D 72 4F | Store accumulator to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$47			 ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B8
; Address: $C99365
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B8:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC ($B1,X)		  ; 61 B1 | Add with carry ((zero page,X))
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1B9
; Address: $C99372
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1B9:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $BE			  ; 80 BE | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1BF
; Address: $C9938D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1BF:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $854820		  ; AF 20 48 85 | Load from absolute long address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C0
; Address: $C993A2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C0:
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C1
; Address: $C993B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C1:
	JSL $C03ADD		  ; 22 DD 3A C0 | Jump to subroutine long
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDX #$40			 ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C2
; Address: $C993BA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C2:
	JSR $B817			; 20 17 B8 | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C3
; Address: $C993C1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C3:
	JSL $C48371		  ; 22 71 83 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C7
; Address: $C993D5
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C7:
	LDA $7F90			; AD 90 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F92			; AD 92 7F | Load from absolute address into accumulator
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 1E 00 C9 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BPL $03			  ; 10 03 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	STZ $A07F			; 9C 7F A0 | Store zero to absolute
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C8
; Address: $C99414
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C8:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $C7			  ; 90 C7 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1C9
; Address: $C99430
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1C9:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	BEQ $00			  ; F0 00 | Branch if equal
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1CA
; Address: $C9943C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1CA:
	JSR $B50E			; 20 0E B5 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $4249			; 9C 49 42 | Hardware register operation
	LDA #$49			 ; A9 49 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1CB
; Address: $C9944B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1CB:
	JSL $C7C4B3		  ; 22 B3 C4 C7 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$49			 ; A9 49 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1CC
; Address: $C9945E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1CC:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4249			; AD 49 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1CE
; Address: $C99468
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1CE:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	BCS $C4			  ; B0 C4 | Branch if carry set
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D0
; Address: $C99475
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D0:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDA $E32E22		  ; AF 22 2E E3 | Load from absolute long address into accumulator
	CMP ($A8,X)		  ; C1 A8 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D1
; Address: $C99484
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D1:
	JSR $8508			; 20 08 85 | Jump to subroutine
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $43			  ; 10 43 | Branch if positive

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D2
; Address: $C9948D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D2:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDX $48CA			; AE CA 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $7F90			; AD 90 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F92			; AD 92 7F | Load from absolute address into accumulator
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDY #$14			 ; A0 14 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D3
; Address: $C994B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D3:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D5
; Address: $C994C6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D5:
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $B7CA20		  ; AF 20 CA B7 | Load from absolute long address into accumulator
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D8
; Address: $C994DB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D8:
	STA $4F94			; 8D 94 4F | Store accumulator to absolute address
	PHY				  ; 5A | Push Y register to stack
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1D9
; Address: $C994E2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1D9:
	JSL $C4C699		  ; 22 99 C6 C4 | Jump to subroutine long
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $4F92			; 8D 92 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $4F90			; 8D 90 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	LDX $48CE			; AE CE 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1DA
; Address: $C99502
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1DA:
	JSL $C4CBBD		  ; 22 BD CB C4 | Jump to subroutine long
	BRA $08			  ; 80 08 | Branch always
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address
	BCC $4F			  ; 90 4F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1DB
; Address: $C99510
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1DB:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $4F92			; 6D 92 4F | Add with carry (absolute)
	DEC $4F94			; CE 94 4F | Decrement (absolute)
	BNE $E2			  ; D0 E2 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1DD
; Address: $C99522
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1DD:
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1DE
; Address: $C99531
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1DE:
	JSL $C4B2B8		  ; 22 B8 B2 C4 | Jump to subroutine long
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1E1
; Address: $C99549
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1E1:
	JSR $8508			; 20 08 85 | Jump to subroutine
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1E3
; Address: $C99552
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1E3:
	JSL $C4C472		  ; 22 72 C4 C4 | Jump to subroutine long
	LDX $48CA			; AE CA 48 | Load from absolute address into X register
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $7F90			; AD 90 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F92			; AD 92 7F | Load from absolute address into accumulator
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1E4
; Address: $C99569
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1E4:
	JSR $B7A7			; 20 A7 B7 | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1E5
; Address: $C99572
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1E5:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1E6
; Address: $C9957F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1E6:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $B7CA20		  ; AF 20 CA B7 | Load from absolute long address into accumulator
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1EA
; Address: $C9959D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1EA:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1EC
; Address: $C995AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1EC:
	JSR $960C			; 20 0C 96 | Jump to subroutine
	STZ $4249			; 9C 49 42 | Hardware register operation
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1ED
; Address: $C995B8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1ED:
	JSL $C7C4B3		  ; 22 B3 C4 C7 | Jump to subroutine long
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1EE
; Address: $C995C5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1EE:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4249			; AD 49 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1F5
; Address: $C995EB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1F5:
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1F9
; Address: $C9960C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1F9:
	PHY				  ; 5A | Push Y register to stack
	LDA $7FE37E		  ; AF 7E E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$88			 ; 69 88 | Add with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($7A,X)		  ; 01 7A | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1FA
; Address: $C9961C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1FA:
	PHX				  ; DA | Push X register to stack
	LDA #$9F			 ; A9 9F | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	EOR $20FA,Y		  ; 59 FA 20 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1FC
; Address: $C99632
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1FC:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_1FF
; Address: $C99648
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_1FF:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $865920		  ; AF 20 59 86 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_200
; Address: $C99655
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_200:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STA ($96),Y		  ; 91 96 | Store accumulator to (zero page),Y
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_202
; Address: $C99662
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_202:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	STA $4F70			; 8D 70 4F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F72			; 8D 72 4F | Store accumulator to absolute address
	LDA #$68			 ; A9 68 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_20C
; Address: $C996AD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_20C:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_210
; Address: $C996C8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_210:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	INC $68			  ; E6 68 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_213
; Address: $C996E0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_213:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $B06720		  ; AF 20 67 B0 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_216
; Address: $C996F3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_216:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	BNE $00			  ; D0 00 | Branch if not equal
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_218
; Address: $C9970B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_218:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $DA			  ; C4 DA | Compare Y register (zero page)
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_21D
; Address: $C9972D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_21D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_220
; Address: $C99743
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_220:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $0016A9		  ; AF A9 16 00 | Load from absolute long address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_222
; Address: $C99755
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_222:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$A9			 ; C0 A9 | Compare Y register (immediate)
	CPY $AE			  ; C4 AE | Compare Y register (zero page)
	BVC $4F			  ; 50 4F | Branch if overflow clear
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_225
; Address: $C99772
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_225:
	JSR $8659			; 20 59 86 | Jump to subroutine
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_227
; Address: $C9977D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_227:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STA ($96),Y		  ; 91 96 | Store accumulator to (zero page),Y
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $0040A0		  ; AF A0 40 00 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_228
; Address: $C99791
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_228:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $869D20		  ; AF 20 9D 86 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_22D
; Address: $C997AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_22D:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	STA $4F70			; 8D 70 4F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F72			; 8D 72 4F | Store accumulator to absolute address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_22E
; Address: $C997C4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_22E:
	JSL $C4B1B9		  ; 22 B9 B1 C4 | Jump to subroutine long
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$65			 ; A9 65 | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_230
; Address: $C997E2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_230:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	LDY #$18			 ; A0 18 | Load immediate value into Y register
	STA $4810			; 8D 10 48 | Store accumulator to absolute address
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_232
; Address: $C997F8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_232:
	JSR $960C			; 20 0C 96 | Jump to subroutine
	STZ $4249			; 9C 49 42 | Hardware register operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $C7			  ; C4 C7 | Compare Y register (zero page)
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_233
; Address: $C9980B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_233:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4249			; AD 49 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_23C
; Address: $C99832
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_23C:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_23D
; Address: $C99841
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_23D:
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA $4F7C			; AD 7C 4F | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	LDA #$13			 ; A9 13 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_23F
; Address: $C99852
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_23F:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $DA			  ; C4 DA | Compare Y register (zero page)
	LDA $4F7C			; AD 7C 4F | Load from absolute address into accumulator
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_241
; Address: $C99864
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_241:
	JSR $AFA7			; 20 A7 AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $39			  ; F0 39 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_243
; Address: $C9987E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_243:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_244
; Address: $C99896
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_244:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA ($C4),Y		  ; B1 C4 | Load from (zero page),Y into accumulator
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_245
; Address: $C998A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_245:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $BF			  ; 80 BF | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_24A
; Address: $C998B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_24A:
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_24C
; Address: $C998C7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_24C:
	PLX				  ; FA | Pull X register from stack
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_251
; Address: $C998DC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_251:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$14			 ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_253
; Address: $C998F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_253:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $DA			  ; C4 DA | Compare Y register (zero page)
	LDX #$12			 ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_254
; Address: $C998FF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_254:
	JSR $AFB1			; 20 B1 AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $3D			  ; F0 3D | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_257
; Address: $C9991F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_257:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_258
; Address: $C99935
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_258:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA ($C4),Y		  ; B1 C4 | Load from (zero page),Y into accumulator
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_259
; Address: $C99942
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_259:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $BB			  ; 80 BB | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_25E
; Address: $C99958
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_25E:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_25F
; Address: $C9995E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_25F:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	BCS $20			  ; B0 20 | Branch if carry set

;------------------------------------------------------------------------------
; Bank12_DmaFunction_261
; Address: $C9996E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_261:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	DEC $A900,X		  ; DE 00 A9 | Decrement (absolute,X)
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$15			 ; A9 15 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_263
; Address: $C99986
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_263:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $DA			  ; C4 DA | Compare Y register (zero page)
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_264
; Address: $C99991
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_264:
	JSR $AFB1			; 20 B1 AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $41			  ; F0 41 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_266
; Address: $C999AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_266:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_267
; Address: $C999BB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_267:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CMP $A300,X		  ; DD 00 A3 | Compare accumulator (absolute,X)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_268
; Address: $C999CB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_268:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA ($C4),Y		  ; B1 C4 | Load from (zero page),Y into accumulator
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_269
; Address: $C999D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_269:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $B7			  ; 80 B7 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_26B
; Address: $C999E3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_26B:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $854820		  ; AF 20 48 85 | Load from absolute long address into accumulator
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_26F
; Address: $C999FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_26F:
	JSR $8579			; 20 79 85 | Jump to subroutine
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_270
; Address: $C99A16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_270:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA ($C4),Y		  ; B1 C4 | Load from (zero page),Y into accumulator
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_272
; Address: $C99A23
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_272:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	ROR $AE00			; 6E 00 AE | Rotate right (absolute)
	BVC $4F			  ; 50 4F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_273
; Address: $C99A2C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_273:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	DEC $2085,X		  ; DE 85 20 | Decrement (absolute,X)
	LDA $A9DA60		  ; AF 60 DA A9 | Load from absolute long address into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_274
; Address: $C99A44
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_274:
	JSR $B75F			; 20 5F B7 | Jump to subroutine
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_275
; Address: $C99A4D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_275:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $4F8C9C		  ; AF 9C 8C 4F | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_276
; Address: $C99A5A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_276:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$97			 ; C0 97 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_277
; Address: $C99A6E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_277:
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_278
; Address: $C99A75
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_278:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	BCS $20			  ; B0 20 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	STA $9C			  ; 85 9C | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	STZ $4F6E			; 9C 6E 4F | Store zero to absolute
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_279
; Address: $C99AA1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_279:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA ($C4),Y		  ; B1 C4 | Load from (zero page),Y into accumulator
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_27A
; Address: $C99AAE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_27A:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $4F92			; 6D 92 4F | Add with carry (absolute)
	STA $4F92			; 8D 92 4F | Store accumulator to absolute address
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $CA			  ; 80 CA | Branch always
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $4F92			; ED 92 4F | Subtract with carry (absolute)
	BCC $06			  ; 90 06 | Branch if carry clear
	BEQ $04			  ; F0 04 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_27E
; Address: $C99ADD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_27E:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	CLV				  ; B8 | Clear overflow flag
	CPY $A0			  ; C4 A0 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_280
; Address: $C99AE7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_280:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $AFBE20		  ; AF 20 BE AF | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_284
; Address: $C99B01
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_284:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	INC $00			  ; E6 00 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_285
; Address: $C99B08
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_285:
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$05			 ; A9 05 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_287
; Address: $C99B1D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_287:
	JSL $C4782E		  ; 22 2E 78 C4 | Jump to subroutine long
	STZ $4F8E			; 9C 8E 4F | Store zero to absolute
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_288
; Address: $C99B27
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_288:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SBC $4F			  ; E5 4F | Subtract with carry (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STZ $C02B			; 9C 2B C0 | Store zero to absolute
	LDA $4F8E			; AD 8E 4F | Load from absolute address into accumulator
	BNE $17			  ; D0 17 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_289
; Address: $C99B38
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_289:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	SBC $4F			  ; E5 4F | Subtract with carry (zero page)
	BCC $0E			  ; 90 0E | Branch if carry clear
	INC $4F8E			; EE 8E 4F | Increment (absolute)
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_28A
; Address: $C99B47
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_28A:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	LDA $4F8C			; AD 8C 4F | Load from absolute address into accumulator
	BEQ $DB			  ; F0 DB | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_28B
; Address: $C99B54
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_28B:
	JSL $C047B2		  ; 22 B2 47 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	BVC $F6			  ; 50 F6 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_28D
; Address: $C99B5F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_28D:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_28F
; Address: $C99B6F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_28F:
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STZ $C02B			; 9C 2B C0 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank12_DmaFunction_290
; Address: $C99B77
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_290:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))
	BCC $F3			  ; 90 F3 | Branch if carry clear
	INC $4F8C			; EE 8C 4F | Increment (absolute)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_291
; Address: $C99B84
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_291:
	JSR $B6DA			; 20 DA B6 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_292
; Address: $C99B8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_292:
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_293
; Address: $C99B97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_293:
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_294
; Address: $C99B9E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_294:
	JSL $C4C74A		  ; 22 4A C7 C4 | Jump to subroutine long
	STZ $4F90			; 9C 90 4F | Store zero to absolute
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $4F94			; 8D 94 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	LDX $48D0			; AE D0 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_295
; Address: $C99BB4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_295:
	JSL $C4CEE2		  ; 22 E2 CE C4 | Jump to subroutine long
	BRA $06			  ; 80 06 | Branch always
	LDY $7F			  ; A4 7F | Load from zero page into Y register
	BCC $4F			  ; 90 4F | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_297
; Address: $C99BC5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_297:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	BPL $03			  ; 10 03 | Branch if positive
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	LDY $4F8C			; AC 8C 4F | Load from absolute address into Y register
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BNE $CA			  ; D0 CA | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_299
; Address: $C99BE8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_299:
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_29A
; Address: $C99BED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_29A:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BIT $A0			  ; 24 A0 | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_29B
; Address: $C99BF3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_29B:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $AFFE20		  ; AF 20 FE AF | Load from absolute long address into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $45			  ; F0 45 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_29C
; Address: $C99C0E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_29C:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_29F
; Address: $C99C29
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_29F:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A1
; Address: $C99C33
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A1:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	BCS $C4			  ; B0 C4 | Branch if carry set
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A2
; Address: $C99C3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A2:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A3
; Address: $C99C48
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A3:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $B3			  ; 80 B3 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A4
; Address: $C99C53
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A4:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $122260		  ; AF 60 22 12 | Load from absolute long address into accumulator
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	PHX				  ; DA | Push X register to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A6
; Address: $C99C6C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A6:
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A8
; Address: $C99C80
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A8:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2A9
; Address: $C99C8D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2A9:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AF 9D C4 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF A9 9D C4 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF AD 9D C4 | Load from absolute long,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF AB 9D C4 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2AB
; Address: $C99CBB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2AB:
	JSR $AFB1			; 20 B1 AF | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BCC $D8			  ; 90 D8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2AC
; Address: $C99CC5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2AC:
	JSR $844F			; 20 4F 84 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2AE
; Address: $C99CD2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2AE:
	PHY				  ; 5A | Push Y register to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$89			 ; C0 89 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2AF
; Address: $C99CDA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2AF:
	STA $22C4,X		  ; 9D C4 22 | Store accumulator to absolute,X
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)
	STZ $01			  ; 64 01 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B0
; Address: $C99CE2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B0:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDA #$4C			 ; A9 4C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B1
; Address: $C99CF7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B1:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B3
; Address: $C99D01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B3:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STA $A2C4,X		  ; 9D C4 A2 | Store accumulator to absolute,X
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B5
; Address: $C99D0E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B5:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LSR $9D			  ; 46 9D | Logical shift right (zero page)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$46			 ; C0 46 | Compare Y register (immediate)
	STA $20C4,X		  ; 9D C4 20 | Store accumulator to absolute,X
	LDA $DA20FA		  ; AF FA 20 DA | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B7
; Address: $C99D26
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B7:
	JSL $C1E64D		  ; 22 4D E6 C1 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	BRA $A0			  ; 80 A0 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B8
; Address: $C99D30
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B8:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	CLV				  ; B8 | Clear overflow flag
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $8C9C60		  ; AF 60 9C 8C | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2B9
; Address: $C99D3E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2B9:
	JSL $C4B0D6		  ; 22 D6 B0 C4 | Jump to subroutine long
	INC $4F8C			; EE 8C 4F | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2BA
; Address: $C99D46
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2BA:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	BVS $01			  ; 70 01 | Branch if overflow set
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2BB
; Address: $C99D55
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2BB:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 79 9D C4 | Load from absolute long,X into accumulator
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDY #$60			 ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2BC
; Address: $C99D65
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2BC:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2BE
; Address: $C99D6F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2BE:
	JSL $C4B0D6		  ; 22 D6 B0 C4 | Jump to subroutine long
	LDA $4F8C			; AD 8C 4F | Load from absolute address into accumulator
	BEQ $CE			  ; F0 CE | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2BF
; Address: $C99D79
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2BF:
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2C2
; Address: $C99DA0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2C2:
	PHY				  ; 5A | Push Y register to stack
	BCC $E9			  ; 90 E9 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2C3
; Address: $C99DAB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2C3:
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $5600			; 0E 00 56 | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2C4
; Address: $C99DB7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2C4:
	ASL $5500			; 0E 00 55 | Arithmetic shift left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	ASL $5600			; 0E 00 56 | Arithmetic shift left (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	ASL $4800			; 0E 00 48 | Arithmetic shift left (absolute)
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2C5
; Address: $C99DD1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2C5:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2C7
; Address: $C99DDB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2C7:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	BCS $C4			  ; B0 C4 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2CB
; Address: $C99DEF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2CB:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $0365A9		  ; AF A9 65 03 | Load from absolute long address into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2CD
; Address: $C99E0A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2CD:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2CE
; Address: $C99E14
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2CE:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	DEC $F651			; CE 51 F6 | Decrement (absolute)
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	BVC $4F			  ; 50 4F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2CF
; Address: $C99E1F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2CF:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	BCC $C4			  ; 90 C4 | Branch if carry clear
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D0
; Address: $C99E2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D0:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA $C49F			; AD 9F C4 | Load from absolute address into accumulator
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D3
; Address: $C99E40
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D3:
	JSR $AFB1			; 20 B1 AF | Jump to subroutine
	INY				  ; C8 | Increment Y register
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D4
; Address: $C99E49
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D4:
	JSR $AFA7			; 20 A7 AF | Jump to subroutine
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D5
; Address: $C99E50
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D5:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D6
; Address: $C99E5E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D6:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $DA20FA		  ; AF FA 20 DA | Load from absolute long address into accumulator
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D7
; Address: $C99E6F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D7:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $854820		  ; AF 20 48 85 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2D9
; Address: $C99E7F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2D9:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CPX $A900			; EC 00 A9 | Compare X register (absolute)
	STZ $03			  ; 64 03 | Store zero to zero page
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2DA
; Address: $C99E91
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2DA:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	LDA $4F7C			; AD 7C 4F | Load from absolute address into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$28			 ; E9 28 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$80			 ; E9 80 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2DC
; Address: $C99EAF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2DC:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)
	STA $AE00,Y		  ; 99 00 AE | Store accumulator to absolute,Y
	BVC $4F			  ; 50 4F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2DD
; Address: $C99EBF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2DD:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	STA				  ; 9F C4 A9 13 | Store accumulator to absolute long,X
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2E0
; Address: $C99EDF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2E0:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	JMP $2002F6		  ; 5C F6 02 20 | Jump to address long
	LDA $C27822		  ; AF 22 78 C2 | Load from absolute long address into accumulator
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	STX $FA			  ; 86 FA | Store X register to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2E5
; Address: $C99F03
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2E5:
	STA				  ; 9F C4 A9 71 | Store accumulator to absolute long,X
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2E8
; Address: $C99F18
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2E8:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDX $BDAF,Y		  ; BE AF BD | Load from absolute,Y into X register
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2EA
; Address: $C99F2D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2EA:
	JSR $8548			; 20 48 85 | Jump to subroutine
	LDA #$13			 ; A9 13 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2EC
; Address: $C99F39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2EC:
	JSL $C047B2		  ; 22 B2 47 C0 | Jump to subroutine long
	CMP ($5C),Y		  ; D1 5C | Compare accumulator ((zero page),Y)
	STZ $7FBE			; 9C BE 7F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2F4
; Address: $C99F5A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2F4:
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2F8
; Address: $C99F76
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2F8:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2F9
; Address: $C99F82
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2F9:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	STX $33DA			; 8E DA 33 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2FD
; Address: $C99FA2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2FD:
	JSR $AFAC			; 20 AC AF | Jump to subroutine
	DEX				  ; CA | Decrement X register
	BNE $F6			  ; D0 F6 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_2FF
; Address: $C99FAD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_2FF:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_300
; Address: $C99FBB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_300:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	DEC $F651			; CE 51 F6 | Decrement (absolute)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_301
; Address: $C99FC5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_301:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $4F6E			; 9C 6E 4F | Store zero to absolute
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	LDX $4F50			; AE 50 4F | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_302
; Address: $C99FDA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_302:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPX $C4B0			; EC B0 C4 | Compare X register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_305
; Address: $C99FE8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_305:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_307
; Address: $C99FFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_307:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_308
; Address: $C9A009
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_308:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ADC $F659			; 6D 59 F6 | Add with carry (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$C5			 ; C0 C5 | Compare Y register (immediate)
	LDY #$C4			 ; A0 C4 | Load immediate value into Y register
	LDX #$50			 ; A2 50 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_30A
; Address: $C9A01E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_30A:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$69			 ; A9 69 | Load immediate value into accumulator
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDY #$70			 ; A0 70 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_30B
; Address: $C9A033
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_30B:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_30D
; Address: $C9A03D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_30D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	BCS $C4			  ; B0 C4 | Branch if carry set
	LDX #$50			 ; A2 50 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_311
; Address: $C9A051
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_311:
	JSR $AFAC			; 20 AC AF | Jump to subroutine
	LDA #$13			 ; A9 13 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_314
; Address: $C9A06D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_314:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	JMP $2201F6		  ; 5C F6 01 22 | Jump to address long
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)
	INC $A900			; EE 00 A9 | Increment (absolute)
	JMP ($8D03)		  ; 6C 03 8D | Jump to address (absolute indirect)
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_317
; Address: $C9A08F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_317:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $2ABA22		  ; AF 22 BA 2A | Load from absolute long address into accumulator
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $DA20FA		  ; AF FA 20 DA | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_31F
; Address: $C9A0C9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_31F:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_320
; Address: $C9A0D7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_320:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ADC $F659			; 6D 59 F6 | Add with carry (absolute)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_324
; Address: $C9A0EE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_324:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_326
; Address: $C9A105
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_326:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_327
; Address: $C9A10F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_327:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	ADC ($53,X)		  ; 61 53 | Add with carry ((zero page,X))
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank12_DmaFunction_328
; Address: $C9A122
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_328:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	LDA ($C4,X)		  ; A1 C4 | Load from (zero page,X) into accumulator
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $33DA			; 8D DA 33 | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_32E
; Address: $C9A153
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_32E:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ADC ($53,X)		  ; 61 53 | Add with carry ((zero page,X))
	BCC $E7			  ; 90 E7 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_335
; Address: $C9A171
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_335:
	JSR $AFFE			; 20 FE AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_336
; Address: $C9A185
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_336:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	CMP $33DA			; CD DA 33 | Compare accumulator (absolute)
	BMI $06			  ; 30 06 | Branch if negative

;------------------------------------------------------------------------------
; Bank12_DmaFunction_339
; Address: $C9A19C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_339:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $F3			  ; F0 F3 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_33A
; Address: $C9A1A9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_33A:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY #$A1			 ; C0 A1 | Compare Y register (immediate)
	CPY $AD			  ; C4 AD | Compare Y register (zero page)
	CMP #$FB			 ; C9 FB | Compare accumulator (immediate)
	LDX $4F8E			; AE 8E 4F | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_33B
; Address: $C9A1B6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_33B:
	JSL $C4A2F9		  ; 22 F9 A2 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $B8			  ; 80 B8 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_33C
; Address: $C9A1C0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_33C:
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_33E
; Address: $C9A1CE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_33E:
	PLX				  ; FA | Pull X register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_340
; Address: $C9A1DA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_340:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_341
; Address: $C9A1DF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_341:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_342
; Address: $C9A1EF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_342:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $0001,Y		  ; D9 01 00 | Compare accumulator (absolute,Y)
	BCC $0C			  ; 90 0C | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $EA			  ; 80 EA | Branch always
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_343
; Address: $C9A21C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_343:
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $0002,Y		  ; B9 02 00 | Load from absolute,Y into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	PHX				  ; DA | Push X register to stack
	ROR $DA8F,X		  ; 7E 8F DA | Rotate right (absolute,X)
	ROR $03B9,X		  ; 7E B9 03 | Rotate right (absolute,X)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_344
; Address: $C9A241
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_344:
	CLC				  ; 18 | Clear carry flag
	ROR $DC8F,X		  ; 7E 8F DC | Rotate right (absolute,X)
	ROR $9C22,X		  ; 7E 22 9C | Rotate right (absolute,X)
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_345
; Address: $C9A24F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_345:
	JSR $80FA			; 20 FA 80 | Jump to subroutine
	BCS $A9			  ; B0 A9 | Branch if carry set
	STY $08			  ; 84 08 | Store Y register to zero page
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_346
; Address: $C9A259
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_346:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $B75F20		  ; AF 20 5F B7 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_349
; Address: $C9A26C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_349:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CMP $A900,Y		  ; D9 00 A9 | Compare accumulator (absolute,Y)
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_34B
; Address: $C9A283
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_34B:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_34C
; Address: $C9A28D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_34C:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	ROR $55			  ; 66 55 | Rotate right (zero page)
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_34D
; Address: $C9A2A0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_34D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	LDA ($C4,X)		  ; A1 C4 | Load from (zero page,X) into accumulator
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $33DA			; 8D DA 33 | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_352
; Address: $C9A2C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_352:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F0			  ; 90 F0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_353
; Address: $C9A2D1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_353:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ROR $55			  ; 66 55 | Rotate right (zero page)
	BCC $E7			  ; 90 E7 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_356
; Address: $C9A2E0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_356:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $904A22		  ; AF 22 4A 90 | Load from absolute long address into accumulator
	CMP #$FA			 ; C9 FA | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_35A
; Address: $C9A2F9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_35A:
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 00 00 C4 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $1A			  ; F0 1A | Branch if equal
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 26 A3 C4 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_35D
; Address: $C9A318
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_35D:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	BRA $DA			  ; 80 DA | Branch always
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_360
; Address: $C9A32B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_360:
	EOR $50E7,X		  ; 5D E7 50 | Exclusive OR with accumulator (absolute,X)
	WDM #$40			 ; 42 40 | Reserved instruction
	WDM #$30			 ; 42 30 | Reserved instruction
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	AND ($10,X)		  ; 21 10 | Logical AND with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STZ $4F7C			; 9C 7C 4F | Store zero to absolute
	LDA #$84			 ; A9 84 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_361
; Address: $C9A34A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_361:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $B75F20		  ; AF 20 5F B7 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_365
; Address: $C9A363
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_365:
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_367
; Address: $C9A374
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_367:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_368
; Address: $C9A37E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_368:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	INX				  ; E8 | Increment X register
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	STZ $2200			; 9C 00 22 | Store zero to absolute
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$DA			 ; C0 DA | Compare Y register (immediate)
	LDA ($C4,X)		  ; A1 C4 | Load from (zero page,X) into accumulator
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $33DA			; 8D DA 33 | Store accumulator to absolute address
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator
	LDY $4F7C			; AC 7C 4F | Load from absolute address into Y register
	BNE $03			  ; D0 03 | Branch if not equal
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_36A
; Address: $C9A3B0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_36A:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $C4			  ; A4 C4 | Load from zero page into Y register
	STZ $4F8C			; 9C 8C 4F | Store zero to absolute
	LDA $4F8C			; AD 8C 4F | Load from absolute address into accumulator
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCS $10			  ; B0 10 | Branch if carry set

;------------------------------------------------------------------------------
; Bank12_DmaFunction_36B
; Address: $C9A3C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_36B:
	JSL $C02BB2		  ; 22 B2 2B C0 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_370
; Address: $C9A3E2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_370:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	BCC $CF			  ; 90 CF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_377
; Address: $C9A40A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_377:
	JSR $AFFE			; 20 FE AF | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $26			  ; F0 26 | Branch if equal
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_378
; Address: $C9A41E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_378:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	CMP $33DA			; CD DA 33 | Compare accumulator (absolute)
	BMI $06			  ; 30 06 | Branch if negative

;------------------------------------------------------------------------------
; Bank12_DmaFunction_379
; Address: $C9A42B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_379:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BRA $F5			  ; 80 F5 | Branch always
	PLX				  ; FA | Pull X register from stack
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_37A
; Address: $C9A435
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_37A:
	JSL $C4A43F		  ; 22 3F A4 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $D2			  ; 80 D2 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_37B
; Address: $C9A43F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_37B:
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_37C
; Address: $C9A449
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_37C:
	JSL $C4B2D8		  ; 22 D8 B2 C4 | Jump to subroutine long
	LDA $FBC9			; AD C9 FB | Load from absolute address into accumulator
	LDX #$36			 ; A2 36 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_37D
; Address: $C9A453
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_37D:
	JSL $C4A2F9		  ; 22 F9 A2 C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_37F
; Address: $C9A463
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_37F:
	INC $4F8C			; EE 8C 4F | Increment (absolute)
	LDA #$66			 ; A9 66 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_380
; Address: $C9A46C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_380:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_381
; Address: $C9A472
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_381:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF A5 A4 C4 | Load from absolute long,X into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP ($12),Y		  ; D1 12 | Compare accumulator ((zero page),Y)
	CPY #$AA			 ; C0 AA | Compare Y register (immediate)
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	LDA $4F7C			; AD 7C 4F | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_382
; Address: $C9A493
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_382:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_384
; Address: $C9A49D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_384:
	JSL $C4B0D6		  ; 22 D6 B0 C4 | Jump to subroutine long
	DEC $4F8C			; CE 8C 4F | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_387
; Address: $C9A4AF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_387:
	JSR $B067			; 20 67 B0 | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $4A			  ; F0 4A | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_388
; Address: $C9A4BF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_388:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_38B
; Address: $C9A4E2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_38B:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA $C4			  ; A5 C4 | Load from zero page into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_38D
; Address: $C9A4F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_38D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA $C4			  ; A5 C4 | Load from zero page into accumulator
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_38F
; Address: $C9A4FF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_38F:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $AE			  ; 80 AE | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_391
; Address: $C9A50B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_391:
	PHX				  ; DA | Push X register to stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_392
; Address: $C9A51B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_392:
	JSL $C4B353		  ; 22 53 B3 C4 | Jump to subroutine long
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $6B			  ; C4 6B | Compare Y register (zero page)
	STZ $4F8E			; 9C 8E 4F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank12_DmaFunction_394
; Address: $C9A52D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_394:
	JSR $84BE			; 20 BE 84 | Jump to subroutine
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_396
; Address: $C9A543
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_396:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$B9			 ; C0 B9 | Compare Y register (immediate)
	LDA $C4			  ; A5 C4 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_398
; Address: $C9A554
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_398:
	JSR $B067			; 20 67 B0 | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $46			  ; F0 46 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_39A
; Address: $C9A56A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_39A:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $4F6E			; 8D 6E 4F | Store accumulator to absolute address
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_39B
; Address: $C9A577
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_39B:
	STA $4245			; 8D 45 42 | Hardware register operation
	LDY #$59			 ; A0 59 | Load immediate value into Y register
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$5A			 ; A0 5A | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_39D
; Address: $C9A593
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_39D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LDA $C4			  ; A5 C4 | Load from zero page into accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_39E
; Address: $C9A5A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_39E:
	JSR $AFB9			; 20 B9 AF | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $B2			  ; 80 B2 | Branch always
	INC $4F8E			; EE 8E 4F | Increment (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3A4
; Address: $C9A5BC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3A4:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	TSX				  ; BA | Transfer stack pointer to X register
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STZ $C02B			; 9C 2B C0 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3A5
; Address: $C9A5C8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3A5:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	TSX				  ; BA | Transfer stack pointer to X register
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA $4F8E			; AD 8E 4F | Load from absolute address into accumulator
	BNE $33			  ; D0 33 | Branch if not equal
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3A7
; Address: $C9A5E1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3A7:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	LDA $4F8E			; AD 8E 4F | Load from absolute address into accumulator
	BEQ $F7			  ; F0 F7 | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3A8
; Address: $C9A5EA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3A8:
	JSL $C047B2		  ; 22 B2 47 C0 | Jump to subroutine long
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3A9
; Address: $C9A5F4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3A9:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SBC $F650,Y		  ; F9 50 F6 | Subtract with carry (absolute,Y)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3AB
; Address: $C9A600
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3AB:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	SBC $F650,Y		  ; F9 50 F6 | Subtract with carry (absolute,Y)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3AE
; Address: $C9A610
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3AE:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CPX $00			  ; E4 00 | Compare X register (zero page)
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B0
; Address: $C9A629
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B0:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B1
; Address: $C9A633
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B1:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B2
; Address: $C9A642
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B2:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 3A A7 C4 | Load from absolute long,X into accumulator
	STA $4249			; 8D 49 42 | Hardware register operation
	LDA $7FE374		  ; AF 74 E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7FE37E		  ; AF 7E E3 7F | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B3
; Address: $C9A675
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B3:
	JSL $C7C4B3		  ; 22 B3 C4 C7 | Jump to subroutine long
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B7
; Address: $C9A68C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B7:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	BCS $C4			  ; B0 C4 | Branch if carry set
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B8
; Address: $C9A696
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B8:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	BIT $F65C			; 2C 5C F6 | Test bits in accumulator (absolute)
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3B9
; Address: $C9A6A1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3B9:
	JSR $AFB1			; 20 B1 AF | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BCC $93			  ; 90 93 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3BC
; Address: $C9A6B5
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3BC:
	JSL $C4C74A		  ; 22 4A C7 C4 | Jump to subroutine long
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	LDA $7FC2			; AD C2 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FC3			; AD C3 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	STZ $7FC2			; 9C C2 7F | Store zero to absolute
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $7FC3			; 8D C3 7F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3BD
; Address: $C9A6DF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3BD:
	JSR $B65B			; 20 5B B6 | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	STZ $4F92			; 9C 92 4F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3BE
; Address: $C9A6E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3BE:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	LSR $A7			  ; 46 A7 | Logical shift right (zero page)
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3BF
; Address: $C9A6F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3BF:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($5B),Y		  ; 11 5B | Logical OR with accumulator ((zero page),Y)
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3C0
; Address: $C9A6FB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3C0:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$56			 ; C0 56 | Compare Y register (immediate)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3C3
; Address: $C9A716
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3C3:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	BCC $F4			  ; 90 F4 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3C4
; Address: $C9A720
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3C4:
	JSR $B6DA			; 20 DA B6 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FC3			; 8D C3 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FC2			; 8D C2 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3CA
; Address: $C9A746
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3CA:
	JSL $C4B212		  ; 22 12 B2 C4 | Jump to subroutine long
	INC $4F92			; EE 92 4F | Increment (absolute)
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3CC
; Address: $C9A756
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3CC:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $4F90			; 8E 90 4F | Store X register to absolute address
	LDA				  ; BF 1E 00 C9 | Load from absolute long,X into accumulator
	CMP #$D4			 ; C9 D4 | Compare accumulator (immediate)
	BCS $34			  ; B0 34 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	LDX $48D0			; AE D0 48 | Load from absolute address into X register
	LDY #$88			 ; A0 88 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3CD
; Address: $C9A781
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3CD:
	JSL $C4CEE2		  ; 22 E2 CE C4 | Jump to subroutine long
	BRA $06			  ; 80 06 | Branch always
	LDY $7F			  ; A4 7F | Load from zero page into Y register
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3CE
; Address: $C9A78D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3CE:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	LDX $4F90			; AE 90 4F | Load from absolute address into X register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCS $06			  ; B0 06 | Branch if carry set
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3CF
; Address: $C9A79E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3CF:
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4F92			; AD 92 4F | Load from absolute address into accumulator
	BEQ $C1			  ; F0 C1 | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D0
; Address: $C9A7A5
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D0:
	LDX #$11			 ; A2 11 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDX $48D0			; AE D0 48 | Load from absolute address into X register
	LDA $490A,X		  ; BD 0A 49 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ROR $7A7E,X		  ; 7E 7E 7A | Rotate right (absolute,X)
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F1			  ; D0 F1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D1
; Address: $C9A7D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D1:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $CD			  ; D0 CD | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D2
; Address: $C9A7DC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D2:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CPY $6000			; CC 00 60 | Compare Y register (absolute)
	LDA #$85			 ; A9 85 | Load immediate value into accumulator
	BPL $A0			  ; 10 A0 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D3
; Address: $C9A7E9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D3:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $B06720		  ; AF 20 67 B0 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D6
; Address: $C9A7FC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D6:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$16			 ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D8
; Address: $C9A814
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D8:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC $C4A8			; 6D A8 C4 | Add with carry (absolute)
	PHX				  ; DA | Push X register to stack
	LDA $4880,X		  ; BD 80 48 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3D9
; Address: $C9A81F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3D9:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	JMP $2201F6		  ; 5C F6 01 22 | Jump to address long
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$72			 ; C0 72 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDY $20AF			; AC AF 20 | Load from absolute address into Y register
	PHA				  ; 48 | Push accumulator to stack
	STA $20			  ; 85 20 | Store accumulator to zero page
	EOR $A986,Y		  ; 59 86 A9 | Exclusive OR with accumulator (absolute,Y)
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3DA
; Address: $C9A83B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3DA:
	JSL $C4C302		  ; 22 02 C3 C4 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3DB
; Address: $C9A845
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3DB:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STA ($96),Y		  ; 91 96 | Store accumulator to (zero page),Y
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)
	ASL $2000			; 0E 00 20 | Arithmetic shift left (absolute)
	LDA ($AF),Y		  ; B1 AF | Load from (zero page),Y into accumulator
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3DC
; Address: $C9A855
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3DC:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $869D20		  ; AF 20 9D 86 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3E1
; Address: $C9A872
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3E1:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	STA $4F94			; 8D 94 4F | Store accumulator to absolute address
	STY $4F90			; 8C 90 4F | Store Y register to absolute address
	LDA $7FA6			; AD A6 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3E2
; Address: $C9A881
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3E2:
	JSL $C4C8AC		  ; 22 AC C8 C4 | Jump to subroutine long
	STA $4F92			; 8D 92 4F | Store accumulator to absolute address
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	STZ $4F96			; 9C 96 4F | Store zero to absolute
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3E4
; Address: $C9A8A1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3E4:
	JSL $C4CBBD		  ; 22 BD CB C4 | Jump to subroutine long
	BRA $08			  ; 80 08 | Branch always
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3E5
; Address: $C9A8AF
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3E5:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $4F94			; 6D 94 4F | Add with carry (absolute)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCS $01			  ; B0 01 | Branch if carry set
	INY				  ; C8 | Increment Y register
	LDX $4F96			; AE 96 4F | Load from absolute address into X register
	INX				  ; E8 | Increment X register
	STX $4F96			; 8E 96 4F | Store X register to absolute address
	CPX $4F90			; EC 90 4F | Compare X register (absolute)
	BCC $D3			  ; 90 D3 | Branch if carry clear
	STZ $4F96			; 9C 96 4F | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3E6
; Address: $C9A8D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3E6:
	JSL $C4CBBD		  ; 22 BD CB C4 | Jump to subroutine long
	BRA $08			  ; 80 08 | Branch always
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3E7
; Address: $C9A8E1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3E7:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $4F94			; 6D 94 4F | Add with carry (absolute)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	STA $4F96			; 8D 96 4F | Store accumulator to absolute address
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	BPL $D4			  ; 10 D4 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3EB
; Address: $C9A90C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3EB:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CPY $F65F			; CC 5F F6 | Compare Y register (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3F2
; Address: $C9A931
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3F2:
	JSL $C4C8AC		  ; 22 AC C8 C4 | Jump to subroutine long
	STA $4F92			; 8D 92 4F | Store accumulator to absolute address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $4F90			; 8D 90 4F | Store accumulator to absolute address
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX $48D4			; AE D4 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3F3
; Address: $C9A953
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3F3:
	JSL $C4CBBD		  ; 22 BD CB C4 | Jump to subroutine long
	BRA $08			  ; 80 08 | Branch always
	BCC $4F			  ; 90 4F | Branch if carry clear
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3F4
; Address: $C9A961
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3F4:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	LDA $4F8E			; AD 8E 4F | Load from absolute address into accumulator
	CMP #$B0			 ; C9 B0 | Compare accumulator (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	LDA $4F8C			; AD 8C 4F | Load from absolute address into accumulator
	CMP #$21			 ; C9 21 | PPU graphics register access
	BCC $07			  ; 90 07 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	BRA $CC			  ; 80 CC | Branch always
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX $48D4			; AE D4 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3F5
; Address: $C9A987
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3F5:
	JSL $C4CBBD		  ; 22 BD CB C4 | Jump to subroutine long
	BRA $08			  ; 80 08 | Branch always
	BCC $4F			  ; 90 4F | Branch if carry clear
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3F6
; Address: $C9A995
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3F6:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	BPL $E5			  ; 10 E5 | Branch if positive

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3FA
; Address: $C9A9AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3FA:
	JSR $844F			; 20 4F 84 | Jump to subroutine
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3FB
; Address: $C9A9B3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3FB:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3FD
; Address: $C9A9D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3FD:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $BD			  ; C4 BD | Compare Y register (zero page)
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3FE
; Address: $C9A9DC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3FE:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	EOR $F651			; 4D 51 F6 | Exclusive OR with accumulator (absolute)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDA $0040A0		  ; AF A0 40 00 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_3FF
; Address: $C9A9EA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_3FF:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $854820		  ; AF 20 48 85 | Load from absolute long address into accumulator
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_403
; Address: $C9AA02
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_403:
	JSL $C4C699		  ; 22 99 C6 C4 | Jump to subroutine long
	STA $4F8C			; 8D 8C 4F | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F92			; 8D 92 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4F8E			; 8D 8E 4F | Store accumulator to absolute address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $4F90			; 8D 90 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	LDX $48CE			; AE CE 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_404
; Address: $C9AA24
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_404:
	JSL $C4CBBD		  ; 22 BD CB C4 | Jump to subroutine long
	BRA $08			  ; 80 08 | Branch always
	STY $8E4F			; 8C 4F 8E | Store Y register to absolute address
	BCC $4F			  ; 90 4F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_405
; Address: $C9AA32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_405:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $4F92			; 6D 92 4F | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_406
; Address: $C9AA3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_406:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	EOR $F651			; 4D 51 F6 | Exclusive OR with accumulator (absolute)
	BCC $DE			  ; 90 DE | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_409
; Address: $C9AA48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_409:
	LDA $7FBE			; AD BE 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FD2			; AD D2 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_40A
; Address: $C9AA50
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_40A:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	STZ $01			  ; 64 01 | Store zero to zero page
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND ($A0,X)		  ; 21 A0 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_40B
; Address: $C9AA5A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_40B:
	JSR $2200			; 20 00 22 | Jump to subroutine
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$53			 ; C0 53 | Compare Y register (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_40C
; Address: $C9AA66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_40C:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_413
; Address: $C9AA89
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_413:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	STY $A9			  ; 84 A9 | Store Y register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA $7F90			; AD 90 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F92			; AD 92 7F | Load from absolute address into accumulator
	STA $7F90			; 8D 90 7F | Store accumulator to absolute address
	LDX $4F50			; AE 50 4F | Load from absolute address into X register
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $4F7A			; 8D 7A 4F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDY #$14			 ; A0 14 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_414
; Address: $C9AAB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_414:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	CPY $A9			  ; C4 A9 | Compare Y register (zero page)
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_415
; Address: $C9AAC4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_415:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	LDA $C9			  ; A5 C9 | Load from zero page into accumulator
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_416
; Address: $C9AAD3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_416:
	XBA				  ; EB | Exchange accumulator bytes
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $33D8			; 8D D8 33 | Store accumulator to absolute address
	STA $33DA			; 8D DA 33 | Store accumulator to absolute address
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_418
; Address: $C9AAE4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_418:
	JSR $AB6F			; 20 6F AB | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_41B
; Address: $C9AAF6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_41B:
	JSR $AB6F			; 20 6F AB | Jump to subroutine
	LDA $4F94			; AD 94 4F | Load from absolute address into accumulator
	BNE $F4			  ; D0 F4 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_41C
; Address: $C9AAFE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_41C:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY $4F50			; AC 50 4F | Load from absolute address into Y register
	LDX $4EFA,Y		  ; BE FA 4E | Load from absolute,Y into X register
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	STA $45B2,X		  ; 9D B2 45 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank12_DmaFunction_41E
; Address: $C9AB13
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_41E:
	JSR $8548			; 20 48 85 | Jump to subroutine
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	STZ $7FD0			; 9C D0 7F | Store zero to absolute
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $33D8			; 8D D8 33 | Store accumulator to absolute address
	STA $33DA			; 8D DA 33 | Store accumulator to absolute address
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_420
; Address: $C9AB32
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_420:
	JSR $AFAC			; 20 AC AF | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	BNE $E4			  ; D0 E4 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_422
; Address: $C9AB40
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_422:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_423
; Address: $C9AB49
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_423:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $908D68		  ; AF 68 8D 90 | Load from absolute long address into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_429
; Address: $C9AB6F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_429:
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	EOR $7FD0			; 4D D0 7F | Exclusive OR with accumulator (absolute)
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_42B
; Address: $C9AB7C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_42B:
	JSR $844F			; 20 4F 84 | Jump to subroutine
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	LDA $7FD2			; AD D2 7F | Load from absolute address into accumulator
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	STA $4F74			; 8D 74 4F | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_430
; Address: $C9ABB4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_430:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	EOR $90F6,X		  ; 5D F6 90 | Exclusive OR with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_434
; Address: $C9ABCA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_434:
	JSL $C02A66		  ; 22 66 2A C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F7C			; 8D 7C 4F | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $40B3			; 8D B3 40 | Store accumulator to absolute address
	LDA #$BB			 ; A9 BB | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	LDA #$D7			 ; A9 D7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_437
; Address: $C9ABF3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_437:
	JSR $B497			; 20 97 B4 | Jump to subroutine
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDX #$60			 ; A2 60 | Load immediate value into X register
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	LDA #$35			 ; A9 35 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_438
; Address: $C9AC05
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_438:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	STA $4F80			; 8D 80 4F | Store accumulator to absolute address
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_43B
; Address: $C9AC19
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_43B:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	EOR $2200,X		  ; 5D 00 22 | Exclusive OR with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($67,X)		  ; C1 67 | Compare accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND $22AE,X		  ; 3D AE 22 | Logical AND with accumulator (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	LDX $A2C4			; AE C4 A2 | Load from absolute address into X register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_43D
; Address: $C9AC35
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_43D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ADC ($AF),Y		  ; 71 AF | Add with carry ((zero page),Y)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	LDA $A86722		  ; AF 22 67 A8 | Load from absolute long address into accumulator
	CMP ($68,X)		  ; C1 68 | Compare accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_441
; Address: $C9AC64
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_441:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $BA22C4		  ; AF C4 22 BA | Load from absolute long address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_443
; Address: $C9AC7B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_443:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND $22AE,X		  ; 3D AE 22 | Logical AND with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$96			 ; C0 96 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $AF8A20		  ; AF 20 8A AF | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_444
; Address: $C9AC97
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_444:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	JMP ($2201)		  ; 6C 01 22 | Jump to address (absolute indirect)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_445
; Address: $C9ACAA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_445:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ADC $A901			; 6D 01 A9 | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_446
; Address: $C9ACB3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_446:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $982920		  ; AF 20 29 98 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_447
; Address: $C9ACC0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_447:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ROR $2201			; 6E 01 22 | Rotate right (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_448
; Address: $C9ACD3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_448:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$96			 ; C0 96 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $AF1120		  ; AF 20 11 AF | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_449
; Address: $C9ACE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_449:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND $22AE,X		  ; 3D AE 22 | Logical AND with accumulator (absolute,X)
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_44C
; Address: $C9AD01
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_44C:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $BA22C4		  ; AF C4 22 BA | Load from absolute long address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$62			 ; C0 62 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $E32E22		  ; AF 22 2E E3 | Load from absolute long address into accumulator
	CMP ($62,X)		  ; C1 62 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_44D
; Address: $C9AD18
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_44D:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND $22AE,X		  ; 3D AE 22 | Logical AND with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($74,X)		  ; C1 74 | Compare accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$96			 ; C0 96 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $9DE620		  ; AF 20 E6 9D | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_44E
; Address: $C9AD34
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_44E:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_452
; Address: $C9AD59
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_452:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $BA22C4		  ; AF C4 22 BA | Load from absolute long address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $E32E22		  ; AF 22 2E E3 | Load from absolute long address into accumulator
	CMP ($62,X)		  ; C1 62 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_453
; Address: $C9AD70
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_453:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND $22AE,X		  ; 3D AE 22 | Logical AND with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($6D,X)		  ; C1 6D | Compare accumulator ((zero page,X))
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_456
; Address: $C9AD92
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_456:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_457
; Address: $C9ADA5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_457:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$96			 ; C0 96 | Compare Y register (immediate)
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $A86722		  ; AF 22 67 A8 | Load from absolute long address into accumulator
	CMP ($52,X)		  ; C1 52 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_45A
; Address: $C9ADC4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_45A:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	LDX $20C4			; AE C4 20 | Load from absolute address into X register
	LDA $4F7EAE		  ; AF AE 7E 4F | Load from absolute long address into accumulator
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_45C
; Address: $C9ADD7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_45C:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ADC $EE01			; 6D 01 EE | Add with carry (absolute)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_45D
; Address: $C9ADE3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_45D:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $982920		  ; AF 20 29 98 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_45F
; Address: $C9ADF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_45F:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_460
; Address: $C9AE03
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_460:
	JSL $C1A867		  ; 22 67 A8 C1 | Jump to subroutine long
	ADC $EE01			; 6D 01 EE | Add with carry (absolute)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_461
; Address: $C9AE0F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_461:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $982920		  ; AF 20 29 98 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_464
; Address: $C9AE27
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_464:
	LDA $A720C4		  ; AF C4 20 A7 | Load from absolute long address into accumulator
	LDA $AE3D20		  ; AF 20 3D AE | Load from absolute long address into accumulator
	LDX #$A0			 ; A2 A0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_46D
; Address: $C9AE58
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_46D:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	BRA $EA			  ; 80 EA | Branch always
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BRA $E5			  ; 80 E5 | Branch always
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	BRA $E0			  ; 80 E0 | Game work RAM access
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	BRA $DB			  ; 80 DB | Branch always
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	LDX $4F7E			; AE 7E 4F | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_470
; Address: $C9AE7A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_470:
	LDX #$03			 ; A2 03 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA #$06			 ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_471
; Address: $C9AE81
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_471:
	JSL $C4AE6F		  ; 22 6F AE C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $F4			  ; D0 F4 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_472
; Address: $C9AE8A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_472:
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	CMP $22FF,Y		  ; D9 FF 22 | Compare accumulator (absolute,Y)
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	LDX #$03			 ; A2 03 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDX $4F7E			; AE 7E 4F | Load from absolute address into X register
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_476
; Address: $C9AEB8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_476:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	BNE $F1			  ; D0 F1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_479
; Address: $C9AEC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_479:
	JSL $C03F12		  ; 22 12 3F C0 | Jump to subroutine long
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $CE			  ; D0 CE | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_47A
; Address: $C9AED2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_47A:
	LDA $4F7C			; AD 7C 4F | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $0B			  ; D0 0B | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_47E
; Address: $C9AEEA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_47E:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	JMP ($C4AE)		  ; 6C AE C4 | Jump to address (absolute indirect)
	BRA $EE			  ; 80 EE | Branch always
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_47F
; Address: $C9AEF8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_47F:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	LDX $80C4			; AE C4 80 | Load from absolute address into X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	LDX $80C4			; AE C4 80 | Load from absolute address into X register
	PHP				  ; 08 | Push processor status to stack
	LDA $4F7E			; AD 7E 4F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_480
; Address: $C9AF0F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_480:
	JSR $22D8			; 20 D8 22 | Jump to subroutine
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	LDX $4F7E			; AE 7E 4F | Load from absolute address into X register
	LDY $42F2,X		  ; BC F2 42 | Hardware register operation
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$46			 ; A9 46 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_481
; Address: $C9AF2A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_481:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_483
; Address: $C9AF37
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_483:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	BPL $4D			  ; 10 4D | Branch if positive
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$D6			 ; C0 D6 | Compare Y register (immediate)
	BCS $C4			  ; B0 C4 | Branch if carry set
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_485
; Address: $C9AF4F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_485:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	STA				  ; 9F AE C4 20 | Store accumulator to absolute long,X
	LDA $204860		  ; AF 60 48 20 | Load from absolute long address into accumulator
	STA ($AF),Y		  ; 91 AF | Store accumulator to (zero page),Y
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_486
; Address: $C9AF62
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_486:
	JSL $C02ABA		  ; 22 BA 2A C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDA $A0C4,Y		  ; B9 C4 A0 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_48F
; Address: $C9AF91
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_48F:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $4F4E			; 8D 4E 4F | Store accumulator to absolute address
	STZ $4F50			; 9C 50 4F | Store zero to absolute
	LDA $4F80			; AD 80 4F | Load from absolute address into accumulator
	STA $4EFA			; 8D FA 4E | Store accumulator to absolute address
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	STA $4EE2			; 8D E2 4E | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_492
; Address: $C9AFB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_492:
	JSL $C48320		  ; 22 20 83 C4 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_494
; Address: $C9AFBE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_494:
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_496
; Address: $C9AFCA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_496:
	JSL $C48320		  ; 22 20 83 C4 | Jump to subroutine long
	BRA $F4			  ; 80 F4 | Branch always
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_499
; Address: $C9AFD9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_499:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4EE2,X		  ; BD E2 4E | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	STA $4F50,Y		  ; 99 50 4F | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $4F4E			; 8D 4E 4F | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_49A
; Address: $C9AFFE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_49A:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F50,X		  ; BD 50 4F | Load from absolute,X into accumulator
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY $4F4E			; CC 4E 4F | Compare Y register (absolute)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank12_DmaFunction_49B
; Address: $C9B019
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_49B:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $4E41			; 8C 41 4E | Store Y register to absolute address
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $3C			  ; F0 3C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $21			  ; F0 21 | PPU graphics register access
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	EOR ($4E,X)		  ; 41 4E | Exclusive OR with accumulator ((zero page,X))
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F12,Y		  ; 99 12 4F | Store accumulator to absolute,Y
	BRA $D5			  ; 80 D5 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	LDY $4E41			; AC 41 4E | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $B9			  ; 80 B9 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_49C
; Address: $C9B067
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_49C:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4F50,X		  ; BD 50 4F | Load from absolute,X into accumulator
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY $4F4E			; CC 4E 4F | Compare Y register (absolute)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_49D
; Address: $C9B07F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_49D:
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	STA $4E41			; 8D 41 4E | Store accumulator to absolute address
	LDA $4F4E			; AD 4E 4F | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_49E
; Address: $C9B08C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_49E:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4F4E			; AD 4E 4F | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_49F
; Address: $C9B096
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_49F:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4F12,X		  ; BD 12 4F | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $4F12,Y		  ; B9 12 4F | Load from absolute,Y into accumulator
	STA $4F12,X		  ; 9D 12 4F | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	STA $4F12,Y		  ; 99 12 4F | Store accumulator to absolute,Y
	DEC $4E41			; CE 41 4E | Decrement (absolute)
	BNE $D9			  ; D0 D9 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4A0
; Address: $C9B0B3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4A0:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$30			 ; E2 30 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4A1
; Address: $C9B0BA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4A1:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4A2
; Address: $C9B0C4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4A2:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	BMI $83			  ; 30 83 | Branch if negative
	ORA ($8A,X)		  ; 01 8A | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4A6
; Address: $C9B0E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4A6:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4A9
; Address: $C9B0F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4A9:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4AB
; Address: $C9B102
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4AB:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BCC $F4			  ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4AC
; Address: $C9B109
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4AC:
	JSL $C79DD4		  ; 22 D4 9D C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4AD
; Address: $C9B10F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4AD:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $4F6E			; AC 6E 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4AE
; Address: $C9B114
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4AE:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4AF
; Address: $C9B11B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4AF:
	JSR $B476			; 20 76 B4 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4B4
; Address: $C9B12F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4B4:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BRA $C2			  ; 80 C2 | Branch always
	PHY				  ; 5A | Push Y register to stack
	LDY $4F6E			; AC 6E 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4B6
; Address: $C9B142
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4B6:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	BRA $AF			  ; 80 AF | Branch always
	PHY				  ; 5A | Push Y register to stack
	LDY $4F6E			; AC 6E 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4B8
; Address: $C9B155
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4B8:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BRA $9C			  ; 80 9C | Branch always
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4B9
; Address: $C9B163
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4B9:
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	LDY $4F6E			; AC 6E 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4BB
; Address: $C9B170
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4BB:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4BC
; Address: $C9B176
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4BC:
	JSR $B4A4			; 20 A4 B4 | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator
	LDX $4F70			; AE 70 4F | Load from absolute address into X register
	LDY $4F72			; AC 72 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4BF
; Address: $C9B18D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4BF:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	LDY $4F6E			; AC 6E 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4C1
; Address: $C9B19C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4C1:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4C2
; Address: $C9B1A2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4C2:
	JSR $B4B0			; 20 B0 B4 | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator
	LDX $4F70			; AE 70 4F | Load from absolute address into X register
	LDY $4F72			; AC 72 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4C5
; Address: $C9B1B9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4C5:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	STA $4245			; 8D 45 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	LDY $4F6E			; AC 6E 4F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4C6
; Address: $C9B1C5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4C6:
	JSR $B4CE			; 20 CE B4 | Jump to subroutine
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $4252,X		  ; BD 52 42 | Hardware register operation
	BEQ $3D			  ; F0 3D | Branch if equal
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4C7
; Address: $C9B1D9
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4C7:
	STA $4F98			; 8D 98 4F | Store accumulator to absolute address
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $4F98			; 6D 98 4F | Add with carry (absolute)
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	STA $4F98			; 8D 98 4F | Store accumulator to absolute address
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $4F98			; 6D 98 4F | Add with carry (absolute)
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4C8
; Address: $C9B209
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4C8:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BRA $BE			  ; 80 BE | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4CA
; Address: $C9B217
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4CA:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4CB
; Address: $C9B21F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4CB:
	JSL $C4B212		  ; 22 12 B2 C4 | Jump to subroutine long
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4CD
; Address: $C9B22C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4CD:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	LDY $4EFA,X		  ; BC FA 4E | Load from absolute,X into Y register
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4CE
; Address: $C9B235
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4CE:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4CF
; Address: $C9B245
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4CF:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D0
; Address: $C9B25C
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D0:
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $54			  ; F0 54 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $0001,Y		  ; D9 01 00 | Compare accumulator (absolute,Y)
	BCC $09			  ; 90 09 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $EA			  ; 80 EA | Branch always
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $0002,Y		  ; B9 02 00 | Load from absolute,Y into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	LDA				  ; BF D2 42 7E | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	WDM #$7E			 ; 42 7E | Reserved instruction
	LDA $0003,Y		  ; B9 03 00 | Load from absolute,Y into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	LDA				  ; BF F2 42 7E | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	WDM #$7E			 ; 42 7E | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D1
; Address: $C9B2AB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D1:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	BRA $A5			  ; 80 A5 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D2
; Address: $C9B2B8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D2:
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D5
; Address: $C9B2CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D5:
	JSL $C03ADD		  ; 22 DD 3A C0 | Jump to subroutine long
	LDX $4F7A			; AE 7A 4F | Load from absolute address into X register
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D7
; Address: $C9B2D8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D7:
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	CMP $5AFF,X		  ; DD FF 5A | Compare accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	PEA #$0008		   ; F4 08 00 | Push effective address to stack
	LDY $4EFA,X		  ; BC FA 4E | Load from absolute,X into Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $45D2,Y		  ; B9 D2 45 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D8
; Address: $C9B2F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D8:
	JSL $C03DF2		  ; 22 F2 3D C0 | Jump to subroutine long
	LDX $4F7A			; AE 7A 4F | Load from absolute address into X register
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4D9
; Address: $C9B2FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4D9:
	JSR $B817			; 20 17 B8 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4DB
; Address: $C9B309
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4DB:
	PEA #$000A		   ; F4 0A 00 | Push effective address to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $FBC9			; AD C9 FB | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4DC
; Address: $C9B314
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4DC:
	JSL $C03ADD		  ; 22 DD 3A C0 | Jump to subroutine long
	STZ $4F78			; 9C 78 4F | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4DE
; Address: $C9B322
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4DE:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BCS $27			  ; B0 27 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4DF
; Address: $C9B334
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4DF:
	JSR $B392			; 20 92 B3 | Jump to subroutine
	BCS $16			  ; B0 16 | Branch if carry set
	ORA $3A			  ; 05 3A | Logical OR with accumulator (zero page)
	BEQ $11			  ; F0 11 | Branch if equal
	ORA $8A			  ; 05 8A | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4E0
; Address: $C9B344
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4E0:
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SBC $83			  ; E5 83 | Subtract with carry (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STZ $C02B			; 9C 2B C0 | Store zero to absolute
	BRA $D9			  ; 80 D9 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4E3
; Address: $C9B35B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4E3:
	JSL $C036ED		  ; 22 ED 36 C0 | Jump to subroutine long
	STZ $4F78			; 9C 78 4F | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4E5
; Address: $C9B369
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4E5:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BCS $20			  ; B0 20 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ASL $03A3			; 0E A3 03 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4E6
; Address: $C9B37B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4E6:
	JSR $B392			; 20 92 B3 | Jump to subroutine
	BCS $0F			  ; B0 0F | Branch if carry set
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CPX $0183			; EC 83 01 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4E7
; Address: $C9B389
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4E7:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BRA $E0			  ; 80 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4E8
; Address: $C9B392
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4E8:
	JSL $C03F12		  ; 22 12 3F C0 | Jump to subroutine long
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $4F78			; AD 78 4F | Load from absolute address into accumulator
	INC				  ; 1A | Increment accumulator
	STA $4F78			; 8D 78 4F | Store accumulator to absolute address
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCS $02			  ; B0 02 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4EC
; Address: $C9B3B0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4EC:
	JSL $C0383F		  ; 22 3F 38 C0 | Jump to subroutine long
	BRA $A9			  ; 80 A9 | Branch always
	LDA $FBC9			; AD C9 FB | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4EF
; Address: $C9B3C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4EF:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	BNE $F6			  ; D0 F6 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F0
; Address: $C9B3CA
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F0:
	TAX				  ; AA | Transfer accumulator to X register
	PHY				  ; 5A | Push Y register to stack
	LDA $7FE374		  ; AF 74 E3 7F | Load from absolute long address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FE37E		  ; AF 7E E3 7F | Load from absolute long address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F9C			; AD 9C 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FA4			; AD A4 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F9E			; AD 9E 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FA6			; AD A6 7F | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	AND $18AA,X		  ; 3D AA 18 | Logical AND with accumulator (absolute,X)
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	STZ $7E7F			; 9C 7F 7E | Store zero to absolute
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $8F			  ; 05 8F | Logical OR with accumulator (zero page)
	STZ $7E7F,X		  ; 9E 7F 7E | Store zero to absolute,X
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $748F			; 0D 8F 74 | Logical OR with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	STA $7E7FA4		  ; 8F A4 7F 7E | Store accumulator to absolute long address
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	STA $7E7FA6		  ; 8F A6 7F 7E | Store accumulator to absolute long address
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F1
; Address: $C9B41F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F1:
	CLC				  ; 18 | Clear carry flag
	STA $7FE37E		  ; 8F 7E E3 7F | Store accumulator to absolute long address
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F2
; Address: $C9B428
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F2:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BRA $BB			  ; 80 BB | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	LDA $7E7EF4		  ; AF F4 7E 7E | Load from absolute long address into accumulator
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FA6			; 8D A6 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9E			; 8D 9E 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FE37E		  ; 8F 7E E3 7F | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FE374		  ; 8F 74 E3 7F | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F3
; Address: $C9B45C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F3:
	LDA $4F76			; AD 76 4F | Load from absolute address into accumulator
	BNE $D9			  ; D0 D9 | Branch if not equal
	BRA $86			  ; 80 86 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F4
; Address: $C9B466
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F4:
	JSR $418D			; 20 8D 41 | Jump to subroutine
	WDM #$A9			 ; 42 A9 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $4243			; 8D 43 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F6
; Address: $C9B476
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F6:
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4F8
; Address: $C9B48A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4F8:
	WDM #$A9			 ; 42 A9 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $4243			; 8D 43 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4FA
; Address: $C9B497
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4FA:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4FC
; Address: $C9B4A4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4FC:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	BRA $F1			  ; 80 F1 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	BRA $EB			  ; 80 EB | Branch always
	PHA				  ; 48 | Push accumulator to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BRA $E5			  ; 80 E5 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	BRA $DF			  ; 80 DF | Branch always
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4FE
; Address: $C9B4C9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4FE:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_4FF
; Address: $C9B4CE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_4FF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_502
; Address: $C9B4E1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_502:
	JSR $B463			; 20 63 B4 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_505
; Address: $C9B4EA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_505:
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_507
; Address: $C9B4FB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_507:
	JSR $B4E6			; 20 E6 B4 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_508
; Address: $C9B50E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_508:
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $4EE2,X		  ; BC E2 4E | Load from absolute,X into Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $0E			  ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_509
; Address: $C9B518
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_509:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $4F			  ; 80 4F | Branch always
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	BRA $1F			  ; 80 1F | Branch always
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $0E			  ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_50A
; Address: $C9B52B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_50A:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $4F			  ; 80 4F | Branch always
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	BRA $0C			  ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank12_DmaFunction_50B
; Address: $C9B539
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_50B:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $4F			  ; 80 4F | Branch always
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_50C
; Address: $C9B558
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_50C:
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($BD,X)		  ; 01 BD | Logical OR with accumulator ((zero page,X))
	WDM #$18			 ; 42 18 | Reserved instruction
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_50D
; Address: $C9B578
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_50D:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	STA $4FB2			; 8D B2 4F | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Load from absolute long,X into accumulator
	STA $4FB0			; 8D B0 4F | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_50E
; Address: $C9B59F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_50E:
	JSR $B61B			; 20 1B B6 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	STA $4FA8			; 8D A8 4F | Store accumulator to absolute address
	STX $4FAA			; 8E AA 4F | Store X register to absolute address
	LDY $4FB2			; AC B2 4F | Load from absolute address into Y register
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_50F
; Address: $C9B5B9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_50F:
	JSR $B61B			; 20 1B B6 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	STA $4FAC			; 8D AC 4F | Store accumulator to absolute address
	STX $4FAE			; 8E AE 4F | Store X register to absolute address
	CMP $4FA8			; CD A8 4F | Compare accumulator (absolute)
	BCC $26			  ; 90 26 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_510
; Address: $C9B5CD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_510:
	LDA $4FB2			; AD B2 4F | Load from absolute address into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4FA8			; AD A8 4F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_511
; Address: $C9B5D8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_511:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	BRA $24			  ; 80 24 | Branch always
	LDA $4FB0			; AD B0 4F | Load from absolute address into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4FAC			; AD AC 4F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_512
; Address: $C9B5FE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_512:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	LDA $4FAE			; AD AE 4F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	ORA ($7A,X)		  ; 01 7A | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_513
; Address: $C9B61B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_513:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $33			  ; F0 33 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $07			  ; 10 07 | Branch if positive
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	STX $00			  ; 86 00 | Store X register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_514
; Address: $C9B639
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_514:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $08			  ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank12_DmaFunction_515
; Address: $C9B643
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_515:
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_516
; Address: $C9B656
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_516:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioChannelSetup - Setup audio channel parameters
; Address: $C9B65B
; Size: 47 bytes
;------------------------------------------------------------------------------
AudioChannelSetup:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FFC4C		  ; 8F 4C FC 7F | Store accumulator to absolute long address
	LDA $7FE36C		  ; AF 6C E3 7F | Load from absolute long address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $7FFC46		  ; 8F 46 FC 7F | Store accumulator to absolute long address
	LDA $7FE376		  ; AF 76 E3 7F | Load from absolute long address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $7FFC48		  ; 8F 48 FC 7F | Store accumulator to absolute long address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $7FFC4A		  ; 8F 4A FC 7F | Store accumulator to absolute long address
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioBufferAllocation - Allocate audio buffer space
; Address: $C9B68E
; Size: 26 bytes
;------------------------------------------------------------------------------
AudioBufferAllocation:
	JSL $C078CF		  ; 22 CF 78 C0 | Jump to subroutine long
	BCC $41			  ; 90 41 | Branch if carry clear
	LDA $7FE552		  ; AF 52 E5 7F | Load from absolute long address into accumulator
	STA $484C			; 8D 4C 48 | Store accumulator to absolute address
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	TAX				  ; AA | Transfer accumulator to X register
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CPY $B0			  ; C4 B0 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_51A
; Address: $C9B6B6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_51A:
	JSL $C030D2		  ; 22 D2 30 C0 | Jump to subroutine long
	BCC $0B			  ; 90 0B | Branch if carry clear
	STA $4880,X		  ; 9D 80 48 | Store accumulator to absolute,X
	TXA				  ; 8A | Transfer X register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_51D
; Address: $C9B6D1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_51D:
	JSL $C05A94		  ; 22 94 5A C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_51E
; Address: $C9B6DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_51E:
	JSL $C688AD		  ; 22 AD 88 C6 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_51F
; Address: $C9B6E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_51F:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $4868,X		  ; BD 68 48 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_523
; Address: $C9B702
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_523:
	JSL $C03422		  ; 22 22 34 C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_524
; Address: $C9B70D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_524:
	PHA				  ; 48 | Push accumulator to stack
	LDA $4F30			; AD 30 4F | Load from absolute address into accumulator
	STA $7F9C			; 8D 9C 7F | Store accumulator to absolute address
	STZ $4F34			; 9C 34 4F | Store zero to absolute
	LDA $4F32			; AD 32 4F | Load from absolute address into accumulator
	STA $7FA4			; 8D A4 7F | Store accumulator to absolute address
	STZ $4F36			; 9C 36 4F | Store zero to absolute
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_525
; Address: $C9B722
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_525:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_526
; Address: $C9B72A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_526:
	ADC $4F34			; 6D 34 4F | Add with carry (absolute)
	STA $4F34			; 8D 34 4F | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $7F9C			; 6D 9C 7F | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	STZ $A37F			; 9C 7F A3 | Store zero to absolute
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_527
; Address: $C9B743
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_527:
	JSR $6D18			; 20 18 6D | Jump to subroutine
	STA $4F36			; 8D 36 4F | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $7FA4			; 6D A4 7F | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDY $7F			  ; A4 7F | Load from zero page into Y register
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_528
; Address: $C9B75F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_528:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY #$16			 ; A0 16 | Load immediate value into Y register
	LDA $4EE2,Y		  ; B9 E2 4E | Load from absolute,Y into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $4EFA,Y		  ; B9 FA 4E | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_529
; Address: $C9B777
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_529:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $E6			  ; 10 E6 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_52A
; Address: $C9B783
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_52A:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY #$16			 ; A0 16 | Load immediate value into Y register
	LDA $4EE2,Y		  ; B9 E2 4E | Load from absolute,Y into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $4EFA,Y		  ; B9 FA 4E | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_52C
; Address: $C9B79B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_52C:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $E6			  ; 10 E6 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_52D
; Address: $C9B7A7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_52D:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $4F4E			; AD 4E 4F | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4F50,Y		  ; B9 50 4F | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_52E
; Address: $C9B7BE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_52E:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $EA			  ; 10 EA | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_52F
; Address: $C9B7CA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_52F:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $4F4E			; AD 4E 4F | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4F50,Y		  ; B9 50 4F | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_530
; Address: $C9B7E1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_530:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $EA			  ; 10 EA | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_532
; Address: $C9B7ED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_532:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_533
; Address: $C9B7FA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_533:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_534
; Address: $C9B802
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_534:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $4247			; 8D 47 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_535
; Address: $C9B80F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_535:
	JSL $C79F9A		  ; 22 9A 9F C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_536
; Address: $C9B817
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_536:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	ORA $F088			; 0D 88 F0 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_537
; Address: $C9B83A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_537:
	JSL $C02B9C		  ; 22 9C 2B C0 | Jump to subroutine long
	BRA $DE			  ; 80 DE | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_539
; Address: $C9B846
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_539:
	JSR $B89E			; 20 9E B8 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_53C
; Address: $C9B858
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_53C:
	JSL $C036ED		  ; 22 ED 36 C0 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $4ECA,X		  ; BD CA 4E | Load from absolute,X into accumulator
	BEQ $0E			  ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_53D
; Address: $C9B878
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_53D:
	JSL $C03F12		  ; 22 12 3F C0 | Jump to subroutine long
	BCS $01			  ; B0 01 | Branch if carry set
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	CMP $9C22,Y		  ; D9 22 9C | Compare accumulator (absolute,Y)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_53E
; Address: $C9B89E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_53E:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $4F50,X		  ; BD 50 4F | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4EFA,X		  ; BD FA 4E | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $45D2,X		  ; BD D2 45 | Load from absolute,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP $4EC8,X		  ; DD C8 4E | Compare accumulator (absolute,X)
	BEQ $09			  ; F0 09 | Branch if equal
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BNE $F7			  ; D0 F7 | Branch if not equal
	STA $4ECA,Y		  ; 99 CA 4E | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank12_DmaFunction_53F
; Address: $C9B8C0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_53F:
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $4F4E			; CD 4E 4F | Compare accumulator (absolute)
	BCC $D6			  ; 90 D6 | Branch if carry clear
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCS $06			  ; B0 06 | Branch if carry set
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $4ECA,Y		  ; 99 CA 4E | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_541
; Address: $C9B8DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_541:
	JSR $B89E			; 20 9E B8 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4ECA,Y		  ; B9 CA 4E | Load from absolute,Y into accumulator
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_543
; Address: $C9B8EC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_543:
	JSL $C0383F		  ; 22 3F 38 C0 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_544
; Address: $C9B8FC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_544:
	JSR $B89E			; 20 9E B8 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $4ECA,Y		  ; B9 CA 4E | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_545
; Address: $C9B90A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_545:
	JSL $C03DF2		  ; 22 F2 3D C0 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $4EE2,X		  ; BD E2 4E | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDX #$91			 ; A2 91 | Load immediate value into X register
	SBC $00BF,Y		  ; F9 BF 00 | Subtract with carry (absolute,Y)
	INC $FF29,X		  ; FE 29 FF | Increment (absolute,X)
	BEQ $34			  ; F0 34 | Branch if equal
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_546
; Address: $C9B92E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_546:
	PHP				  ; 08 | Push processor status to stack
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0D			 ; 69 0D | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	BRA $EB			  ; 80 EB | Branch always
	LDA				  ; BF 01 00 FE | Load from absolute long,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $4EFA,Y		  ; B9 FA 4E | Load from absolute,Y into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $45B2,Y		  ; B9 B2 45 | Load from absolute,Y into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $DFD0,X		  ; FE D0 DF | Increment (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	LDA				  ; BF 03 00 FE | Load from absolute long,X into accumulator
	BEQ $04			  ; F0 04 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_547
; Address: $C9B95C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_547:
	JSR $B963			; 20 63 B9 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_548
; Address: $C9B963
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_548:
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF 00 00 C4 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BCC $04			  ; 90 04 | Branch if carry clear
	BEQ $38			  ; F0 38 | Branch if equal
	BRA $36			  ; 80 36 | Branch always
	PEA #$B9A4		   ; F4 A4 B9 | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AC B9 C4 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF AE B9 C4 | Load from absolute long,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BRA $E1			  ; 80 E1 | Branch always
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ORA $60			  ; 05 60 | Logical OR with accumulator (zero page)
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_549
; Address: $C9B99A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_549:
	CLC				  ; 18 | Clear carry flag
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	ORA $BF			  ; 05 BF | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $60			  ; C4 60 | Compare Y register (zero page)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	BRA $BA			  ; 80 BA | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_54A
; Address: $C9B9AD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_54A:
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	AND $00C0,X		  ; 3D C0 00 | Logical AND with accumulator (absolute,X)
	WDM #$C0			 ; 42 C0 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_54B
; Address: $C9B9C3
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_54B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0401			; 0D 01 04 | Logical OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank12_DmaFunction_54C
; Address: $C9BA15
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_54C:
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	PHP				  ; 08 | Push processor status to stack
	BMI $01			  ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank12_DmaFunction_54D
; Address: $C9BA8E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_54D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_54E
; Address: $C9BAA3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_54E:
	JSR $0401			; 20 01 04 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_54F
; Address: $C9BABC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_54F:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ROL $0401,X		  ; 3E 01 04 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_550
; Address: $C9BAD3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_550:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $0400,X		  ; FD 00 04 | Subtract with carry (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	AND $0301,X		  ; 3D 01 03 | Logical AND with accumulator (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	AND $0401,X		  ; 3D 01 04 | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_551
; Address: $C9BB07
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_551:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_552
; Address: $C9BB22
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_552:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SBC $0400,Y		  ; F9 00 04 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_553
; Address: $C9BB3D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_553:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_554
; Address: $C9BB4F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_554:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ROL $01			  ; 26 01 | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	AND $0401,Y		  ; 39 01 04 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_555
; Address: $C9BB64
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_555:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_556
; Address: $C9BB72
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_556:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $0401,Y		  ; 19 01 04 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_557
; Address: $C9BB9A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_557:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_558
; Address: $C9BBC0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_558:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_559
; Address: $C9BBFB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_559:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_55A
; Address: $C9BC1F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_55A:
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	SBC $0400,Y		  ; F9 00 04 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BIT $0301			; 2C 01 03 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BIT $0301			; 2C 01 03 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_55B
; Address: $C9BC6C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_55B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $0301,X		  ; 1D 01 03 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0301,X		  ; 1D 01 03 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_560
; Address: $C9BCDE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_560:
	JSR $0000			; 20 00 00 | Jump to subroutine
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	WDM #$01			 ; 42 01 | Reserved instruction
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $0401,X		  ; 3E 01 04 | Rotate left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_561
; Address: $C9BCFC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_561:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BIT $0401			; 2C 01 04 | Test bits in accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_562
; Address: $C9BD17
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_562:
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_563
; Address: $C9BD21
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_563:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND $0401			; 2D 01 04 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ROL $0301			; 2E 01 03 | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ROL $0301			; 2E 01 03 | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_564
; Address: $C9BD70
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_564:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	SBC $0400,X		  ; FD 00 04 | Subtract with carry (absolute,X)
	SBC $0400,Y		  ; F9 00 04 | Subtract with carry (absolute,Y)
	SBC $0300,Y		  ; F9 00 03 | Subtract with carry (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_565
; Address: $C9BDC8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_565:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_566
; Address: $C9BDD5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_566:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_569
; Address: $C9BE22
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_569:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC $0400,X		  ; FD 00 04 | Subtract with carry (absolute,X)
	ORA $0301,X		  ; 1D 01 03 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	PEA #$0300		   ; F4 00 03 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PEA #$0400		   ; F4 00 04 | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_56B
; Address: $C9BEA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_56B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_56C
; Address: $C9BEB4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_56C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_56D
; Address: $C9BEC1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_56D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_56F
; Address: $C9BED1
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_56F:
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	AND $0401,Y		  ; 39 01 04 | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_570
; Address: $C9BF2F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_570:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $0400,X		  ; FD 00 04 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_571
; Address: $C9BF5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_571:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_573
; Address: $C9BF6C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_573:
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_574
; Address: $C9BF85
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_574:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_575
; Address: $C9BFAA
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_575:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($34,X)		  ; 01 34 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	EOR $0301			; 4D 01 03 | Exclusive OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CPY $0400			; CC 00 04 | Compare Y register (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LSR $0301			; 4E 01 03 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_577
; Address: $C9C01C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_577:
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LSR $0301			; 4E 01 03 | Logical shift right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank12_DmaFunction_57B
; Address: $C9C043
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_57B:
	JSR $C03E			; 20 3E C0 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	BNE $FA			  ; D0 FA | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; AudioSystemReset - Reset audio system state
; Address: $C9B043
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioSystemReset:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C0,X		  ; 9D C0 48 | Store accumulator to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	LDX #$0E			 ; A2 0E | Load immediate value into X register
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_57D
; Address: $C9C074
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_57D:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_57E
; Address: $C9C07C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_57E:
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C0			; AE C0 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6E			  ; D0 6E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_57F
; Address: $C9C089
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_57F:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48C0			; 8E C0 48 | Store X register to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_580
; Address: $C9C092
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_580:
	JSL $C08DA0		  ; 22 A0 8D C0 | Jump to subroutine long
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_581
; Address: $C9C0BA
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_581:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0009,Y		  ; 99 09 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank12_DmaFunction_582
; Address: $C9C0F1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_582:
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_583
; Address: $C9C10D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_583:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C0			; AE C0 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_584
; Address: $C9C11D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_584:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C0			; 8D C0 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_585
; Address: $C9C12C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_585:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C2			; AE C2 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6C			  ; D0 6C | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_586
; Address: $C9C141
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_586:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48C2			; 8E C2 48 | Store X register to absolute address
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_588
; Address: $C9C14E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_588:
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	STA $40C8			; 8D C8 40 | Store accumulator to absolute address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_589
; Address: $C9C172
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_589:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0009,Y		  ; 99 09 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000C,Y		  ; 99 0C 00 | Store accumulator to absolute,Y
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_58B
; Address: $C9C1C7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_58B:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C2			; AE C2 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_58C
; Address: $C9C1D7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_58C:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C2			; 8D C2 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_58D
; Address: $C9C1E6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_58D:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C4			; AE C4 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_58E
; Address: $C9C1FB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_58E:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48C4			; 8E C4 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_58F
; Address: $C9C21C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_58F:
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_590
; Address: $C9C22C
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_590:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_591
; Address: $C9C278
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_591:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_592
; Address: $C9C27E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_592:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C4			; AE C4 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_593
; Address: $C9C288
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_593:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C4			; 8D C4 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_594
; Address: $C9C297
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_594:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C4			; AE C4 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $31			  ; D0 31 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_595
; Address: $C9C2AC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_595:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48C4			; 8E C4 48 | Store X register to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_596
; Address: $C9C2D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_596:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_597
; Address: $C9C2DF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_597:
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_598
; Address: $C9C2E3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_598:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C4			; AE C4 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_599
; Address: $C9C2F3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_599:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C4			; 8D C4 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_59A
; Address: $C9C302
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_59A:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C6			; AE C6 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6E			  ; D0 6E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_59B
; Address: $C9C317
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_59B:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48C6			; 8E C6 48 | Store X register to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_59C
; Address: $C9C320
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_59C:
	JSL $C08DA0		  ; 22 A0 8D C0 | Jump to subroutine long
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_59D
; Address: $C9C339
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_59D:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_59E
; Address: $C9C348
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_59E:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0009,Y		  ; 99 09 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_59F
; Address: $C9C39B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_59F:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A0
; Address: $C9C3A2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A0:
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C6			; AE C6 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A1
; Address: $C9C3AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A1:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C6			; 8D C6 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A2
; Address: $C9C3BA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A2:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C8			; AE C8 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6E			  ; D0 6E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A3
; Address: $C9C3CF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A3:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48C8			; 8E C8 48 | Store X register to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A4
; Address: $C9C3D8
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A4:
	JSL $C08DA0		  ; 22 A0 8D C0 | Jump to subroutine long
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A5
; Address: $C9C400
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A5:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A6
; Address: $C9C40A
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A6:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0009,Y		  ; 99 09 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A7
; Address: $C9C453
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A7:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48C8			; AE C8 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A8
; Address: $C9C463
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A8:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48C8			; 8D C8 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5A9
; Address: $C9C46E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5A9:
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5AA
; Address: $C9C472
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5AA:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CA			; AE CA 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6E			  ; D0 6E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5AB
; Address: $C9C487
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5AB:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48CA			; 8E CA 48 | Store X register to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5AC
; Address: $C9C490
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5AC:
	JSL $C08DA0		  ; 22 A0 8D C0 | Jump to subroutine long
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5AD
; Address: $C9C4B8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5AD:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0009,Y		  ; 99 09 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5AE
; Address: $C9C4DA
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5AE:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5AF
; Address: $C9C50B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5AF:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CA			; AE CA 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B0
; Address: $C9C51B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B0:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48CA			; 8D CA 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B1
; Address: $C9C52A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B1:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B2
; Address: $C9C531
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B2:
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CC			; AE CC 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6E			  ; D0 6E | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B3
; Address: $C9C53F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B3:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48CC			; 8E CC 48 | Store X register to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B4
; Address: $C9C548
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B4:
	JSL $C08DA0		  ; 22 A0 8D C0 | Jump to subroutine long
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B5
; Address: $C9C570
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B5:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0009,Y		  ; 99 09 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B6
; Address: $C9C5A4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B6:
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B7
; Address: $C9C5C3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B7:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CC			; AE CC 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $6A			  ; D0 6A | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B8
; Address: $C9C5D8
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B8:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48CC			; 8E CC 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5B9
; Address: $C9C609
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5B9:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5BA
; Address: $C9C65B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5BA:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CC			; AE CC 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5BB
; Address: $C9C66B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5BB:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48CC			; 8D CC 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5BC
; Address: $C9C67A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5BC:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $48DA,X		  ; BD DA 48 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5BD
; Address: $C9C692
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5BD:
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5BE
; Address: $C9C699
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5BE:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CE			; AE CE 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5BF
; Address: $C9C6AE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5BF:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48CE			; 8E CE 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C0
; Address: $C9C6C1
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C0:
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C1
; Address: $C9C6DF
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C1:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C3
; Address: $C9C72B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C3:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CE			; AE CE 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C4
; Address: $C9C73B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C4:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48CE			; 8D CE 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C5
; Address: $C9C74A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C5:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D0			; AE D0 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C6
; Address: $C9C75F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C6:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48D0			; 8E D0 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C7
; Address: $C9C781
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C7:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C8
; Address: $C9C790
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C8:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5C9
; Address: $C9C7DC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5C9:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5CA
; Address: $C9C7E3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5CA:
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D0			; AE D0 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5CB
; Address: $C9C7EC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5CB:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48D0			; 8D D0 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5CC
; Address: $C9C7FB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5CC:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D2			; AE D2 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5CD
; Address: $C9C810
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5CD:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48D2			; 8E D2 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5CE
; Address: $C9C841
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5CE:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5CF
; Address: $C9C88D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5CF:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D2			; AE D2 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D1
; Address: $C9C8A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D1:
	STA $48D2			; 8D D2 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D2
; Address: $C9C8AC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D2:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D4			; AE D4 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D3
; Address: $C9C8C1
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D3:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48D4			; 8E D4 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D4
; Address: $C9C8F2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D4:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D5
; Address: $C9C906
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D5:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D6
; Address: $C9C93E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D6:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D4			; AE D4 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D7
; Address: $C9C94E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D7:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48D4			; 8D D4 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D8
; Address: $C9C95D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D8:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D6			; AE D6 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5D9
; Address: $C9C972
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5D9:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48D6			; 8E D6 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5DA
; Address: $C9C9A3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5DA:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5DB
; Address: $C9C9C6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5DB:
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5DC
; Address: $C9C9EF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5DC:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D6			; AE D6 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5DD
; Address: $C9C9FF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5DD:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48D6			; 8D D6 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5DE
; Address: $C9CA0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5DE:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5DF
; Address: $C9CA16
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5DF:
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D8			; AE D8 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $64			  ; D0 64 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E0
; Address: $C9CA23
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E0:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	STX $48D8			; 8E D8 48 | Store X register to absolute address
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $EA9D,X		  ; 7D 9D EA | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	WDM #$8D			 ; 42 8D | Reserved instruction
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E1
; Address: $C9CA54
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E1:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	STA $0003,Y		  ; 99 03 00 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC #$E0			 ; 69 E0 | Game work RAM access
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDY $48FA,X		  ; BC FA 48 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E2
; Address: $C9CA8A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E2:
	PHX				  ; DA | Push X register to stack
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0007,Y		  ; 99 07 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E3
; Address: $C9CAA0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E3:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48D8			; AE D8 48 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E4
; Address: $C9CAB0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E4:
	JSR $CB92			; 20 92 CB | Jump to subroutine
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48D8			; 8D D8 48 | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E5
; Address: $C9CABF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E5:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $48CE			; AE CE 48 | Load from absolute address into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E7
; Address: $C9CAD8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E7:
	LDA $48D2			; AD D2 48 | Load from absolute address into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E8
; Address: $C9CAE0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E8:
	JSL $C4C88D		  ; 22 8D C8 C4 | Jump to subroutine long
	LDX $48CE			; AE CE 48 | Load from absolute address into X register
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	WDM #$A0			 ; 42 A0 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5E9
; Address: $C9CAED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5E9:
	JSR $CB24			; 20 24 CB | Jump to subroutine
	LDX $48CE			; AE CE 48 | Load from absolute address into X register
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	WDM #$A0			 ; 42 A0 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5EA
; Address: $C9CAF9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5EA:
	JSR $CB24			; 20 24 CB | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5EB
; Address: $C9CB02
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5EB:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$D2			 ; A0 D2 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5EC
; Address: $C9CB12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5EC:
	JSR $CB6F			; 20 6F CB | Jump to subroutine
	LDY #$D6			 ; A0 D6 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5EE
; Address: $C9CB1B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5EE:
	JSL $C4C72B		  ; 22 2B C7 C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5EF
; Address: $C9CB24
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5EF:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F0
; Address: $C9CB27
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F0:
	JSR $C67A			; 20 7A C6 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F1
; Address: $C9CB32
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F1:
	LDA $48EA,Y		  ; B9 EA 48 | Load from absolute,Y into accumulator
	STA $48EA,X		  ; 9D EA 48 | Store accumulator to absolute,X
	LDA $48FA,Y		  ; B9 FA 48 | Load from absolute,Y into accumulator
	STA $48FA,X		  ; 9D FA 48 | Store accumulator to absolute,X
	LDA $490A,Y		  ; B9 0A 49 | Load from absolute,Y into accumulator
	STA $490A,X		  ; 9D 0A 49 | Store accumulator to absolute,X
	LDA $491A,Y		  ; B9 1A 49 | Load from absolute,Y into accumulator
	STA $491A,X		  ; 9D 1A 49 | Store accumulator to absolute,X
	LDA $48FA,X		  ; BD FA 48 | Load from absolute,X into accumulator
	STA $40C5			; 8D C5 40 | Store accumulator to absolute address
	ORA $8D			  ; 05 8D | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $40C7			; 8D C7 40 | Store accumulator to absolute address
	STA $40CA			; 8D CA 40 | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F2
; Address: $C9CB64
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F2:
	JSL $C02692		  ; 22 92 26 C0 | Jump to subroutine long
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F3
; Address: $C9CB6F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F3:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $48DA,X		  ; BD DA 48 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F4
; Address: $C9CB84
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F4:
	JSL $C02714		  ; 22 14 27 C0 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F5
; Address: $C9CB92
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F5:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	LDA $48DA,X		  ; BD DA 48 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F7
; Address: $C9CBA2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F7:
	JSL $C02714		  ; 22 14 27 C0 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $48DA,X		  ; 9D DA 48 | Store accumulator to absolute,X
	LDA $48EA,X		  ; BD EA 48 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F8
; Address: $C9CBB5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F8:
	JSL $C08E1B		  ; 22 1B 8E C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5F9
; Address: $C9CBBD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5F9:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5FA
; Address: $C9CBC8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5FA:
	JSR $CC61			; 20 61 CC | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	STA $06			  ; 85 06 | Store accumulator to zero page
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	STA $04			  ; 85 04 | Store accumulator to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $4C			  ; 85 4C | Store accumulator to zero page
	STZ $41			  ; 64 41 | Store zero to zero page
	REP #$20			 ; C2 20 | Reset processor status bits
	STZ $4A			  ; 64 4A | Store zero to zero page
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	WDM #$8D			 ; 42 8D | Reserved instruction
	WDM #$18			 ; 42 18 | Reserved instruction

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5FB
; Address: $C9CBFF
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5FB:
	ADC $02			  ; 65 02 | Add with carry (zero page)
	STA $08			  ; 85 08 | Store accumulator to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 9E 00 C9 | Load from absolute long,X into accumulator
	BMI $32			  ; 30 32 | Branch if negative
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $4203			; 8D 03 42 | Hardware register operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $4217			; AD 17 42 | Hardware register operation
	STA $40			  ; 85 40 | Store accumulator to zero page
	XBA				  ; EB | Exchange accumulator bytes
	REP #$20			 ; C2 20 | Reset processor status bits
	BEQ $07			  ; F0 07 | Branch if equal
	LDA $40			  ; A5 40 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $08			  ; 65 08 | Add with carry (zero page)
	BRA $04			  ; 80 04 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	CLC				  ; 18 | Clear carry flag
	ADC $02			  ; 65 02 | Add with carry (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	BCC $CD			  ; 90 CD | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5FC
; Address: $C9CC44
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5FC:
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $4203			; 8D 03 42 | Hardware register operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $4217			; AD 17 42 | Hardware register operation
	REP #$20			 ; C2 20 | Reset processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $40			  ; 85 40 | Store accumulator to zero page
	LDA $42			  ; A5 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5FD
; Address: $C9CC58
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5FD:
	XBA				  ; EB | Exchange accumulator bytes
	SEC				  ; 38 | Set carry flag
	SBC $42			  ; E5 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $40			  ; 65 40 | Add with carry (zero page)
	BRA $CB			  ; 80 CB | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $AB48			; 0D 48 AB | Logical OR with accumulator (absolute)
	REP #$30			 ; C2 30 | Reset processor status bits
	STX $40			  ; 86 40 | Store X register to zero page
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7E | Load from absolute long,X into accumulator
	LDX $40			  ; A6 40 | Load from zero page into X register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $ED			  ; 10 ED | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5FE
; Address: $C9CC83
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5FE:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STY $492A			; 8C 2A 49 | Store Y register to absolute address
	BRA $0D			  ; 80 0D | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $02			  ; 86 02 | Store X register to zero page
	STY $04			  ; 84 04 | Store Y register to zero page
	TAX				  ; AA | Transfer accumulator to X register
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $490A,X		  ; BD 0A 49 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_5FF
; Address: $C9CCAC
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_5FF:
	STA $0A			  ; 85 0A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$C0			 ; 69 C0 | Add with carry (immediate)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	LDA $492C			; AD 2C 49 | Load from absolute address into accumulator
	STA $10			  ; 85 10 | Store accumulator to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $492E			; AD 2E 49 | Load from absolute address into accumulator
	BMI $0D			  ; 30 0D | Branch if negative
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	BEQ $38			  ; F0 38 | Branch if equal
	BCS $1E			  ; B0 1E | Branch if carry set
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BRA $33			  ; 80 33 | Branch always
	CLC				  ; 18 | Clear carry flag
	ADC $492A			; 6D 2A 49 | Add with carry (absolute)
	BPL $03			  ; 10 03 | Branch if positive
	CMP $AD00,Y		  ; D9 00 AD | Compare accumulator (absolute,Y)
	ROL $4949			; 2E 49 49 | Rotate left (absolute)
	INC				  ; 1A | Increment accumulator
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCC $03			  ; 90 03 | Branch if carry clear
	REP #$00			 ; C2 00 | Reset processor status bits
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDY $0A			  ; A4 0A | Load from zero page into Y register
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F8			  ; D0 F8 | Branch if not equal
	STY $0A			  ; 84 0A | Store Y register to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STZ $08			  ; 64 08 | Store zero to zero page
	XBA				  ; EB | Exchange accumulator bytes
	STA $06			  ; 85 06 | Store accumulator to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	LDX #$0E			 ; A2 0E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_600
; Address: $C9CD10
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_600:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	LDY $0A			  ; A4 0A | Load from zero page into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_601
; Address: $C9CD1B
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_601:
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX $07			  ; A6 07 | Load from zero page into X register
	LDA				  ; BF AB D0 C4 | Load from absolute long,X into accumulator
	STA $4202			; 8D 02 42 | Hardware register operation
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $4203			; 8D 03 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	ADC $4217			; 6D 17 42 | Hardware register operation
	BCC $02			  ; 90 02 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEC				  ; 38 | Set carry flag
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	SBC $4217			; ED 17 42 | Hardware register operation
	BCS $02			  ; B0 02 | Branch if carry set
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	STA				  ; 9F 00 00 7E | Store accumulator to absolute long,X
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $0C			  ; C4 0C | Compare Y register (zero page)
	BCS $77			  ; B0 77 | Branch if carry set
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $06			  ; 85 06 | Store accumulator to zero page
	BCC $C5			  ; 90 C5 | Branch if carry clear
	STY $0A			  ; 84 0A | Store Y register to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STZ $08			  ; 64 08 | Store zero to zero page
	XBA				  ; EB | Exchange accumulator bytes
	STA $06			  ; 85 06 | Store accumulator to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA $7E492A		  ; AF 2A 49 7E | Load from absolute long address into accumulator
	LDX #$0E			 ; A2 0E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_602
; Address: $C9CD6D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_602:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	LDY $0A			  ; A4 0A | Load from zero page into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX $07			  ; A6 07 | Load from zero page into X register
	LDA				  ; BF AB D1 C4 | Load from absolute long,X into accumulator
	STA $4202			; 8D 02 42 | Hardware register operation
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $4203			; 8D 03 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	ADC $4217			; 6D 17 42 | Hardware register operation
	BCC $02			  ; 90 02 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank12_DmaFunction_603
; Address: $C9CD8B
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_603:
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEC				  ; 38 | Set carry flag
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	SBC $4217			; ED 17 42 | Hardware register operation
	BCS $02			  ; B0 02 | Branch if carry set
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	STA				  ; 9F 00 00 7E | Store accumulator to absolute long,X
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $0C			  ; C4 0C | Compare Y register (zero page)
	BCS $20			  ; B0 20 | Branch if carry set
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $06			  ; 85 06 | Store accumulator to zero page
	BCC $C5			  ; 90 C5 | Branch if carry clear
	STY $0A			  ; 84 0A | Store Y register to zero page
	REP #$20			 ; C2 20 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY $0A			  ; A4 0A | Load from zero page into Y register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $0C			  ; C4 0C | Compare Y register (zero page)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_604
; Address: $C9CDCD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_604:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $02			  ; 86 02 | Store X register to zero page
	STY $04			  ; 84 04 | Store Y register to zero page
	INC $7808,X		  ; FE 08 78 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_605
; Address: $C9CDE3
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_605:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $01			  ; 85 01 | Store accumulator to zero page
	LDA $4934			; AD 34 49 | Load from absolute address into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page
	STY $0C			  ; 84 0C | Store Y register to zero page
	LDA $491A,X		  ; BD 1A 49 | Load from absolute,X into accumulator
	STA $04			  ; 85 04 | Store accumulator to zero page
	LDY $490A,X		  ; BC 0A 49 | Load from absolute,X into Y register
	LDX $4930			; AE 30 49 | Load from absolute address into X register
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F8			  ; D0 F8 | Branch if not equal
	STY $4A			  ; 84 4A | Store Y register to zero page
	LDA $4932			; AD 32 49 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $4930			; ED 30 49 | Subtract with carry (absolute)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA $4936			; AD 36 49 | Load from absolute address into accumulator
	STA $08			  ; 85 08 | Store accumulator to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $0A			  ; 85 0A | Store accumulator to zero page
	LDA $492C			; AD 2C 49 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	STA $0A			  ; 85 0A | Store accumulator to zero page
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $4C			  ; 85 4C | Store accumulator to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	STA $004202		  ; 8F 02 42 00 | Store accumulator to absolute long address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 1E 00 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_606
; Address: $C9CE47
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_606:
	BPL $52			  ; 10 52 | Branch if positive
	SEP #$20			 ; E2 20 | Set processor status bits
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $4203			; 8D 03 42 | Hardware register operation
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $01			  ; A5 01 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)
	STA $01			  ; 85 01 | Store accumulator to zero page
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $4217			; AD 17 42 | Hardware register operation
	REP #$20			 ; C2 20 | Reset processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0A			  ; 65 0A | Add with carry (zero page)
	BMI $21			  ; 30 21 | PPU graphics register access
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	BIT $AA			  ; 24 AA | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $08			  ; 65 08 | Add with carry (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	TXA				  ; 8A | Transfer X register to accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	LSR				  ; 4A | Logical shift right (accumulator)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $0E			  ; C6 0E | Decrement (zero page)
	BNE $B3			  ; D0 B3 | Branch if not equal
	BRA $37			  ; 80 37 | Branch always
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CLC				  ; 18 | Clear carry flag
	ADC $08			  ; 65 08 | Add with carry (zero page)
	BPL $E0			  ; 10 E0 | Game work RAM access
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	BRA $E9			  ; 80 E9 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $4203			; 8D 03 42 | Hardware register operation
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $01			  ; A5 01 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_607
; Address: $C9CEA9
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_607:
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)
	STA $01			  ; 85 01 | Store accumulator to zero page
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $4217			; AD 17 42 | Hardware register operation
	REP #$20			 ; C2 20 | Reset processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BRA $AE			  ; 80 AE | Branch always
	LDA $01			  ; A5 01 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)
	STA $01			  ; 85 01 | Store accumulator to zero page
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	BRA $A3			  ; 80 A3 | Branch always
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $4932			; AE 32 49 | Load from absolute address into X register
	CPX $04			  ; E4 04 | Compare X register (zero page)
	BCS $0B			  ; B0 0B | Branch if carry set
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F8			  ; D0 F8 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_608
; Address: $C9CEE2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_608:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_609
; Address: $C9CEED
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_609:
	JSR $CC61			; 20 61 CC | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_60A
; Address: $C9CF00
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_60A:
	STA $04			  ; 85 04 | Store accumulator to zero page
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	ASL $8A			  ; 06 8A | Arithmetic shift left (zero page)
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_60B
; Address: $C9CF18
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_60B:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC $07			  ; E5 07 | Subtract with carry (zero page)
	STA $07			  ; 85 07 | Store accumulator to zero page
	ORA $38			  ; 05 38 | Logical OR with accumulator (zero page)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	AND $0A85,X		  ; 3D 85 0A | Logical AND with accumulator (absolute,X)
	LDA $07			  ; A5 07 | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0A			  ; 65 0A | Add with carry (zero page)
	BCS $1C			  ; B0 1C | Branch if carry set
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	BCC $EC			  ; 90 EC | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_60C
; Address: $C9CF53
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_60C:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_60D
; Address: $C9CF5E
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_60D:
	CLC				  ; 18 | Clear carry flag
	ADC $0A			  ; 65 0A | Add with carry (zero page)
	BCS $E4			  ; B0 E4 | Branch if carry set
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	BCC $EC			  ; 90 EC | Branch if carry clear
	BRA $E2			  ; 80 E2 | Branch always
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $0A			  ; 85 0A | Store accumulator to zero page
	LDA $07			  ; A5 07 | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	BCC $18			  ; 90 18 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	BCC $EC			  ; 90 EC | Branch if carry clear
	BRA $BD			  ; 80 BD | Branch always
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	BCC $E8			  ; 90 E8 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	BCC $EC			  ; 90 EC | Branch if carry clear
	BRA $A5			  ; 80 A5 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_60F
; Address: $C9CFB5
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_60F:
	JSR $CC61			; 20 61 CC | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	CLC				  ; 18 | Clear carry flag
	ADC $0000,Y		  ; 79 00 00 | Add with carry (absolute,Y)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	BCC $E3			  ; 90 E3 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_610
; Address: $C9CFF9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_610:
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	BRA $E5			  ; 80 E5 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_611
; Address: $C9D007
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_611:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA $493C			; 8D 3C 49 | Store accumulator to absolute address
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $493A			; 8D 3A 49 | Store accumulator to absolute address
	STX $4938			; 8E 38 49 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC $4938			; ED 38 49 | Subtract with carry (absolute)
	STA $4938			; 8D 38 49 | Store accumulator to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	LDX $48CC			; AE CC 48 | Load from absolute address into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $493E			; 9C 3E 49 | Store zero to absolute
	LDA $493E			; AD 3E 49 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $493A			; 6D 3A 49 | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $493E			; 8D 3E 49 | Store accumulator to absolute address
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $493C			; 0D 3C 49 | Logical OR with accumulator (absolute)
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $4938			; CE 38 49 | Decrement (absolute)
	BNE $DE			  ; D0 DE | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_612
; Address: $C9D05F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_612:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_613
; Address: $C9D067
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_613:
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $01			  ; B0 01 | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCC $0B			  ; 90 0B | Branch if carry clear
	SBC #$E0			 ; E9 E0 | Game work RAM access
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register
	PHX				  ; DA | Push X register to stack
	LDX $48CC			; AE CC 48 | Load from absolute address into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $490A,X		  ; 7D 0A 49 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_614
; Address: $C9D0AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_614:
	BPL $16			  ; 10 16 | Branch if positive
	AND $3732			; 2D 32 37 | Logical AND with accumulator (absolute)
	LSR $4A			  ; 46 4A | Logical shift right (zero page)
	EOR $5350			; 4D 50 53 | Exclusive OR with accumulator (absolute)
	EOR $5E5B,Y		  ; 59 5B 5E | Exclusive OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_615
; Address: $C9D0C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_615:
	ADC $67			  ; 65 67 | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($706E)		  ; 6C 6E 70 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $817F,X		  ; 7D 7F 81 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; AudioLookupTable1 - Audio parameter lookup data
; Address: $C9D0D0
; Size: 106 bytes
;------------------------------------------------------------------------------
AudioLookupTable1:
	db $84, $86, $89, $8A, $8C, $8E, $8F, $90, $92, $99, $9A, $9B, $9D, $9E, $9F, $A1
	db $A2, $A4, $A5, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF, $B0, $B1, $B3, $B8, $B9
	db $BA, $BB, $BC, $BD, $BE, $BF, $C0, $C1, $C2, $C2, $C3, $C4, $C5, $C6, $C7, $C8
	db $C9, $CA, $CA, $CC, $CD, $CD, $CE, $CF, $D0, $D0, $D1, $D8, $D8, $D9, $DA, $DA
	db $DD, $DD, $DE, $DE, $DF, $DF, $E0, $E1, $E1, $E2, $E2, $E3, $E4, $E4, $E5, $E5
	db $E6, $E6, $E8, $E8, $E9, $E9, $E9, $EA, $EA, $EB, $EB, $EC, $EC, $EC, $ED, $ED
	db $EE, $EE, $EE, $EF, $F0, $F0, $F0, $F1, $F1, $F1

;------------------------------------------------------------------------------
; AudioLookupTable2 - Audio parameter lookup data (reverse sequence)
; Address: $C9D15E
; Size: 103 bytes
;------------------------------------------------------------------------------
AudioLookupTable2:
	db $F4, $F4, $F4, $F8, $F8, $F8, $F8, $F9, $F9, $F9, $F9, $FA, $FA, $FA, $FA, $FA
	db $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	db $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD, $FC, $FA, $FA, $FA
	db $FA, $FA, $F9, $F9, $F9, $F9, $F8, $F8, $F8, $F8, $F4, $F4, $F4, $F1, $F1, $F1
	db $F0, $F0, $F0, $EE, $EE, $EE, $ED, $ED, $EC, $EC, $EC, $EB, $EA, $EA, $E9, $E9
	db $E9, $E8, $E8, $E6, $E6, $E5, $E5, $E4, $E4, $E3, $E2, $E1, $E0, $DF, $DE, $DD
	db $DC, $DB, $DA, $D9, $D8, $D7, $D6, $D5, $D4, $D3, $D2
	SEP #$E2			 ; E2 E2 | Set processor status bits
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CPX #$DF			 ; E0 DF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_618
; Address: $C9D229
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_618:
	DEC $DDDE,X		  ; DE DE DD | Decrement (absolute,X)
	CMP $DBDC,X		  ; DD DC DB | Compare accumulator (absolute,X)
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	CMP $D8D8,Y		  ; D9 D8 D8 | Compare accumulator (absolute,Y)
	CMP ($D0),Y		  ; D1 D0 | Compare accumulator ((zero page),Y)
	BNE $CF			  ; D0 CF | Branch if not equal
	DEC $CDCD			; CE CD CD | Decrement (absolute)
	CPY $CACB			; CC CB CA | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	DEC $C5			  ; C6 C5 | Decrement (zero page)
	CPY $C3			  ; C4 C3 | Compare Y register (zero page)
	REP #$C2			 ; C2 C2 | Reset processor status bits
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	LDA				  ; BF BE BD BC | Load from absolute long,X into accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $B7B8,Y		  ; B9 B8 B7 | Load from absolute,Y into accumulator
	LDA ($B0),Y		  ; B1 B0 | Load from (zero page),Y into accumulator
	LDA $ACADAE		  ; AF AE AD AC | Load from absolute long address into accumulator
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$A8			 ; A9 A8 | Load immediate value into accumulator
	LDA $A4			  ; A5 A4 | Load from zero page into accumulator
	LDX #$A1			 ; A2 A1 | Load immediate value into X register
	STA				  ; 9F 9E 9D 9B | Store accumulator to absolute long,X
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9697,Y		  ; 99 97 96 | Store accumulator to absolute,Y
	BCC $8F			  ; 90 8F | Branch if carry clear
	STX $8A8C			; 8E 8C 8A | Store X register to absolute address
	BIT #$87			 ; 89 87 | Test bits in accumulator (immediate)
	STX $84			  ; 86 84 | Store X register to zero page
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	ADC $7A7B,X		  ; 7D 7B 7A | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $6E			  ; 70 6E | Branch if overflow set
	JMP ($676A)		  ; 6C 6A 67 | Jump to address (absolute indirect)
	ADC $63			  ; 65 63 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank12_DmaFunction_619
; Address: $C9D299
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_619:
	LSR $595B,X		  ; 5E 5B 59 | Logical shift right (absolute,X)
	BVC $4D			  ; 50 4D | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $43			  ; 46 43 | Logical shift right (zero page)
	AND $1F27			; 2D 27 1F | Logical AND with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $3725,Y		  ; 79 25 37 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_61A
; Address: $C9D2B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_61A:
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	EOR $3694			; 4D 94 36 | Exclusive OR with accumulator (absolute)
	REP #$30			 ; C2 30 | Reset processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_61C
; Address: $C9D2C8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_61C:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $3694			; 8D 94 36 | Store accumulator to absolute address
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_61D
; Address: $C9D2D3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_61D:
	JSL $C4D2AB		  ; 22 AB D2 C4 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $3695			; 8D 95 36 | Store accumulator to absolute address
	REP #$30			 ; C2 30 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_61E
; Address: $C9D2E0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_61E:
	PHA				  ; 48 | Push accumulator to stack
	PEA #$368A		   ; F4 8A 36 | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_620
; Address: $C9D2F0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_620:
	JSL $C4D2AB		  ; 22 AB D2 C4 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	CMP $3695			; CD 95 36 | Compare accumulator (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PEA #$368A		   ; F4 8A 36 | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_621
; Address: $C9D306
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_621:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	REP #$30			 ; C2 30 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_622
; Address: $C9D30E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_622:
	ROR $3925,X		  ; 7E 25 39 | Rotate right (absolute,X)
	ADC ($39,X)		  ; 61 39 | Add with carry ((zero page,X))
	STA $D939,X		  ; 9D 39 D9 | Store accumulator to absolute,X
	AND $3A15,Y		  ; 39 15 3A | Logical AND with accumulator (absolute,Y)
	EOR ($3A),Y		  ; 51 3A | Exclusive OR with accumulator ((zero page),Y)
	STA $C93A			; 8D 3A C9 | Store accumulator to absolute address
	DEC				  ; 3A | Decrement accumulator
	ORA $3B			  ; 05 3B | Logical OR with accumulator (zero page)
	EOR ($3B,X)		  ; 41 3B | Exclusive OR with accumulator ((zero page,X))
	ADC $B93B,X		  ; 7D 3B B9 | Add with carry (absolute,X)
	AND ($3C),Y		  ; 31 3C | Logical AND with accumulator ((zero page),Y)
	ADC $A93C			; 6D 3C A9 | Add with carry (absolute)
	SBC $3C			  ; E5 3C | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_623
; Address: $C9D331
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_623:
	AND ($3D,X)		  ; 21 3D | Logical AND with accumulator ((zero page,X))
	EOR $993D,X		  ; 5D 3D 99 | Exclusive OR with accumulator (absolute,X)
	AND $3DD5,X		  ; 3D D5 3D | Logical AND with accumulator (absolute,X)
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	EOR $893E			; 4D 3E 89 | Exclusive OR with accumulator (absolute)
	ROL $C208,X		  ; 3E 08 C2 | Rotate left (absolute,X)
	BMI $48			  ; 30 48 | Branch if negative
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_624
; Address: $C9D346
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_624:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_625
; Address: $C9D358
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_625:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_626
; Address: $C9D364
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_626:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_627
; Address: $C9D36B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_627:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$71			 ; A9 71 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$7D			 ; A9 7D | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_628
; Address: $C9D37D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_628:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_629
; Address: $C9D389
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_629:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_62C
; Address: $C9D394
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_62C:
	JSL $C9E41A		  ; 22 1A E4 C9 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D3FC			; 4C FC D3 | Jump to address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_62D
; Address: $C9D39D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_62D:
	JSL $C9E292		  ; 22 92 E2 C9 | Jump to subroutine long
	LDA #$81			 ; A9 81 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $2BBE			; AD BE 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_62E
; Address: $C9D3B4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_62E:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BC0			; AD C0 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_62F
; Address: $C9D3C4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_62F:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BC2			; AD C2 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_630
; Address: $C9D3D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_630:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BC4			; AD C4 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_631
; Address: $C9D3E4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_631:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BC6			; AD C6 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_633
; Address: $C9D3F8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_633:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_635
; Address: $C9D407
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_635:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_637
; Address: $C9D40F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_637:
	JSL $C9E41A		  ; 22 1A E4 C9 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D47B			; 4C 7B D4 | Jump to address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_639
; Address: $C9D41C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_639:
	JSL $C9E292		  ; 22 92 E2 C9 | Jump to subroutine long
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $2BC8			; AD C8 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_63A
; Address: $C9D433
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_63A:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BCA			; AD CA 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_63B
; Address: $C9D443
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_63B:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BCC			; AD CC 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_63C
; Address: $C9D453
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_63C:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BCE			; AD CE 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_63D
; Address: $C9D463
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_63D:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BD0			; AD D0 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_63F
; Address: $C9D477
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_63F:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_641
; Address: $C9D483
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_641:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_643
; Address: $C9D48E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_643:
	JSL $C9E41A		  ; 22 1A E4 C9 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D502			; 4C 02 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank12_DmaFunction_646
; Address: $C9D49F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_646:
	JSL $C9E292		  ; 22 92 E2 C9 | Jump to subroutine long
	LDA #$97			 ; A9 97 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $2BD2			; AD D2 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_647
; Address: $C9D4B6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_647:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BD4			; AD D4 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_648
; Address: $C9D4C6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_648:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BD6			; AD D6 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_649
; Address: $C9D4D6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_649:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BD8			; AD D8 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_64A
; Address: $C9D4E6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_64A:
	JSL $C9E309		  ; 22 09 E3 C9 | Jump to subroutine long
	LDA $2BDA			; AD DA 2B | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_64E
; Address: $C9D503
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_64E:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_64F
; Address: $C9D50A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_64F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_651
; Address: $C9D515
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_651:
	JSL $C9E41A		  ; 22 1A E4 C9 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D53D			; 4C 3D D5 | Jump to address
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_654
; Address: $C9D539
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_654:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_655
; Address: $C9D545
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_655:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_657
; Address: $C9D550
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_657:
	JSL $C9E41A		  ; 22 1A E4 C9 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D578			; 4C 78 D5 | Jump to address
	LDA #$B4			 ; A9 B4 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_65B
; Address: $C9D574
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_65B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_65C
; Address: $C9D580
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_65C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_65E
; Address: $C9D58B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_65E:
	JSL $C9E41A		  ; 22 1A E4 C9 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D5B3			; 4C B3 D5 | Jump to address
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_661
; Address: $C9D5AF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_661:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_662
; Address: $C9D5BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_662:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_663
; Address: $C9D5C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_663:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$DB			 ; A9 DB | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_664
; Address: $C9D5CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_664:
	LDA $33F2			; AD F2 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_665
; Address: $C9D5D6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_665:
	JSL $C9E2EA		  ; 22 EA E2 C9 | Jump to subroutine long
	LDA $7C			  ; A5 7C | Load from zero page into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_666
; Address: $C9D5E2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_666:
	JSL $C9E2EA		  ; 22 EA E2 C9 | Jump to subroutine long
	LDA $7E			  ; A5 7E | Load from zero page into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_668
; Address: $C9D5F2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_668:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_669
; Address: $C9D5FE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_669:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_66A
; Address: $C9D605
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_66A:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	SBC $CC22			; ED 22 CC | Subtract with carry (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_66C
; Address: $C9D614
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_66C:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_66D
; Address: $C9D620
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_66D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_671
; Address: $C9D636
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_671:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_672
; Address: $C9D642
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_672:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_673
; Address: $C9D649
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_673:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_675
; Address: $C9D658
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_675:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_676
; Address: $C9D664
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_676:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_677
; Address: $C9D66B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_677:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_679
; Address: $C9D67A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_679:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_67B
; Address: $C9D687
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_67B:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_67C
; Address: $C9D68D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_67C:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$21			 ; A9 21 | PPU graphics register access
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_67E
; Address: $C9D6A5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_67E:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_67F
; Address: $C9D6B1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_67F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_680
; Address: $C9D6B8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_680:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F2			; AD F2 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_682
; Address: $C9D6D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_682:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_683
; Address: $C9D6DC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_683:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_685
; Address: $C9D6E3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_685:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F4			; AD F4 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_687
; Address: $C9D6FB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_687:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_688
; Address: $C9D707
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_688:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_689
; Address: $C9D70E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_689:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$42			 ; A9 42 | Hardware register operation
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_68B
; Address: $C9D72D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_68B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_68C
; Address: $C9D739
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_68C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_68D
; Address: $C9D740
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_68D:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_68F
; Address: $C9D766
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_68F:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_690
; Address: $C9D772
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_690:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_691
; Address: $C9D779
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_691:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_693
; Address: $C9D798
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_693:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_695
; Address: $C9D7A5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_695:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_696
; Address: $C9D7AB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_696:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$83			 ; A9 83 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$8D			 ; A9 8D | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_698
; Address: $C9D7CA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_698:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_699
; Address: $C9D7D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_699:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_69A
; Address: $C9D7DD
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_69A:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$98			 ; A9 98 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$9E			 ; A9 9E | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_69C
; Address: $C9D803
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_69C:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_69D
; Address: $C9D80B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_69D:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_69E
; Address: $C9D80F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_69E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_69F
; Address: $C9D816
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_69F:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$A6			 ; A9 A6 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6A1
; Address: $C9D835
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6A1:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6A2
; Address: $C9D841
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6A2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6A3
; Address: $C9D848
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6A3:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$BC			 ; A9 BC | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6A6
; Address: $C9D86C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6A6:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6A7
; Address: $C9D873
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6A7:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6A8
; Address: $C9D87A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6A8:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$CF			 ; A9 CF | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$DB			 ; A9 DB | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6AA
; Address: $C9D899
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6AA:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6AB
; Address: $C9D8A5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6AB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6AC
; Address: $C9D8AC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6AC:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$E6			 ; A9 E6 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$F2			 ; A9 F2 | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6AE
; Address: $C9D8CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6AE:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6AF
; Address: $C9D8D7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6AF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6B0
; Address: $C9D8DE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6B0:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$FD			 ; A9 FD | Load immediate value into accumulator
	INC $CC22			; EE 22 CC | Increment (absolute)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6B2
; Address: $C9D8F6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6B2:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6B3
; Address: $C9D902
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6B3:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6B6
; Address: $C9D917
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6B6:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6B8
; Address: $C9D928
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6B8:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6B9
; Address: $C9D92F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6B9:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6BA
; Address: $C9D934
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6BA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6BD
; Address: $C9D949
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6BD:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6BF
; Address: $C9D95A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6BF:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6C0
; Address: $C9D966
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6C0:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6C7
; Address: $C9D991
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6C7:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6C8
; Address: $C9D99A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6C8:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6C9
; Address: $C9D99D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6C9:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6CC
; Address: $C9D9B2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6CC:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6CE
; Address: $C9D9C3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6CE:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6CF
; Address: $C9D9CF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6CF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6D2
; Address: $C9D9E4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6D2:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6D4
; Address: $C9D9F5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6D4:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6D6
; Address: $C9DA01
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6D6:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6D9
; Address: $C9DA16
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6D9:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6DB
; Address: $C9DA27
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6DB:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6DC
; Address: $C9DA33
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6DC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6DF
; Address: $C9DA48
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6DF:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6E1
; Address: $C9DA59
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6E1:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6E3
; Address: $C9DA66
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6E3:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6E6
; Address: $C9DA7A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6E6:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6E8
; Address: $C9DA8B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6E8:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6E9
; Address: $C9DA97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6E9:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6EC
; Address: $C9DAAC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6EC:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6EE
; Address: $C9DABD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6EE:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6EF
; Address: $C9DAC9
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6EF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6F0
; Address: $C9DACD
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6F0:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6F3
; Address: $C9DADE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6F3:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6F5
; Address: $C9DAEF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6F5:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6F6
; Address: $C9DAFB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6F6:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6F9
; Address: $C9DB10
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6F9:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6FB
; Address: $C9DB21
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6FB:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_6FC
; Address: $C9DB2D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_6FC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_700
; Address: $C9DB42
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_700:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_702
; Address: $C9DB53
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_702:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_703
; Address: $C9DB5F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_703:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_704
; Address: $C9DB66
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_704:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_706
; Address: $C9DB85
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_706:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_707
; Address: $C9DB91
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_707:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_709
; Address: $C9DB98
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_709:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$22			 ; A9 22 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_70B
; Address: $C9DBB7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_70B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_70C
; Address: $C9DBC3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_70C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_70D
; Address: $C9DBCA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_70D:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_70F
; Address: $C9DBE9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_70F:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_710
; Address: $C9DBF5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_710:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_711
; Address: $C9DBF9
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_711:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_712
; Address: $C9DBFC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_712:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_714
; Address: $C9DC1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_714:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_715
; Address: $C9DC27
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_715:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_716
; Address: $C9DC2E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_716:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_718
; Address: $C9DC4D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_718:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_71A
; Address: $C9DC5A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_71A:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_71B
; Address: $C9DC60
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_71B:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_71D
; Address: $C9DC7F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_71D:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_71E
; Address: $C9DC8B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_71E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_71F
; Address: $C9DC92
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_71F:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$82			 ; A9 82 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_721
; Address: $C9DCB1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_721:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_723
; Address: $C9DCBD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_723:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_724
; Address: $C9DCC4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_724:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$8D			 ; A9 8D | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$97			 ; A9 97 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_726
; Address: $C9DCE3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_726:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_727
; Address: $C9DCEF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_727:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_728
; Address: $C9DCF6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_728:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_72A
; Address: $C9DD15
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_72A:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_72B
; Address: $C9DD1E
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_72B:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_72C
; Address: $C9DD21
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_72C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_72D
; Address: $C9DD28
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_72D:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_72F
; Address: $C9DD47
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_72F:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_730
; Address: $C9DD53
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_730:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_731
; Address: $C9DD5A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_731:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$DC			 ; A9 DC | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_733
; Address: $C9DD79
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_733:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_734
; Address: $C9DD80
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_734:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_735
; Address: $C9DD85
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_735:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_736
; Address: $C9DD8C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_736:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$F1			 ; A9 F1 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_738
; Address: $C9DDAB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_738:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_739
; Address: $C9DDB7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_739:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_73A
; Address: $C9DDBE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_73A:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_73D
; Address: $C9DDE1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_73D:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_73E
; Address: $C9DDE9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_73E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_73F
; Address: $C9DDF0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_73F:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_741
; Address: $C9DE0F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_741:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_742
; Address: $C9DE1B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_742:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_743
; Address: $C9DE22
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_743:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_745
; Address: $C9DE41
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_745:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_746
; Address: $C9DE4D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_746:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_747
; Address: $C9DE54
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_747:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_749
; Address: $C9DE73
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_749:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_74A
; Address: $C9DE7F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_74A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_74B
; Address: $C9DE86
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_74B:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_74E
; Address: $C9DEA5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_74E:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_74F
; Address: $C9DEB1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_74F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_750
; Address: $C9DEB8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_750:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$66			 ; A9 66 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_752
; Address: $C9DED7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_752:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_753
; Address: $C9DEE3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_753:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_754
; Address: $C9DEEA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_754:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$71			 ; A9 71 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$7B			 ; A9 7B | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_755
; Address: $C9DEFC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_755:
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_757
; Address: $C9DF09
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_757:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_758
; Address: $C9DF15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_758:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_759
; Address: $C9DF1C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_759:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$86			 ; A9 86 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_75B
; Address: $C9DF3B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_75B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_75C
; Address: $C9DF47
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_75C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_75D
; Address: $C9DF4E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_75D:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$9B			 ; A9 9B | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_75E
; Address: $C9DF5B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_75E:
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_760
; Address: $C9DF6D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_760:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_761
; Address: $C9DF79
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_761:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_762
; Address: $C9DF80
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_762:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$B4			 ; A9 B4 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$C2			 ; A9 C2 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_764
; Address: $C9DF9F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_764:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_765
; Address: $C9DFAB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_765:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_766
; Address: $C9DFB2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_766:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$CD			 ; A9 CD | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank12_DmaFunction_767
; Address: $C9DFBA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_767:
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$D5			 ; A9 D5 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_769
; Address: $C9DFD1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_769:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_76A
; Address: $C9DFDD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_76A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_76B
; Address: $C9DFE4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_76B:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_76D
; Address: $C9E003
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_76D:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_76E
; Address: $C9E00F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_76E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_770
; Address: $C9E01A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_770:
	LDA #$F3			 ; A9 F3 | Load immediate value into accumulator
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CPY $C9E2			; CC E2 C9 | Compare Y register (absolute)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_771
; Address: $C9E024
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_771:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_773
; Address: $C9E035
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_773:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_774
; Address: $C9E041
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_774:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_777
; Address: $C9E056
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_777:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_779
; Address: $C9E067
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_779:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_77A
; Address: $C9E073
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_77A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_77D
; Address: $C9E088
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_77D:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_77F
; Address: $C9E099
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_77F:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_780
; Address: $C9E0A5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_780:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_783
; Address: $C9E0BA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_783:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_785
; Address: $C9E0CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_785:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_786
; Address: $C9E0D7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_786:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_789
; Address: $C9E0EC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_789:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_78B
; Address: $C9E0FD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_78B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_78C
; Address: $C9E109
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_78C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_78F
; Address: $C9E11E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_78F:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_791
; Address: $C9E12F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_791:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_792
; Address: $C9E13B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_792:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_796
; Address: $C9E157
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_796:
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_798
; Address: $C9E161
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_798:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_799
; Address: $C9E16D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_799:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_79C
; Address: $C9E182
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_79C:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_79E
; Address: $C9E193
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_79E:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_79F
; Address: $C9E19F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_79F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7A2
; Address: $C9E1B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7A2:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7A5
; Address: $C9E1C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7A5:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7A6
; Address: $C9E1D1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7A6:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7A9
; Address: $C9E1E6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7A9:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7AB
; Address: $C9E1F7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7AB:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7AC
; Address: $C9E203
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7AC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7AF
; Address: $C9E218
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7AF:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7B1
; Address: $C9E229
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7B1:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7B2
; Address: $C9E235
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7B2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7B5
; Address: $C9E24A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7B5:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7B7
; Address: $C9E25B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7B7:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7B8
; Address: $C9E267
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7B8:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7BB
; Address: $C9E27C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7BB:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7BE
; Address: $C9E292
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7BE:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7BF
; Address: $C9E299
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7BF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7C3
; Address: $C9E2B2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7C3:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7C4
; Address: $C9E2BE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7C4:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7C8
; Address: $C9E2D7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7C8:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7C9
; Address: $C9E2E3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7C9:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7CC
; Address: $C9E2F8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7CC:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7CE
; Address: $C9E309
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7CE:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7CF
; Address: $C9E315
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7CF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7D2
; Address: $C9E32A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7D2:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7D4
; Address: $C9E33B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7D4:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7D5
; Address: $C9E347
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7D5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7D8
; Address: $C9E35C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7D8:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7DA
; Address: $C9E36D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7DA:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7DB
; Address: $C9E379
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7DB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7DE
; Address: $C9E38E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7DE:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7E0
; Address: $C9E39F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7E0:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7E1
; Address: $C9E3AB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7E1:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7E4
; Address: $C9E3C0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7E4:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7E6
; Address: $C9E3D1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7E6:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7E7
; Address: $C9E3DD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7E7:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7EA
; Address: $C9E3F2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7EA:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7EC
; Address: $C9E403
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7EC:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7ED
; Address: $C9E40F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7ED:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7F1
; Address: $C9E42B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7F1:
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7F3
; Address: $C9E435
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7F3:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7F4
; Address: $C9E441
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7F4:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7F7
; Address: $C9E456
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7F7:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7F9
; Address: $C9E467
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7F9:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7FA
; Address: $C9E473
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7FA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_7FD
; Address: $C9E488
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_7FD:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_800
; Address: $C9E499
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_800:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_801
; Address: $C9E4A5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_801:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_802
; Address: $C9E4AC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_802:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_804
; Address: $C9E4CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_804:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_805
; Address: $C9E4D7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_805:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_806
; Address: $C9E4DE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_806:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_807
; Address: $C9E4F3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_807:
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_809
; Address: $C9E4FD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_809:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_80A
; Address: $C9E509
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_80A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_80B
; Address: $C9E510
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_80B:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_80D
; Address: $C9E52F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_80D:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_80E
; Address: $C9E53B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_80E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_80F
; Address: $C9E542
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_80F:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_810
; Address: $C9E552
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_810:
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_812
; Address: $C9E561
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_812:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_813
; Address: $C9E56D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_813:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_814
; Address: $C9E574
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_814:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_816
; Address: $C9E593
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_816:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_817
; Address: $C9E59F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_817:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_818
; Address: $C9E5A6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_818:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits

;------------------------------------------------------------------------------
; Bank12_DmaFunction_819
; Address: $C9E5B1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_819:
	LDA #$9D			 ; A9 9D | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_81B
; Address: $C9E5C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_81B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_81C
; Address: $C9E5D1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_81C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_81D
; Address: $C9E5D8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_81D:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$A8			 ; A9 A8 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_81F
; Address: $C9E5F7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_81F:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_820
; Address: $C9E603
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_820:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_822
; Address: $C9E610
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_822:
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$CA			 ; A9 CA | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_824
; Address: $C9E629
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_824:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_825
; Address: $C9E635
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_825:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_826
; Address: $C9E63C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_826:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$D5			 ; A9 D5 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_828
; Address: $C9E65B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_828:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_829
; Address: $C9E667
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_829:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_82A
; Address: $C9E66E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_82A:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$ED			 ; A9 ED | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA #$FB			 ; A9 FB | Load immediate value into accumulator
	PEA #$CC22		   ; F4 22 CC | Push effective address to stack
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_82C
; Address: $C9E68D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_82C:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_82D
; Address: $C9E699
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_82D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_830
; Address: $C9E6AE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_830:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_832
; Address: $C9E6BF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_832:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_833
; Address: $C9E6CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_833:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_836
; Address: $C9E6E0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_836:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_838
; Address: $C9E6F1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_838:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_839
; Address: $C9E6FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_839:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_83C
; Address: $C9E712
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_83C:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_83E
; Address: $C9E723
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_83E:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_83F
; Address: $C9E72F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_83F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_842
; Address: $C9E744
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_842:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_844
; Address: $C9E755
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_844:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_845
; Address: $C9E761
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_845:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_848
; Address: $C9E776
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_848:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_84A
; Address: $C9E787
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_84A:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_84B
; Address: $C9E793
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_84B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_84E
; Address: $C9E7A8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_84E:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_850
; Address: $C9E7B9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_850:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_851
; Address: $C9E7C5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_851:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_854
; Address: $C9E7DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_854:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_856
; Address: $C9E7EB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_856:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_857
; Address: $C9E7F7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_857:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_85B
; Address: $C9E813
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_85B:
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_85D
; Address: $C9E81D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_85D:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_85E
; Address: $C9E829
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_85E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_865
; Address: $C9E854
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_865:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_866
; Address: $C9E860
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_866:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_86E
; Address: $C9E892
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_86E:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_86F
; Address: $C9E89E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_86F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_877
; Address: $C9E8D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_877:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_878
; Address: $C9E8DC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_878:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_87C
; Address: $C9E8F8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_87C:
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_87E
; Address: $C9E902
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_87E:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_87F
; Address: $C9E90E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_87F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_882
; Address: $C9E923
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_882:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_884
; Address: $C9E934
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_884:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_885
; Address: $C9E940
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_885:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_888
; Address: $C9E955
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_888:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_88B
; Address: $C9E966
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_88B:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_88C
; Address: $C9E972
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_88C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_88F
; Address: $C9E987
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_88F:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_891
; Address: $C9E998
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_891:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_892
; Address: $C9E9A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_892:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_895
; Address: $C9E9B9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_895:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_897
; Address: $C9E9CA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_897:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_898
; Address: $C9E9D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_898:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_89A
; Address: $C9E9E4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_89A:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_89C
; Address: $C9E9F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_89C:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_89D
; Address: $C9EA01
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_89D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_89F
; Address: $C9EA0F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_89F:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8A1
; Address: $C9EA20
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8A1:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8A3
; Address: $C9EA2C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8A3:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8A5
; Address: $C9EA3A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8A5:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8A7
; Address: $C9EA4B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8A7:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8A8
; Address: $C9EA57
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8A8:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8AA
; Address: $C9EA65
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8AA:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8AC
; Address: $C9EA76
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8AC:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8AD
; Address: $C9EA82
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8AD:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8B4
; Address: $C9EAA6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8B4:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8B5
; Address: $C9EAB2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8B5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8B8
; Address: $C9EAC7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8B8:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F2			; AD F2 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8BB
; Address: $C9EADC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8BB:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8BC
; Address: $C9EAE8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8BC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8C1
; Address: $C9EB04
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8C1:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8C4
; Address: $C9EB19
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8C4:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8C5
; Address: $C9EB25
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8C5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8C9
; Address: $C9EB41
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8C9:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8CB
; Address: $C9EB52
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8CB:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8CC
; Address: $C9EB5E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8CC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8D1
; Address: $C9EB7A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8D1:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8D3
; Address: $C9EB8B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8D3:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8D4
; Address: $C9EB97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8D4:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8D6
; Address: $C9EBA5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8D6:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8D8
; Address: $C9EBB6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8D8:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8D9
; Address: $C9EBC2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8D9:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8DE
; Address: $C9EBE5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8DE:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F0			; AD F0 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8E9
; Address: $C9EC2C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8E9:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8EA
; Address: $C9EC38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8EA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8F0
; Address: $C9EC5B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8F0:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA $33F2			; AD F2 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8F3
; Address: $C9EC70
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8F3:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8F4
; Address: $C9EC7C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8F4:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8FB
; Address: $C9ECA7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8FB:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_8FC
; Address: $C9ECB3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_8FC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; AudioLongCallWrapper
; Address: $C9ECDE
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioLongCallWrapper:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioContextSetup
; Address: $C9ECEA
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioContextSetup:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; AudioLongCallWrapper2
; Address: $C9ED15
; Size: 12 bytes
;------------------------------------------------------------------------------
AudioLongCallWrapper2:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; AudioContextSetup2
; Address: $C9ED21
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioContextSetup2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; AudioDecimalModeCall
; Address: $C9ED28
; Size: 7 bytes
;------------------------------------------------------------------------------
AudioDecimalModeCall:
	JSL $C9E269		  ; 22 69 E2 C9 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_90E
; Address: $C9ED2F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_90E:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_90F
; Address: $C9ED36
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_90F:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_910
; Address: $C9ED3D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_910:
	JSL $C9E2CC		  ; 22 CC E2 C9 | Jump to subroutine long
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank12_DmaFunction_913
; Address: $C9ED4C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_913:
	JSL $C9E28D		  ; 22 8D E2 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank12_DmaFunction_914
; Address: $C9ED59
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_914:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $7D			  ; A6 7D | Load from zero page into X register
	LDY #$A5			 ; A0 A5 | Load immediate value into Y register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	LDA #$7D			 ; A9 7D | Load immediate value into accumulator
	LDY #$9F			 ; A0 9F | Load immediate value into Y register
	STA $99A4,Y		  ; 99 A4 99 | Store accumulator to absolute,Y
	STA				  ; 9F 9E 00 95 | Store accumulator to absolute long,X
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA $9B91,X		  ; 9D 91 9B | Store accumulator to absolute,X
	ADC $959D,X		  ; 7D 9D 95 | Add with carry (absolute,X)
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $7D			  ; A5 7D | Load from zero page into accumulator
	STA $0094,Y		  ; 99 94 00 | Store accumulator to absolute,Y
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $7D			  ; A5 7D | Load from zero page into accumulator
	LDY #$9D			 ; A0 9D | Load immediate value into Y register
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $7D			  ; A5 7D | Load from zero page into accumulator
	STA				  ; 9F 97 00 A3 | Store accumulator to absolute long,X
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $7D			  ; A5 7D | Load from zero page into accumulator
	LDY $A9			  ; A4 A9 | Load from zero page into Y register
	LDY #$95			 ; A0 95 | Load immediate value into Y register
	ADC $9994,X		  ; 7D 94 99 | Add with carry (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $7D			  ; A5 7D | Load from zero page into accumulator
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STA $A0A3,Y		  ; 99 A3 A0 | Store accumulator to absolute,Y
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank12_DmaFunction_915
; Address: $C9EDCB
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_915:
	LDA $7D			  ; A5 7D | Load from zero page into accumulator
	STA ($9C),Y		  ; 91 9C | Store accumulator to (zero page),Y
	STZ $A07D			; 9C 7D A0 | Store zero to absolute
	STA ($A2),Y		  ; 91 A2 | Store accumulator to (zero page),Y
	STA $947D,X		  ; 9D 7D 94 | Store accumulator to absolute,X
	STA $A0A3,Y		  ; 99 A3 A0 | Store accumulator to absolute,Y
	STA $91AA,Y		  ; 99 AA 91 | Store accumulator to absolute,Y
	ADC $9499,X		  ; 7D 99 94 | Add with carry (absolute,X)
	ADC $A295,X		  ; 7D 95 A2 | Add with carry (absolute,X)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX #$9F			 ; A2 9F | Load immediate value into X register
	ADC $959C,X		  ; 7D 9C 95 | Add with carry (absolute,X)
	LDX $95			  ; A6 95 | Load from zero page into X register
	STZ $957D			; 9C 7D 95 | Store zero to absolute
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	STA				  ; 9F A2 A9 7D | Store accumulator to absolute long,X
	STA ($9C),Y		  ; 91 9C | Store accumulator to (zero page),Y
	STZ $939F			; 9C 9F 93 | Store zero to absolute
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	STA				  ; 9F A2 A9 7D | Store accumulator to absolute long,X
	LDX #$95			 ; A2 95 | Load immediate value into X register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	STA				  ; 9F A2 A9 7D | Store accumulator to absolute long,X
	STA ($9C),Y		  ; 91 9C | Store accumulator to (zero page),Y
	STZ $939F			; 9C 9F 93 | Store zero to absolute
	ADC $A295,X		  ; 7D 95 A2 | Add with carry (absolute,X)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDX #$95			 ; A2 95 | Load immediate value into X register
	STA $A4A3,Y		  ; 99 A3 A4 | Store accumulator to absolute,Y
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$95			 ; A2 95 | Load immediate value into X register
	STA $A4A3,Y		  ; 99 A3 A4 | Store accumulator to absolute,Y
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$95			 ; A2 95 | Load immediate value into X register
	STA $A4A3,Y		  ; 99 A3 A4 | Store accumulator to absolute,Y
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STZ $9195			; 9C 95 91 | Store zero to absolute
	LDX #$9E			 ; A2 9E | Load immediate value into X register
	STA ($93),Y		  ; 91 93 | Store accumulator to (zero page),Y
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STA $7D9E,Y		  ; 99 9E 7D | Store accumulator to absolute,Y
	STA $0094,Y		  ; 99 94 00 | Store accumulator to absolute,Y
	ADC $91A0,X		  ; 7D A0 91 | Add with carry (absolute,X)
	LDX #$A4			 ; A2 A4 | Load immediate value into X register
	LDA #$7D			 ; A9 7D | Load immediate value into accumulator
	LDA $A5			  ; A5 A5 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; AudioDataTable6 - Complex audio processing parameters
; Address: $C9EE61
; Size: 115 bytes
;------------------------------------------------------------------------------
AudioDataTable6:
	db $A4, $7D, $9F, $94, $95, $00, $A2, $A2, $98, $7D, $A4, $91, $99, $A2, $95, $A4
	db $A5, $9D, $95, $9D, $A2, $7D, $A2, $A2, $98, $7D, $A0, $91, $A2, $A4, $A9, $00
	db $9D, $95, $9D, $A2, $7D, $A2, $A2, $A2, $A5, $A2, $91, $A4, $00, $A2, $A2, $7D
	db $A0, $9C, $91, $A9, $A2, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $A3, $95
	db $A8, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $A3, $95, $99, $9B, $91, $A5, $00
	db $9D, $95, $9D, $A2, $7D, $A2, $A2, $A4, $7D, $99, $9B, $91, $A5, $00, $9D, $95
	db $9D, $A2, $7D, $A2, $A2, $A4, $7D, $9E, $91, $9D, $7D, $A3, $A4, $A2, $99, $9E
	db $97, $00, $A8
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $95A3,X		  ; 7D A3 95 | Add with carry (absolute,X)
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STA $919B,Y		  ; 99 9B 91 | Store accumulator to absolute,Y
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STZ $9D91,X		  ; 9E 91 9D | Store zero to absolute,X
	ADC $A4A3,X		  ; 7D A3 A4 | Add with carry (absolute,X)
	LDX #$99			 ; A2 99 | Load immediate value into X register
	STZ $0097,X		  ; 9E 97 00 | Store zero to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_917
; Address: $C9EF0F
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_917:
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC $95A3,X		  ; 7D A3 95 | Add with carry (absolute,X)
	ADC $919E,X		  ; 7D 9E 91 | Add with carry (absolute,X)
	STA $0095,X		  ; 9D 95 00 | Store accumulator to absolute,X
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $959C,X		  ; 7D 9C 95 | Add with carry (absolute,X)
	LDX $95			  ; A6 95 | Load from zero page into X register
	STZ $9D00			; 9C 00 9D | Store zero to absolute
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	STZ $A695			; 9C 95 A6 | Store zero to absolute
	STZ $9600			; 9C 00 96 | Store zero to absolute
	STA				  ; 9F A2 9D 91 | Store accumulator to absolute long,X
	LDY $00			  ; A4 00 | Load from zero page into Y register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $919D,X		  ; 7D 9D 91 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $A098,X		  ; 7D 98 A0 | Add with carry (absolute,X)
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA ($94),Y		  ; 91 94 | Store accumulator to (zero page),Y
	ADC $919D,X		  ; 7D 9D 91 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $A098,X		  ; 7D 98 A0 | Add with carry (absolute,X)
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDA $92			  ; A5 92 | Load from zero page into accumulator
	ADC $919D,X		  ; 7D 9D 91 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $A098,X		  ; 7D 98 A0 | Add with carry (absolute,X)
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $A098,X		  ; 7D 98 A0 | Add with carry (absolute,X)
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA ($94),Y		  ; 91 94 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; AudioDataTable8 - Complex waveform and channel processing data
; Address: $C9EFB8
; Size: 119 bytes
;------------------------------------------------------------------------------
AudioDataTable8:
	db $7D, $98, $A0, $9D, $95, $9D, $A2, $7D, $A2, $A2, $A5, $92, $7D, $98, $A0, $9D
	db $95, $9D, $A2, $7D, $A2, $A2, $7D, $9D, $91, $A8, $7D, $9D, $A0, $9D, $95, $9D
	db $A2, $7D, $A2, $A2, $91, $94, $7D, $9D, $91, $A8, $7D, $9D, $A0, $9D, $95, $9D
	db $A2, $7D, $A2, $A2, $A5, $92, $7D, $9D, $91, $A8, $7D, $9D, $A0, $9D, $95, $9D
	db $A2, $7D, $A2, $A2, $7D, $9D, $A0, $9D, $95, $9D, $A2, $7D, $A2, $A2, $A4, $7D
	db $9D, $A0, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $91, $94, $7D, $9D, $A0, $9D
	db $95, $9D, $A2, $7D, $A2, $A2, $A5, $92, $7D, $9D, $A0, $9D, $95, $9D, $A2, $7D
	db $A2, $A2, $7D, $A0, $9F, $A2, $00

;------------------------------------------------------------------------------
; AudioDataTable9 - Additional waveform processing data
; Address: $C9F06D
; Size: 121 bytes
;------------------------------------------------------------------------------
AudioDataTable9:
	db $9D, $95, $9D, $A2, $7D, $A2, $A2, $91, $94, $7D, $A0, $9F, $A2, $00, $9D, $95
	db $9D, $A2, $7D, $A2, $A2, $A5, $92, $7D, $A0, $9F, $A2, $00, $9D, $95, $9D, $A2
	db $7D, $A2, $A2, $7D, $A3, $A4, $91, $9D, $99, $9E, $91, $9D, $95, $9D, $A2, $7D
	db $A2, $A2, $91, $94, $7D, $A3, $A4, $91, $9D, $99, $9E, $91, $9D, $95, $9D, $A2
	db $7D, $A2, $A2, $A5, $92, $7D, $A3, $A4, $91, $9D, $99, $9E, $91, $9D, $95, $9D
	db $A2, $7D, $A2, $A2, $7D, $A3, $A0, $9D, $95, $9D, $A2, $7D, $A2, $A2, $91, $94
	db $7D, $A3, $A0, $9D, $95, $9D, $A2, $7D, $A2, $A2, $A5, $92, $7D, $A3, $A0, $9D
	db $95, $9D, $A2, $7D, $A2, $A2, $7D, $99, $A1

;------------------------------------------------------------------------------
; AudioDataTable10 - Extended audio processing patterns
; Address: $C9F12D
; Size: 121 bytes
;------------------------------------------------------------------------------
AudioDataTable10:
	db $9D, $95, $9D, $A2, $7D, $A2, $A2, $91, $94, $7D, $99, $A1, $9D, $95, $9D, $A2
	db $7D, $A2, $A2, $A5, $92, $7D, $99, $A1, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D
	db $A3, $A0, $9D, $95, $9D, $A2, $7D, $A2, $A2, $91, $94, $7D, $A3, $A0, $9D, $95
	db $9D, $A2, $7D, $A2, $A2, $A5, $92, $7D, $A3, $A0, $9D, $95, $9D, $A2, $7D, $A2
	db $A2, $7D, $9F, $96, $9E, $A3, $99, $A6, $95, $9D, $95, $9D, $A2, $7D, $A2, $A2
	db $7D, $94, $95, $9E, $A3, $99, $A6, $95, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D
	db $95, $A8, $A0, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $91, $94, $7D, $95, $A8
	db $A0, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2

;------------------------------------------------------------------------------
; Bank12_DmaFunction_91B
; Address: $C9F1F6
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_91B:
	ADC $959C,X		  ; 7D 9C 95 | Add with carry (absolute,X)
	LDX $95			  ; A6 95 | Load from zero page into X register
	STZ $957D			; 9C 7D 95 | Store zero to absolute
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STZ $A895,X		  ; 9E 95 A8 | Store zero to absolute,X
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STZ $A695			; 9C 95 A6 | Store zero to absolute
	STZ $9D00			; 9C 00 9D | Store zero to absolute
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $9F93,X		  ; 7D 93 9F | Add with carry (absolute,X)
	STZ $9994,X		  ; 9E 94 99 | Store zero to absolute,X
	LDY $00			  ; A4 00 | Load from zero page into Y register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STA				  ; 9F 9E 94 99 | Store accumulator to absolute long,X
	LDY $99			  ; A4 99 | Load from zero page into Y register
	STA				  ; 9F 9E 00 9D | Store accumulator to absolute long,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STA ($94),Y		  ; 91 94 | Store accumulator to (zero page),Y
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STA				  ; 9F 9B A5 00 | Store accumulator to absolute long,X
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STA				  ; 9F 9B A5 00 | Store accumulator to absolute long,X
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STA $9891,X		  ; 9D 91 98 | Store accumulator to absolute,X
	STA $9D00,Y		  ; 99 00 9D | Store accumulator to absolute,Y
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_91C
; Address: $C9F2A6
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_91C:
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STA $9891,X		  ; 9D 91 98 | Store accumulator to absolute,X
	STA $9D00,Y		  ; 99 00 9D | Store accumulator to absolute,Y
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STZ $A29F,X		  ; 9E 9F A2 | Store zero to absolute,X
	STA				  ; 9F 99 00 9D | Store accumulator to absolute long,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $9F9A,X		  ; 7D 9A 9F | Add with carry (absolute,X)
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	STA				  ; 9F 92 00 9D | Store accumulator to absolute long,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $9893,X		  ; 7D 93 98 | Add with carry (absolute,X)
	ADC $9F9A,X		  ; 7D 9A 9F | Add with carry (absolute,X)
	ADC $999C,X		  ; 7D 9C 99 | Add with carry (absolute,X)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA ($94),Y		  ; 91 94 | Store accumulator to (zero page),Y
	ADC $91A4,X		  ; 7D A4 91 | Add with carry (absolute,X)
	STA $95A2,Y		  ; 99 A2 95 | Store accumulator to absolute,Y
	LDY $A5			  ; A4 A5 | Load from zero page into Y register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $9D7D			; 9C 7D 9D | Store zero to absolute
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $A37D,X		  ; 9D 7D A3 | Store accumulator to absolute,X
	LDA $A5			  ; A5 A5 | Load from zero page into accumulator
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $9FA3,X		  ; 7D A3 9F | Add with carry (absolute,X)
	LDA $92			  ; A5 92 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank12_DmaFunction_91D
; Address: $C9F35D
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_91D:
	STA $A37D,Y		  ; 99 7D A3 | Store accumulator to absolute,Y
	LDA $A5			  ; A5 A5 | Load from zero page into accumulator
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $9C7D,X		  ; 9D 7D 9C | Store accumulator to absolute,X
	STA $A4A3,Y		  ; 99 A3 A4 | Store accumulator to absolute,Y
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA ($94),Y		  ; 91 94 | Store accumulator to (zero page),Y
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STA ($94),Y		  ; 91 94 | Store accumulator to (zero page),Y
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $927D,X		  ; 9D 7D 92 | Store accumulator to absolute,X
	STA ($9E),Y		  ; 91 9E | Store accumulator to (zero page),Y
	STA $0095,X		  ; 9D 95 00 | Store accumulator to absolute,X
	STA $9D95,X		  ; 9D 95 9D | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $997D			; 9C 7D 99 | Store zero to absolute
	LDY $95			  ; A4 95 | Load from zero page into Y register
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $997D			; 9C 7D 99 | Store zero to absolute
	LDY $95			  ; A4 95 | Load from zero page into Y register
	STA $A000,X		  ; 9D 00 A0 | Store accumulator to absolute,X
	STA ($A2),Y		  ; 91 A2 | Store accumulator to (zero page),Y
	STA $957D,X		  ; 9D 7D 95 | Store accumulator to absolute,X
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $947D			; 9C 7D 94 | Store zero to absolute
	STA $A0A3,Y		  ; 99 A3 A0 | Store accumulator to absolute,Y
	STA				  ; 9F A3 7D 99 | Store accumulator to absolute long,X
	LDY $95			  ; A4 95 | Load from zero page into Y register
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank12_DmaFunction_91E
; Address: $C9F407
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank12_DmaFunction_91E:
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	ADC $9FA3,X		  ; 7D A3 9F | Add with carry (absolute,X)
	LDA $92			  ; A5 92 | Load from zero page into accumulator
	STA $997D,Y		  ; 99 7D 99 | Store accumulator to absolute,Y
	LDY $95			  ; A4 95 | Load from zero page into Y register
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $9FA3,X		  ; 7D A3 9F | Add with carry (absolute,X)
	LDA $92			  ; A5 92 | Load from zero page into accumulator
	STA $997D,Y		  ; 99 7D 99 | Store accumulator to absolute,Y
	LDY $95			  ; A4 95 | Load from zero page into Y register
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDY $7D			  ; A4 7D | Load from zero page into Y register
	STA				  ; 9F A5 92 99 | Store accumulator to absolute long,X
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STA				  ; 9F A5 92 99 | Store accumulator to absolute long,X
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $A000,X		  ; 9D 00 A0 | Store accumulator to absolute,X
	STA ($A2),Y		  ; 91 A2 | Store accumulator to (zero page),Y
	STA $957D,X		  ; 9D 7D 95 | Store accumulator to absolute,X
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	STZ $7DA3			; 9C A3 7D | Store zero to absolute
	STA				  ; 9F A5 92 99 | Store accumulator to absolute long,X
	ADC $A499,X		  ; 7D 99 A4 | Add with carry (absolute,X)
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $9C93,X		  ; 7D 93 9C | Add with carry (absolute,X)
	ADC $9FA3,X		  ; 7D A3 9F | Add with carry (absolute,X)
	LDA $92			  ; A5 92 | Load from zero page into accumulator
	STA $997D,Y		  ; 99 7D 99 | Store accumulator to absolute,Y
	LDY $95			  ; A4 95 | Load from zero page into Y register
	STA $9D00,X		  ; 9D 00 9D | Store accumulator to absolute,X
	STA $9592,X		  ; 9D 92 95 | Store accumulator to absolute,X
	LDX #$7D			 ; A2 7D | Load immediate value into X register
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDX #$98			 ; A2 98 | Load immediate value into X register

;------------------------------------------------------------------------------
; AudioDataTable3 - Sound waveform pattern data
; Address: $C9F4AB
; Size: 128 bytes
;------------------------------------------------------------------------------
AudioDataTable3:
	db $7D, $99, $A4, $9D, $00, $9D, $9D, $92, $95, $A2, $7D, $A2, $A2, $7D, $99, $A4
	db $9D, $7D, $9E, $91, $9D, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $99, $A4, $9D
	db $7D, $92, $A5, $A9, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $99, $A4, $9D, $7D
	db $A3, $9C, $9C, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $98, $7D, $99, $A4, $9D
	db $7D, $9A, $A9, $A5, $A9, $9F, $A5, $00, $9D, $9D, $92, $95, $A2, $7D, $A2, $A2
	db $98, $7D, $99, $A4, $9D, $7D, $94, $A9, $A5, $A9, $9F, $A3, $00, $9D, $9D, $92
	db $95, $A2, $7D, $A2, $A2, $7D, $99, $A4, $9D, $7D, $A3, $A2, $99, $9D, $95, $9D
	db $A2, $7D, $A2, $A2, $98, $7D, $99, $A4, $9D, $7D, $9E, $9F, $A2, $9F, $99

;------------------------------------------------------------------------------
; AudioDataTable4 - Channel and buffer management data
; Address: $C9F567
; Size: 124 bytes
;------------------------------------------------------------------------------
AudioDataTable4:
	db $9D, $95, $9D, $A2, $7D, $A2, $A2, $98, $7D, $99, $A4, $9D, $7D, $9A, $9F, $92
	db $7D, $A3, $9F, $A5, $92, $99, $9D, $95, $9D, $A2, $7D, $A2, $A2, $98, $7D, $99
	db $A4, $9D, $7D, $9F, $9E, $9C, $A9, $7D, $97, $99, $A2, $9C, $9D, $95, $9D, $A2
	db $7D, $A2, $A2, $98, $7D, $99, $A4, $9D, $7D, $91, $A4, $99, $9D, $95, $9D, $A2
	db $7D, $A2, $A2, $98, $7D, $99, $A4, $9D, $7D, $A3, $99, $9B, $91, $A5, $00, $9D
	db $95, $9D, $A2, $7D, $A2, $A2, $91, $97, $98, $A5, $9D, $A2, $A2, $9F, $A2, $00
	db $92, $91, $97, $9C, $00, $99, $A4, $95, $9D, $00, $9E, $9F, $A4, $00, $96, $9F
	db $A5, $9E, $94, $91, $97, $98, $99, $A4, $95, $9D, $00, $9E

;------------------------------------------------------------------------------
; AudioDataTable5 - Advanced sound processing parameters
; Address: $C9F61D
; Size: 134 bytes
;------------------------------------------------------------------------------
AudioDataTable5:
	db $9F, $A4, $00, $96, $9F, $A5, $9E, $94, $7D, $96, $99, $9C, $94, $7D, $9D, $91
	db $97, $99, $93, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $96, $99, $98, $A4
	db $7D, $9D, $91, $97, $99, $93, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $9A
	db $9F, $7D, $96, $99, $9C, $94, $7D, $9D, $91, $97, $99, $93, $00, $9D, $95, $9D
	db $A2, $7D, $A2, $A2, $7D, $9A, $9F, $7D, $96, $99, $98, $A4, $7D, $9D, $91, $97
	db $99, $93, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $A4, $7D, $9D, $91, $97, $99
	db $93, $00, $9D, $95, $9D, $A2, $7D, $A2, $A2, $7D, $96, $99, $9C, $94, $7D, $99
	db $9E, $7D, $A0, $9F, $A4, $7D, $99, $95, $9C, $A7, $99, $7D, $A0, $9F, $A3, $00
	db $A3, $7D, $96, $99

;------------------------------------------------------------------------------
; Audio Data Table 1 - Sound/music parameter data
; Address: $C9F6DA
; Size: 127 bytes
;------------------------------------------------------------------------------
AudioDataTable1:
	db $98, $A4, $7D, $99, $9E, $7D, $A0, $9F	; Waveform parameters
	db $A4, $7D, $99, $97, $98, $A4, $7D, $99	; Channel configuration
	db $9E, $7D, $A0, $9F, $9D, $9F, $94, $99	; Audio buffer settings
	db $96, $A9, $91, $9C, $9C, $9F, $93, $A2	; Sample rate data
	db $A2, $91, $9E, $9D, $A0, $91, $9C, $95	; Volume control
	db $A4, $A4, $95, $91, $9C, $9C, $9F, $93	; Effect parameters
	db $A2, $A2, $9F, $A2, $00, $A3, $99, $94	; Hardware registers
	db $00, $9F, $A0, $95, $A2, $91, $A4, $99	; DMA settings
	db $9F, $9E, $A2, $A2, $9F, $A2, $00, $9C	; Audio processing
	db $9F, $91, $94, $7D, $9F, $A5, $9B, $95	; Sound synthesis
	db $9E, $00, $A0, $91, $A2, $9D, $00, $95	; Channel routing
	db $A2, $A2, $91, $A6, $7D, $92, $9F, $A5	; Buffer management
	db $9B, $9E, $00, $A0, $91, $A2, $9D, $00	; Audio pipeline
	db $95, $A2, $A2, $91, $A6, $7D, $A3, $99	; Processing chain
	db $AA, $7D, $9F, $A6, $A2, $00, $91, $A6	; Effect routing
	db $A9, $A3, $A4, $95, $9D, $00, $95		 ; Final parameters

;------------------------------------------------------------------------------
; Audio Data Table 2 - Extended audio configuration data
; Address: $C9F77A
; Size: 126 bytes
;------------------------------------------------------------------------------
AudioDataTable2:
	db $A2, $A2, $A4, $91, $A4, $A5, $A0, $9C	; Channel parameters
	db $91, $A3, $A4, $95, $9C, $95, $A0, $98	; Audio routing
	db $9F, $9E, $95, $00, $91, $9C, $9C, $00	; Buffer configuration
	db $A4, $9F, $00, $98, $95, $91, $A2, $A4	; Sample settings
	db $00, $91, $A4, $9D, $9F, $94, $99, $94	; Volume levels
	db $00, $9F, $A6, $95, $A2, $A2, $A2, $9F	; Effect chains
	db $A2, $00, $98, $9D, $91, $00, $91, $9C	; Processing modes
	db $9C, $9F, $93, $A5, $9C, $9C, $00, $95	; Hardware setup
	db $A2, $A2, $9F, $A2, $00, $9E, $9F, $00	; Register config
	db $A3, $93, $A2, $9F, $9C, $9C, $00, $A0	; DMA channels
	db $A2, $9F, $97, $A2, $91, $9D, $00, $A3	; Audio streams
	db $99, $AA, $95, $98, $9F, $9E, $A4, $00	; Buffer pools
	db $A5, $96, $91, $9E, $9E, $9F, $A4, $91	; Memory layout
	db $9C, $9C, $9F, $93, $9E, $9F, $00, $9F	; Control data
	db $A5, $9E, $94, $9E, $9F, $A2, $9D, $91	; Audio engine
	db $9C, $99, $9E, $94, $A2, $00			  ; Final settings
