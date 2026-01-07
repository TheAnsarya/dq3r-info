;==============================================================================
; Dragon Quest III - Bank $02
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $C10000-$C17FFF
; Instructions: 11612
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_02"

;------------------------------------------------------------------------------
; DmaDataProcessor - Process DMA data with XOR and status flags
; Address: $C18000
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaDataProcessor:
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DMA data block (not executable code)
; Address: $C1800F
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaDataBlock_001:
	db $22, $72, $05, $C9   ; Data bytes
	db $42, $C5			 ; Data bytes (WDM indicates data)
	db $01, $00			 ; Data bytes
	db $8D, $B8, $E0		; Data bytes

;------------------------------------------------------------------------------
; DMA data block (not executable code)
; Address: $C18021
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaDataBlock_002:
	db $22, $72, $05, $C9   ; Data bytes
	db $42, $C5			 ; Data bytes (WDM indicates data)
	db $AA				  ; Data byte

;------------------------------------------------------------------------------
; DmaChannelController - Control DMA channel operations with branch logic
; Address: $C18031
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaChannelController:
	JSL $C067FD		  ; 22 FD 67 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $2E			  ; 90 2E | Branch if carry clear

;------------------------------------------------------------------------------
; DmaMemoryInitializer - Initialize DMA memory locations and zero page
; Address: $C18038
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaMemoryInitializer:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaParameterSetup
; Address: $C18046
; Size: 16 bytes
; Sets up DMA transfer parameters with zero page storage
;------------------------------------------------------------------------------
DmaParameterSetup:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; DmaStackManager - Handle stack pull operations for DMA completion
; Address: $C1805A
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaStackManager:
	JSR $847A			; 20 7A 84 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaCompletionHandler - Complete DMA operation with stack restoration
; Address: $C18069
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaCompletionHandler:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaSetupHandler - Setup registers and bank for DMA operations
; Address: $C18077
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaSetupHandler:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DmaDataBlock_003 - Data block with WDM instruction and work RAM reference
; Address: $C18083
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaDataBlock_003:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $8D, $B2, $E0		 ; STA work RAM reference data

;------------------------------------------------------------------------------
; DmaDataBlock_004 - Extended data block with work RAM operations
; Address: $C18095
; Size: 30 bytes
;------------------------------------------------------------------------------
DmaDataBlock_004:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $01, $00			  ; ORA zero page,X data
	db $8D, $B4, $E0		 ; STA work RAM $E0B4 data
	db $0D, $B2, $E0		 ; ORA work RAM $E0B2 data
	db $D0, $03			  ; BNE branch data
	db $4C, $66, $81		 ; JMP address data
	db $E2, $20			  ; SEP processor flags data
	db $AD, $B2, $E0		 ; LDA work RAM $E0B2 data
	db $EB				   ; XBA exchange bytes data
	db $AD, $B4, $E0		 ; LDA work RAM $E0B4 data

;------------------------------------------------------------------------------
; DmaWorkRamProcessor - Process DMA work RAM with address storage
; Address: $C180B8
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaWorkRamProcessor:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0B6			; 8D B6 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; DmaConditionalJump - Conditional DMA operation with carry check
; Address: $C180C2
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaConditionalJump:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8166			; 4C 66 81 | Jump to address

;------------------------------------------------------------------------------
; DmaDataBlock_005 - Data block with WDM and absolute memory operations
; Address: $C180CB
; Size: 15 bytes
;------------------------------------------------------------------------------
DmaDataBlock_005:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $0A				   ; ASL data
	db $6D, $46, $FC		 ; ADC absolute address data
	db $8D, $46, $FC		 ; STA absolute address data

;------------------------------------------------------------------------------
; DmaDataBlock_006 - Data block similar to 005 with different absolute address
; Address: $C180E1
; Size: 15 bytes
;------------------------------------------------------------------------------
DmaDataBlock_006:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $0A				   ; ASL data
	db $6D, $48, $FC		 ; ADC absolute address data ($FC48)
	db $8D, $48, $FC		 ; STA absolute address data ($FC48)

;------------------------------------------------------------------------------
; DmaDataBlock_007 - Data block with register operations
; Address: $C180F7
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaDataBlock_007:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $DA				   ; PHX data
	db $AA				   ; TAX data

;------------------------------------------------------------------------------
; DmaWorkRamZeroStore - Store zero and access work RAM for DMA
; Address: $C1810F
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaWorkRamZeroStore:
	STZ $C542			; 9C 42 C5 | Store zero to absolute
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B8			; 8D B8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaZeroAndTransfer - Initialize zero and transfer accumulator to X
; Address: $C1811A
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaZeroAndTransfer:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STZ $C542			; 9C 42 C5 | Store zero to absolute
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DmaGraphicsCall - Call graphics-related DMA subroutine
; Address: $C1812A
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaGraphicsCall:
	JSL $C0689E		  ; 22 9E 68 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $2E			  ; 90 2E | Branch if carry clear

;------------------------------------------------------------------------------
; DmaDataBlock_008 - Data block with zero page operations
; Address: $C18131
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaDataBlock_008:
	db $22, $EE, $03, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $06, $00			  ; ASL zero page data
	db $85, $00			  ; STA zero page data

;------------------------------------------------------------------------------
; DmaDataBlock_009 - Extended data block with zero page and immediate operations
; Address: $C1813F
; Size: 15 bytes
;------------------------------------------------------------------------------
DmaDataBlock_009:
	db $22, $EE, $03, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $08				   ; PHP data
	db $29, $FF			  ; AND immediate data
	db $85, $02			  ; STA zero page data
	db $A9, $10			  ; LDA immediate data

;------------------------------------------------------------------------------
; DmaStackRestoreSecure - Restore stack state with secure flag setting
; Address: $C18153
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaStackRestoreSecure:
	JSR $847A			; 20 7A 84 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaStackRestoreClear - Restore stack state with clear flag setting
; Address: $C18162
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaStackRestoreClear:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaInterruptSetup - Setup interrupt-disabled DMA operations
; Address: $C1816F
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaInterruptSetup:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; DmaArrayBranchController - Control DMA operations based on array values
; Address: $C1817C
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaArrayBranchController:
	LDA $E3E2,Y		  ; B9 E2 E3 | Load from absolute,Y into accumulator
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Load from absolute,Y into accumulator
	BPL $03			  ; 10 03 | Branch if positive
	JMP $8244			; 4C 44 82 | Jump to address

;------------------------------------------------------------------------------
; DmaWorkRamBranchAccess - Access work RAM with conditional branching
; Address: $C1818C
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaWorkRamBranchAccess:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	STA $E0C4			; 8D C4 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaExtendedWorkRamHandler - Handle extended work RAM operations with byte swapping
; Address: $C1819E
; Size: 22 bytes
;------------------------------------------------------------------------------
DmaExtendedWorkRamHandler:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0C8			; 8D C8 E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0C4			; AD C4 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0C8			; AD C8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaDirectWorkRamStore - Direct work RAM storage operations
; Address: $C181B9
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaDirectWorkRamStore:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0B6			; 8D B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaBranchZeroPageProcessor - Process zero page with conditional branching
; Address: $C181C2
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaBranchZeroPageProcessor:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaBranchStackProcessor - Process stack operations with conditional branching
; Address: $C181D0
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaBranchStackProcessor:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaBranchZeroPageStore - Store accumulator to zero page with branching
; Address: $C181E1
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaBranchZeroPageStore:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	STA $0C			  ; 85 0C | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaBranchRegisterTransfer - Transfer accumulator to X with branching
; Address: $C181F2
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaBranchRegisterTransfer:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DmaZeroStoreWorkRam - Store zero to absolute and access work RAM
; Address: $C18203
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaZeroStoreWorkRam:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STZ $C510			; 9C 10 C5 | Store zero to absolute
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B8			; 8D B8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaZeroStoreTransfer - Store zero to absolute and transfer to X
; Address: $C18215
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaZeroStoreTransfer:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STZ $C510			; 9C 10 C5 | Store zero to absolute
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DmaWorkRamLoader - Load work RAM values into zero page
; Address: $C1822C
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaWorkRamLoader:
	JSR $8438			; 20 38 84 | Jump to subroutine
	LDA $E0B8			; AD B8 E0 | Game work RAM access
	STA $2E			  ; 85 2E | Store accumulator to zero page
	LDA $E0B6			; AD B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaAdvancedStackRestoreSecure - Advanced stack restoration with secure carry
; Address: $C18237
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaAdvancedStackRestoreSecure:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaStackRestoreClear - Standard stack restoration with clear carry
; Address: $C18244
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStackRestoreClear:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaCompleteSetupSequence - Complete DMA setup sequence with full register preservation
; Address: $C1824D
; Size: 26 bytes
;------------------------------------------------------------------------------
DmaCompleteSetupSequence:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Load from absolute,Y into accumulator
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Load from absolute,Y into accumulator
	BPL $03			  ; 10 03 | Branch if positive
	JMP $8322			; 4C 22 83 | Jump to address

;------------------------------------------------------------------------------
; DmaWorkRamControllerC4 - Control work RAM operations for channel C4
; Address: $C1826A
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaWorkRamControllerC4:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	STA $E0C4			; 8D C4 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaWorkRamControllerC8 - Control work RAM operations for channel C8
; Address: $C1827C
; Size: 14 bytes
;------------------------------------------------------------------------------
DmaWorkRamControllerC8:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0C8			; 8D C8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaByteSwapProcessor - Process byte swapping between work RAM channels
; Address: $C1828E
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaByteSwapProcessor:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0C4			; AD C4 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0C8			; AD C8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaWorkRamDirectAccess - Direct work RAM access with 16-bit mode
; Address: $C18297
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaWorkRamDirectAccess:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0B6			; 8D B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaZeroPageShiftProcessor - Process zero page with bit shifting operations
; Address: $C182A0
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaZeroPageShiftProcessor:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaZeroPageMaskProcessor - Process zero page with masking and stack operations
; Address: $C182AE
; Size: 14 bytes
;------------------------------------------------------------------------------
DmaZeroPageMaskProcessor:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaZeroPageDirectStore - Direct store to zero page with decimal clear
; Address: $C182BF
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaZeroPageDirectStore:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	STA $0C			  ; 85 0C | Store accumulator to zero page

;------------------------------------------------------------------------------
; DmaRegisterStackTransfer - Transfer and push registers for DMA
; Address: $C182D0
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaRegisterStackTransfer:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DmaDataBlock_010 - Data block with WDM and work RAM access
; Address: $C182E1
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaDataBlock_010:
	db $22, $72, $05, $C9	; JSL call data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $01, $00			  ; ORA zero page,X data
	db $8D, $B8, $E0		 ; STA work RAM $E0B8 data

;------------------------------------------------------------------------------
; DmaDataBlock_011 - Simple data block with WDM and register transfer
; Address: $C182F3
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaDataBlock_011:
	db $22, $72, $05, $C9	; JSL call data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $AA				   ; TAX data

;------------------------------------------------------------------------------
; DmaGraphicsCallBranch - Call graphics system with conditional branching
; Address: $C18303
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaGraphicsCallBranch:
	JSL $C067FD		  ; 22 FD 67 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $18			  ; 90 18 | Branch if carry clear

;------------------------------------------------------------------------------
; DmaWorkRamDualLoader - Load dual work RAM channels into zero page
; Address: $C1830A
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaWorkRamDualLoader:
	JSR $8438			; 20 38 84 | Jump to subroutine
	LDA $E0B8			; AD B8 E0 | Game work RAM access
	STA $2E			  ; 85 2E | Store accumulator to zero page
	LDA $E0B6			; AD B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaAdvancedStackRestore - Advanced stack restoration for complex DMA
; Address: $C18315
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaAdvancedStackRestore:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; DmaFinalStackReturn - Final stack restoration and secure return
; Address: $C1831E
; Size: 4 bytes
;------------------------------------------------------------------------------
DmaFinalStackReturn:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaFinalStackClear - Final stack restoration and clear return
; Address: $C18322
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaFinalStackClear:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaComplexSetupSequence - Complex DMA setup with full state preservation
; Address: $C1832B
; Size: 26 bytes
;------------------------------------------------------------------------------
DmaComplexSetupSequence:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Load from absolute,Y into accumulator
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Load from absolute,Y into accumulator
	BPL $03			  ; 10 03 | Branch if positive
	JMP $8400			; 4C 00 84 | Jump to address

;------------------------------------------------------------------------------
; DmaDataBlock_012 - Data block with WDM and work RAM C4 access
; Address: $C18348
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaDataBlock_012:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $8D, $C4, $E0		 ; STA work RAM $E0C4 data

;------------------------------------------------------------------------------
; DmaDataBlock_013 - Extended data block with dual work RAM and byte swap
; Address: $C1835A
; Size: 22 bytes
;------------------------------------------------------------------------------
DmaDataBlock_013:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $01, $00			  ; ORA zero page,X data
	db $8D, $C8, $E0		 ; STA work RAM $E0C8 data
	db $E2, $20			  ; SEP processor flags data
	db $AD, $C4, $E0		 ; LDA work RAM $E0C4 data
	db $EB				   ; XBA exchange bytes data
	db $AD, $C8, $E0		 ; LDA work RAM $E0C8 data

;------------------------------------------------------------------------------
; DmaWorkRamProcessorB6 - Process work RAM channel B6 operations
; Address: $C18375
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaWorkRamProcessorB6:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0B6			; 8D B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaDataBlock_014 - Data block with WDM and zero page shift operations
; Address: $C1837E
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaDataBlock_014:
	db $22, $EE, $03, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $06, $00			  ; ASL zero page data
	db $85, $00			  ; STA zero page data

;------------------------------------------------------------------------------
; DmaDataBlock_015 - Data block with WDM and stack/mask operations
; Address: $C18391
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaDataBlock_015:
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $08				   ; PHP data
	db $29, $FF			  ; AND immediate data
	db $85, $02			  ; STA zero page data

;------------------------------------------------------------------------------
; DmaDataBlock_016 - Data block with WDM and zero page store
; Address: $C1839D
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaDataBlock_016:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $85, $0C			  ; STA zero page data

;------------------------------------------------------------------------------
; DmaDataBlock_017 - Data block with WDM and register operations
; Address: $C183AE
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaDataBlock_017:
	db $22, $72, $05, $C9	; JSL call data
	db $09, $00			  ; ORA immediate data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $DA				   ; PHX data
	db $AA				   ; TAX data

;------------------------------------------------------------------------------
; DmaZeroStoreWorkRamB8 - Store zero to absolute and access work RAM B8
; Address: $C183BF
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaZeroStoreWorkRamB8:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STZ $C542			; 9C 42 C5 | Store zero to absolute
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B8			; 8D B8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaZeroStoreRegTransfer - Store zero to absolute and transfer to X
; Address: $C183D1
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaZeroStoreRegTransfer:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STZ $C542			; 9C 42 C5 | Store zero to absolute
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; DmaGraphicsCallConditional - Conditional graphics DMA call with stack pull
; Address: $C183E1
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaGraphicsCallConditional:
	JSL $C0689E		  ; 22 9E 68 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $18			  ; 90 18 | Branch if carry clear

;------------------------------------------------------------------------------
; DmaWorkRamDualLoaderB8B6 - Load dual work RAM channels B8/B6 into zero page
; Address: $C183E8
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaWorkRamDualLoaderB8B6:
	JSR $8438			; 20 38 84 | Jump to subroutine
	LDA $E0B8			; AD B8 E0 | Game work RAM access
	STA $2E			  ; 85 2E | Store accumulator to zero page
	LDA $E0B6			; AD B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaSecondaryAdvancedStackRestore - Secondary advanced stack restoration
; Address: $C183F3
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaSecondaryAdvancedStackRestore:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaSecondaryStackClear - Secondary stack restoration with clear return
; Address: $C18400
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaSecondaryStackClear:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaArrayMaskProcessor - Process array data with masking and long addressing
; Address: $C18409
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaArrayMaskProcessor:
	LDA $E432,Y		  ; B9 32 E4 | Load from absolute,Y into accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7E9686		  ; AF 86 96 7E | Load from absolute long address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; DmaComplexArrayProcessor - Complex array processing with multiple shifts and long addressing
; Address: $C18415
; Size: 30 bytes
;------------------------------------------------------------------------------
DmaComplexArrayProcessor:
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	CPX #$68			 ; E0 68 | Compare X register (immediate)
	LDA $E452,Y		  ; B9 52 E4 | Load from absolute,Y into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7E9688		  ; AF 88 96 7E | Load from absolute long address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX $68E0,Y		  ; BE E0 68 | Load from absolute,Y into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaMemoryLayoutProcessor - Process DMA memory layout with work RAM initialization
; Address: $C18438
; Size: 42 bytes
;------------------------------------------------------------------------------
DmaMemoryLayoutProcessor:
	STZ $04			  ; 64 04 | Store zero to zero page
	LDA $E0C4			; AD C4 E0 | Game work RAM access
	STA $06			  ; 85 06 | Store accumulator to zero page
	STZ $08			  ; 64 08 | Store zero to zero page
	LDA $E0C8			; AD C8 E0 | Game work RAM access
	STA $0A			  ; 85 0A | Store accumulator to zero page
	LDA $E442,Y		  ; B9 42 E4 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDX #$18			 ; A2 18 | Load immediate value into X register
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $E0BE			; AD BE E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; DmaCoordinateCalculator - Calculate DMA coordinates with work RAM access
; Address: $C18463
; Size: 18 bytes
;------------------------------------------------------------------------------
DmaCoordinateCalculator:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $E0BA			; AD BA E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)

;------------------------------------------------------------------------------
; DmaIndexAddCalculator - Add array index and transfer to X register
; Address: $C18475
; Size: 5 bytes
;------------------------------------------------------------------------------
DmaIndexAddCalculator:
	ADC $E412,Y		  ; 79 12 E4 | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaArrayIndexLoader - Load array index and work RAM data
; Address: $C18480
; Size: 10 bytes
;------------------------------------------------------------------------------
DmaArrayIndexLoader:
	JSR $84A4			; 20 A4 84 | Jump to subroutine
	LDA $E412,Y		  ; B9 12 E4 | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E0B6			; AD B6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; DmaTransferLoop - Loop for DMA transfers with work RAM operations
; Address: $C1848A
; Size: 26 bytes
;------------------------------------------------------------------------------
DmaTransferLoop:
	JSL $C04923		  ; 22 23 49 C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $E0B8			; AD B8 E0 | Game work RAM access
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $0000,X		  ; 9D 00 00 | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F2			  ; D0 F2 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaArrayStoreProcessor - Store data to arrays with memory management
; Address: $C184A4
; Size: 72 bytes
;------------------------------------------------------------------------------
DmaArrayStoreProcessor:
	STA $E3F2,Y		  ; 99 F2 E3 | Store accumulator to absolute,Y
	LDA $FC4C			; AD 4C FC | Load from absolute address into accumulator
	STA $E472,Y		  ; 99 72 E4 | Store accumulator to absolute,Y
	LDA $FC4A			; AD 4A FC | Load from absolute address into accumulator
	STA $E4B2,Y		  ; 99 B2 E4 | Store accumulator to absolute,Y
	LDX $AE9A			; AE 9A AE | Load from absolute address into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $E4A2,Y		  ; 99 A2 E4 | Store accumulator to absolute,Y
	LDA $ADF4,X		  ; BD F4 AD | Load from absolute,X into accumulator
	STA $E412,Y		  ; 99 12 E4 | Store accumulator to absolute,Y
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	STA $E422,Y		  ; 99 22 E4 | Store accumulator to absolute,Y
	LDA $B750			; AD 50 B7 | Load from absolute address into accumulator
	STA $E482,Y		  ; 99 82 E4 | Store accumulator to absolute,Y
	LDA $AEA2			; AD A2 AE | Load from absolute address into accumulator
	STA $E492,Y		  ; 99 92 E4 | Store accumulator to absolute,Y
	LDA $B754			; AD 54 B7 | Load from absolute address into accumulator
	STA $E4C2,Y		  ; 99 C2 E4 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $99			  ; 80 99 | Branch always
	SEP #$E3			 ; E2 E3 | Set processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $E552			; 8D 52 E5 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $E4D2,Y		  ; 99 D2 E4 | Store accumulator to absolute,Y
	STA $E4E2,Y		  ; 99 E2 E4 | Store accumulator to absolute,Y
	STA $E4F2,Y		  ; 99 F2 E4 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; DmaEntityArrayInitializer - Initialize entity arrays with default values
; Address: $C184EE
; Size: 61 bytes
;------------------------------------------------------------------------------
DmaEntityArrayInitializer:
	STA $E502,Y		  ; 99 02 E5 | Store accumulator to absolute,Y
	STA $E512,Y		  ; 99 12 E5 | Store accumulator to absolute,Y
	STA $E522,Y		  ; 99 22 E5 | Store accumulator to absolute,Y
	STA $E532,Y		  ; 99 32 E5 | Store accumulator to absolute,Y
	STA $E542,Y		  ; 99 42 E5 | Store accumulator to absolute,Y
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $E402,Y		  ; 99 02 E4 | Store accumulator to absolute,Y
	LDA $E0B2			; AD B2 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC46			; AD 46 FC | Load from absolute address into accumulator
	STA $E432,Y		  ; 99 32 E4 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	STA $E442,Y		  ; 99 42 E4 | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	LDA $E0B4			; AD B4 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC48			; AD 48 FC | Load from absolute address into accumulator
	STA $E452,Y		  ; 99 52 E4 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	STA $E462,Y		  ; 99 62 E4 | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaBankSwitchSetup - Setup bank switching for DMA operations
; Address: $C1852E
; Size: 19 bytes
;------------------------------------------------------------------------------
DmaBankSwitchSetup:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDX #$01			 ; A2 01 | Load immediate value into X register
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; DmaStateCheck0 - Check DMA state with Y register comparison (state 0)
; Address: $C18543
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck0:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $7F8C			; 8D 8C 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck1 - Check DMA state with Y register comparison (state 1)
; Address: $C18552
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck1:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $7F8A			; 8D 8A 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck3 - Check DMA state with Y register comparison (state 3)
; Address: $C18570
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck3:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	STA $7F92			; 8D 92 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck4 - Check DMA state with Y register comparison (state 4)
; Address: $C1857F
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck4:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	STA $7F94			; 8D 94 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck5 - Check DMA state with Y register comparison (state 5)
; Address: $C1858E
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck5:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	STA $7F96			; 8D 96 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck6 - Check DMA state with Y register comparison (state 6)
; Address: $C1859D
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck6:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	STA $7F98			; 8D 98 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck7 - Check DMA state with Y register comparison (state 7)
; Address: $C185AC
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck7:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	STA $7F9A			; 8D 9A 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck8 - Check DMA state with Y register comparison (state 8)
; Address: $C185BB
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck8:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	STA $7FC2			; 8D C2 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck9 - Check DMA state with Y register comparison (state 9)
; Address: $C185CA
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck9:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	STA $7FC3			; 8D C3 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck10 - Check DMA state with Y register comparison (state 10)
; Address: $C185D9
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck10:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	STA $7FBA			; 8D BA 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck11 - Check DMA state with Y register comparison (state 11)
; Address: $C185E8
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck11:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0B			 ; C0 0B | Compare Y register (immediate)
	STA $7FBC			; 8D BC 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck12 - Check DMA state with Y register comparison (state 12)
; Address: $C185F7
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck12:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck13 - Check DMA state with Y register comparison (state 13)
; Address: $C18606
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck13:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0D			 ; C0 0D | Compare Y register (immediate)
	STA $7FC8			; 8D C8 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck14 - Check DMA state with Y register comparison (state 14)
; Address: $C18615
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck14:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	STA $7FCC			; 8D CC 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck15 - Check DMA state with Y register comparison (state 15)
; Address: $C18624
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck15:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	STA $7FCA			; 8D CA 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck16 - Check DMA state with Y register comparison (state 16)
; Address: $C18633
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck16:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	STA $7FCE			; 8D CE 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck17 - Check DMA state with Y register comparison (state 17)
; Address: $C18642
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck17:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$11			 ; C0 11 | Compare Y register (immediate)
	STA $7FD0			; 8D D0 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck18 - Check DMA state with Y register comparison (state 18)
; Address: $C18651
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaStateCheck18:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	STA $7FD2			; 8D D2 7F | Store accumulator to absolute address
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; DmaStateCheck21 - Check DMA state with Y register comparison (state 21)
; Address: $C18665
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck21:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$15			 ; C0 15 | Compare Y register (immediate)
	STA $99F1			; 8D F1 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck23 - Check DMA state with Y register comparison (state 23)
; Address: $C18674
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck23:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$17			 ; C0 17 | Compare Y register (immediate)
	STA $99ED			; 8D ED 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck25 - Check DMA state with Y register comparison (state 25)
; Address: $C18683
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck25:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$19			 ; C0 19 | Compare Y register (immediate)
	STA $99F3			; 8D F3 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck27 - Check DMA state with Y register comparison (state 27)
; Address: $C18692
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck27:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	STA $99EF			; 8D EF 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck29 - Check DMA state with Y register comparison (state 29)
; Address: $C186A1
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck29:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	STA $99F5			; 8D F5 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck31 - Check DMA state with Y register comparison (state 31)
; Address: $C186B0
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck31:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	STA $B471			; 8D 71 B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck35 - Check DMA state with Y register comparison (state 35)
; Address: $C186BF
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck35:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	STA $B475			; 8D 75 B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck19 - Check DMA state with Y register comparison (state 19)
; Address: $C186CE
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStateCheck19:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$13			 ; C0 13 | Compare Y register (immediate)
	STA $7FD4			; 8D D4 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck37WithMask - Check DMA state 37 with mask operation
; Address: $C186DD
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaStateCheck37WithMask:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$25			 ; C0 25 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B479			; 8D 79 B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck38WithMask - Check DMA state 38 with mask operation
; Address: $C186EF
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaStateCheck38WithMask:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$26			 ; C0 26 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B47B			; 8D 7B B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck39WithMask - Check DMA state 39 with mask operation
; Address: $C18701
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaStateCheck39WithMask:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$27			 ; C0 27 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B47D			; 8D 7D B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck40Dual - Check DMA state 40 with dual storage
; Address: $C18713
; Size: 14 bytes
;------------------------------------------------------------------------------
DmaStateCheck40Dual:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B47F			; 8D 7F B4 | Store accumulator to absolute address
	STA $B483			; 8D 83 B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaStateCheck41WithMask - Check DMA state 41 with mask operation
; Address: $C18728
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaStateCheck41WithMask:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$29			 ; C0 29 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B481			; 8D 81 B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; DmaInitializeController - Initialize DMA controller with zero resets
; Address: $C1873A
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaInitializeController:
	JSR $87DC			; 20 DC 87 | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STZ $7FC0			; 9C C0 7F | Store zero to absolute
	STZ $7F8E			; 9C 8E 7F | Store zero to absolute

;------------------------------------------------------------------------------
; DmaPaletteProcessor - Process DMA palette data with bit manipulation
; Address: $C18746
; Size: 97 bytes
;------------------------------------------------------------------------------
DmaPaletteProcessor:
	STZ $7FC4			; 9C C4 7F | Store zero to absolute
	STZ $7FC6			; 9C C6 7F | Store zero to absolute
	LDA $7F8A			; AD 8A 7F | Load from absolute address into accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $99E3			; 8D E3 99 | Store accumulator to absolute address
	LDA $7F98			; AD 98 7F | Load from absolute address into accumulator
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $99DB			; 8D DB 99 | Store accumulator to absolute address
	LDA $7F98			; AD 98 7F | Load from absolute address into accumulator
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $99DD			; 8D DD 99 | Store accumulator to absolute address
	LDA $7F9A			; AD 9A 7F | Load from absolute address into accumulator
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $99DF			; 8D DF 99 | Store accumulator to absolute address
	LDA $7F9A			; AD 9A 7F | Load from absolute address into accumulator
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $99E1			; 8D E1 99 | Store accumulator to absolute address
	LDA $7F90			; AD 90 7F | Load from absolute address into accumulator
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $99E5			; 8D E5 99 | Store accumulator to absolute address
	LDA $7F92			; AD 92 7F | Load from absolute address into accumulator
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $99E7			; 8D E7 99 | Store accumulator to absolute address
	LDA $7F94			; AD 94 7F | Load from absolute address into accumulator
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $99E9			; 8D E9 99 | Store accumulator to absolute address
	LDA $7F96			; AD 96 7F | Load from absolute address into accumulator
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; DmaPaletteIndexCalculator - Calculate palette indices with array lookup
; Address: $C187B6
; Size: 25 bytes
;------------------------------------------------------------------------------
DmaPaletteIndexCalculator:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	STA $B473			; 8D 73 B4 | Store accumulator to absolute address
	LDA $B471			; AD 71 B4 | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $99E5,X		  ; BD E5 99 | Load from absolute,X into accumulator
	STA $B477			; 8D 77 B4 | Store accumulator to absolute address
	LDA $99D9			; AD D9 99 | Load from absolute address into accumulator
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; DmaStackRestoreFinal - Final stack restoration and return
; Address: $C187D5
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaStackRestoreFinal:
	JSR $88C2			; 20 C2 88 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaBufferStore1 - Store to buffer position $B48D and load from $B47F
; Address: $C187DF
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaBufferStore1:
	JSR $8847			; 20 47 88 | Jump to subroutine
	STA $B48D			; 8D 8D B4 | Store accumulator to absolute address
	LDA $B47F			; AD 7F B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferConditionalStore - Store to buffer with conditional check ($B471 == 2)
; Address: $C187E8
; Size: 16 bytes
;------------------------------------------------------------------------------
DmaBufferConditionalStore:
	JSR $8847			; 20 47 88 | Jump to subroutine
	STA $B48F			; 8D 8F B4 | Store accumulator to absolute address
	LDA $B471			; AD 71 B4 | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $25			  ; F0 25 | Branch if equal
	LDA $B479			; AD 79 B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferStore2 - Store to buffer position $B485 and load from $B47B
; Address: $C187F9
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaBufferStore2:
	JSR $8840			; 20 40 88 | Jump to subroutine
	STA $B485			; 8D 85 B4 | Store accumulator to absolute address
	LDA $B47B			; AD 7B B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferStore3 - Store to buffer position $B487 and load from $B47D
; Address: $C18802
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaBufferStore3:
	JSR $8840			; 20 40 88 | Jump to subroutine
	STA $B487			; 8D 87 B4 | Store accumulator to absolute address
	LDA $B47D			; AD 7D B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferStore4 - Store to buffer position $B489 and load from $B47F
; Address: $C1880B
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaBufferStore4:
	JSR $8840			; 20 40 88 | Jump to subroutine
	STA $B489			; 8D 89 B4 | Store accumulator to absolute address
	LDA $B47F			; AD 7F B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferStore5 - Store to buffer position $B48B (no load)
; Address: $C18814
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaBufferStore5:
	JSR $8840			; 20 40 88 | Jump to subroutine
	STA $B48B			; 8D 8B B4 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaBufferStoreAlt1 - Alternative buffer store using JSR $8847
; Address: $C1881E
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaBufferStoreAlt1:
	JSR $8847			; 20 47 88 | Jump to subroutine
	STA $B485			; 8D 85 B4 | Store accumulator to absolute address
	LDA $B47B			; AD 7B B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferStoreAlt2 - Alternative buffer store using JSR $8847
; Address: $C18827
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaBufferStoreAlt2:
	JSR $8847			; 20 47 88 | Jump to subroutine
	STA $B487			; 8D 87 B4 | Store accumulator to absolute address
	LDA $B47D			; AD 7D B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaBufferStoreSimple - Simple buffer store to $B48B
; Address: $C18839
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaBufferStoreSimple:
	JSR $8847			; 20 47 88 | Jump to subroutine
	STA $B48B			; 8D 8B B4 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaBitMaskExtractor1 - Extract bits 4-6 and byte swap with 2-bit right shift
; Address: $C18840
; Size: 6 bytes
;------------------------------------------------------------------------------
DmaBitMaskExtractor1:
	AND #$70			 ; 29 70 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaBitMaskExtractor2 - Extract bits 2-4 and byte swap
; Address: $C18847
; Size: 4 bytes
;------------------------------------------------------------------------------
DmaBitMaskExtractor2:
	AND #$1C			 ; 29 1C | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaE3RegisterSetup - Setup E3 register block with DMA parameters
; Address: $C1884C
; Size: 87 bytes
;------------------------------------------------------------------------------
DmaE3RegisterSetup:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $E3C2			; 8D C2 E3 | Store accumulator to absolute address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $E3B2			; 8D B2 E3 | Store accumulator to absolute address
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator
	STA $E3B6			; 8D B6 E3 | Store accumulator to absolute address
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	STA $E3B4			; 8D B4 E3 | Store accumulator to absolute address
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator
	STA $E3B8			; 8D B8 E3 | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $E3BA			; 8D BA E3 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $E3BC			; 8D BC E3 | Store accumulator to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $E3BE			; 8D BE E3 | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $E3C0			; 8D C0 E3 | Store accumulator to absolute address
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $968E			; 8D 8E 96 | Store accumulator to absolute address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $9690			; 8D 90 96 | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $9692			; 8D 92 96 | Store accumulator to absolute address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $9694			; 8D 94 96 | Store accumulator to absolute address
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $9696			; 8D 96 96 | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $9698			; 8D 98 96 | Store accumulator to absolute address
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Dma96RegisterSetup - Setup 96 register block with coordinate parameters
; Address: $C188B2
; Size: 14 bytes
;------------------------------------------------------------------------------
Dma96RegisterSetup:
	STA $969A			; 8D 9A 96 | Store accumulator to absolute address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $969C			; 8D 9C 96 | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $969E			; 8D 9E 96 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaFullRegisterSetup - Complete setup for E3 and 96 register blocks
; Address: $C188C2
; Size: 101 bytes
;------------------------------------------------------------------------------
DmaFullRegisterSetup:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $E3C2			; 8D C2 E3 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $E3B2			; 8D B2 E3 | Store accumulator to absolute address
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $E3B6			; 8D B6 E3 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $E3B4			; 8D B4 E3 | Store accumulator to absolute address
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $E3B8			; 8D B8 E3 | Store accumulator to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $E3BA			; 8D BA E3 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $E3BC			; 8D BC E3 | Store accumulator to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $E3BE			; 8D BE E3 | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $E3C0			; 8D C0 E3 | Store accumulator to absolute address
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $968E			; 8D 8E 96 | Store accumulator to absolute address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $9690			; 8D 90 96 | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $9692			; 8D 92 96 | Store accumulator to absolute address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $9694			; 8D 94 96 | Store accumulator to absolute address
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	STA $9696			; 8D 96 96 | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $9698			; 8D 98 96 | Store accumulator to absolute address
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	STA $969A			; 8D 9A 96 | Store accumulator to absolute address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $969C			; 8D 9C 96 | Store accumulator to absolute address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $969E			; 8D 9E 96 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaBankSetupWithXLoad - Setup 7E bank and load X from B475
; Address: $C18938
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaBankSetupWithXLoad:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $B475			; AE 75 B4 | Load from absolute address into X register
	EOR #$89			 ; 49 89 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaDataBlock_010 - DMA configuration data with register values
; Address: $C1894A
; Size: 34 bytes
;------------------------------------------------------------------------------
DmaDataBlock_010:
	db $89, $76		  ; BIT immediate data
	db $89, $A5		  ; BIT immediate data
	db $89, $E9		  ; BIT immediate data
	db $89, $A9		  ; BIT immediate data
	db $81, $61		  ; STA (zero page,X) data
	db $8D, $70, $96	 ; STA absolute data
	db $A9, $C5		  ; LDA immediate data
	db $8D, $72, $96	 ; STA absolute data
	db $AD, $EF, $99	 ; LDA absolute data
	db $18			   ; CLC data
	db $69, $00		  ; ADC immediate data
	db $8D, $74, $96	 ; STA absolute data
	db $A9, $70		  ; LDA immediate data
	db $8D, $76, $96	 ; STA absolute data
	db $A2, $70		  ; LDX immediate data

;------------------------------------------------------------------------------
; DmaDataBlock_011 - DMA loop data with transfer patterns
; Address: $C18976
; Size: 40 bytes
;------------------------------------------------------------------------------
DmaDataBlock_011:
	db $A9, $00		  ; LDA immediate data
	db $10, $20		  ; BPL branch data
	db $BC, $8A, $AC	 ; LDY absolute,X data
	db $40			   ; RTI data
	db $98			   ; TYA data
	db $A2, $00		  ; LDX immediate data
	db $E2, $20		  ; SEP immediate data
	db $BF, $81, $51, $C5 ; LDA absolute long,X data
	db $48			   ; PHA data
	db $BF, $82, $51, $C5 ; LDA absolute long,X data
	db $01, $99		  ; ORA (zero page,X) data
	db $01, $00		  ; ORA (zero page,X) data
	db $68			   ; PLA data
	db $99, $00, $00	 ; STA absolute,Y data
	db $E8			   ; INX data
	db $E8			   ; INX data
	db $C8			   ; INY data
	db $C8			   ; INY data
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $90			  ; 10 90 | Branch if positive
	SBC $C2			  ; E5 C2 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; DmaSubroutineCall - Call subroutine C120 with BIT test
; Address: $C189A0
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaSubroutineCall:
	JSR $C120			; 20 20 C1 | Jump to subroutine
	BIT #$60			 ; 89 60 | Test bits in accumulator (immediate)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; DmaDataBlock_012 - Extended DMA transfer data with complex patterns
; Address: $C189A7
; Size: 56 bytes
;------------------------------------------------------------------------------
DmaDataBlock_012:
	db $10, $20		  ; BPL branch data
	db $BC, $8A, $AC	 ; LDY absolute,X data
	db $40			   ; RTI data
	db $98			   ; TYA data
	db $A2, $00		  ; LDX immediate data
	db $BF, $81, $51, $C5 ; LDA absolute long,X data
	db $99, $00, $00	 ; STA absolute,Y data
	db $E8			   ; INX data
	db $E8			   ; INX data
	db $C8			   ; INY data
	db $C8			   ; INY data
	db $E0, $00		  ; CPX immediate data
	db $10, $90		  ; BPL branch data
	db $F0, $AC		  ; BEQ branch data
	db $AE, $93, $AD	 ; LDX absolute data
	db $40			   ; RTI data
	db $98			   ; TYA data
	db $99, $AE, $8B	 ; STA absolute,Y data
	db $A9, $7E		  ; LDA immediate data
	db $99, $AE, $8D	 ; STA absolute,Y data
	LDA $99ED			; AD ED 99 | Load from absolute address into accumulator
	STA $8FAE,Y		  ; 99 AE 8F | Store accumulator to absolute,Y
	LDA $9842			; AD 42 98 | Load from absolute address into accumulator
	STA $91AE,Y		  ; 99 AE 91 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STY $93AE			; 8C AE 93 | Store Y register to absolute address

;------------------------------------------------------------------------------
; DmaDataBlock_013 - DMA initialization data block
; Address: $C189E9
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaDataBlock_013:
	db $A9, $00		  ; LDA immediate data
	db $10, $20		  ; BPL branch data
	db $BC, $8A, $AC	 ; LDY absolute,X data
	db $40			   ; RTI data
	db $98			   ; TYA data
	db $A2, $00		  ; LDX immediate data

;------------------------------------------------------------------------------
; DmaMemoryArrayWriter - Write data to memory arrays and update Y index
; Address: $C189F5
; Size: 34 bytes
;------------------------------------------------------------------------------
DmaMemoryArrayWriter:
	JSR $8A51			; 20 51 8A | Jump to subroutine
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	LDA $9840			; AD 40 98 | Load from absolute address into accumulator
	STA $8BAE,Y		  ; 99 AE 8B | Store accumulator to absolute,Y
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $8DAE,Y		  ; 99 AE 8D | Store accumulator to absolute,Y
	LDA $99ED			; AD ED 99 | Load from absolute address into accumulator
	STA $8FAE,Y		  ; 99 AE 8F | Store accumulator to absolute,Y
	LDA $9842			; AD 42 98 | Load from absolute address into accumulator
	STA $91AE,Y		  ; 99 AE 91 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STY $93AE			; 8C AE 93 | Store Y register to absolute address

;------------------------------------------------------------------------------
; DmaIndexedSetup - Load Y index and setup X register with status push
; Address: $C18A1C
; Size: 6 bytes
;------------------------------------------------------------------------------
DmaIndexedSetup:
	LDY $9840			; AC 40 98 | Load from absolute address into Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; DmaMemoryArrayWriterExtended - Extended memory array writer with carry operations
; Address: $C18A22
; Size: 38 bytes
;------------------------------------------------------------------------------
DmaMemoryArrayWriterExtended:
	JSR $8A51			; 20 51 8A | Jump to subroutine
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	LDA $9840			; AD 40 98 | Load from absolute address into accumulator
	STA $8BAE,Y		  ; 99 AE 8B | Store accumulator to absolute,Y
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $8DAE,Y		  ; 99 AE 8D | Store accumulator to absolute,Y
	LDA $99ED			; AD ED 99 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $8FAE,Y		  ; 99 AE 8F | Store accumulator to absolute,Y
	LDA $9842			; AD 42 98 | Load from absolute address into accumulator
	STA $91AE,Y		  ; 99 AE 91 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STY $93AE			; 8C AE 93 | Store Y register to absolute address

;------------------------------------------------------------------------------
; DmaBlockTransfer - Transfer 16-byte blocks from C5XX to current Y address
; Address: $C18A51
; Size: 88 bytes
;------------------------------------------------------------------------------
DmaBlockTransfer:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $9844			; 8D 44 98 | Store accumulator to absolute address
	LDA				  ; BF 81 51 C5 | Load from absolute long,X into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA				  ; BF 83 51 C5 | Load from absolute long,X into accumulator
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y
	LDA				  ; BF 85 51 C5 | Load from absolute long,X into accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA				  ; BF 87 51 C5 | Load from absolute long,X into accumulator
	STA $0006,Y		  ; 99 06 00 | Store accumulator to absolute,Y
	LDA				  ; BF 89 51 C5 | Load from absolute long,X into accumulator
	STA $0008,Y		  ; 99 08 00 | Store accumulator to absolute,Y
	LDA				  ; BF 8B 51 C5 | Load from absolute long,X into accumulator
	STA $000A,Y		  ; 99 0A 00 | Store accumulator to absolute,Y
	LDA				  ; BF 8D 51 C5 | Load from absolute long,X into accumulator
	STA $000C,Y		  ; 99 0C 00 | Store accumulator to absolute,Y
	LDA				  ; BF 8F 51 C5 | Load from absolute long,X into accumulator
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $0010,Y		  ; 99 10 00 | Store accumulator to absolute,Y
	STA $0012,Y		  ; 99 12 00 | Store accumulator to absolute,Y
	STA $0014,Y		  ; 99 14 00 | Store accumulator to absolute,Y
	STA $0016,Y		  ; 99 16 00 | Store accumulator to absolute,Y
	STA $0018,Y		  ; 99 18 00 | Store accumulator to absolute,Y
	STA $001A,Y		  ; 99 1A 00 | Store accumulator to absolute,Y
	STA $001C,Y		  ; 99 1C 00 | Store accumulator to absolute,Y
	STA $001E,Y		  ; 99 1E 00 | Store accumulator to absolute,Y
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; DmaIndexAdvancer - Advance X by 16 and Y by 32, decrement counter
; Address: $C18AAB
; Size: 15 bytes
;------------------------------------------------------------------------------
DmaIndexAdvancer:
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC $9844			; CE 44 98 | Decrement (absolute)
	BNE $9C			  ; D0 9C | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaAddressLoader - Load addresses from 7DXX to 98XX locations
; Address: $C18ABF
; Size: 19 bytes
;------------------------------------------------------------------------------
DmaAddressLoader:
	JSL $C08DA0		  ; 22 A0 8D C0 | Jump to subroutine long
	BCS $00			  ; B0 00 | Branch if carry set
	LDA $7DC8			; AD C8 7D | Load from absolute address into accumulator
	STA $983E			; 8D 3E 98 | Store accumulator to absolute address
	LDA $7DCC			; AD CC 7D | Load from absolute address into accumulator
	STA $9840			; 8D 40 98 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaStackSetupWithB479 - Setup stack and bank 7E, load from B479
; Address: $C18ADA
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaStackSetupWithB479:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $B479			; AD 79 B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaConstantDataWriter - Write constant pattern data (DE C6 DE) to Y address
; Address: $C18AE7
; Size: 21 bytes
;------------------------------------------------------------------------------
DmaConstantDataWriter:
	JSR $8B66			; 20 66 8B | Jump to subroutine
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA $B47B			; AD 7B B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaVariantDataWriter1 - Write pattern (DE C6 5F) to Y address from B47D
; Address: $C18AFF
; Size: 21 bytes
;------------------------------------------------------------------------------
DmaVariantDataWriter1:
	JSR $8B66			; 20 66 8B | Jump to subroutine
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y
	LDA #$5F			 ; A9 5F | Load immediate value into accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA $B47D			; AD 7D B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaVariantDataWriter2 - Write partial pattern (DE C6) to Y address
; Address: $C18B17
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaVariantDataWriter2:
	JSR $8B66			; 20 66 8B | Jump to subroutine
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; DmaSpecialValueWriter - Write value 9F to Y+4 and load from B47F
; Address: $C18B26
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaSpecialValueWriter:
	LDA #$9F			 ; A9 9F | Load immediate value into accumulator
	PHY				  ; 5A | Push Y register to stack
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA $B47F			; AD 7F B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaShiftedDataWriter - Write shifted values (73>>1, 84, 73>>1) to Y address
; Address: $C18B2F
; Size: 23 bytes
;------------------------------------------------------------------------------
DmaShiftedDataWriter:
	JSR $8B66			; 20 66 8B | Jump to subroutine
	LDA #$73			 ; A9 73 | Load immediate value into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$84			 ; A9 84 | Load immediate value into accumulator
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y
	LDA #$73			 ; A9 73 | Load immediate value into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	LDA $B479			; AD 79 B4 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaStackRestoreDataWriter - Write pattern and restore stack state
; Address: $C18B47
; Size: 27 bytes
;------------------------------------------------------------------------------
DmaStackRestoreDataWriter:
	JSR $8B66			; 20 66 8B | Jump to subroutine
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	STA $0002,Y		  ; 99 02 00 | Store accumulator to absolute,Y
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	STA $0004,Y		  ; 99 04 00 | Store accumulator to absolute,Y
	PLY				  ; 7A | Pull Y register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0038,Y		  ; 99 38 00 | Store accumulator to absolute,Y
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaDoubleShiftToY - Double accumulator value and transfer to Y register
; Address: $C18B66
; Size: 3 bytes
;------------------------------------------------------------------------------
DmaDoubleShiftToY:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaValueSetup - Load value 71, address 77AE, and initialize Y to 0
; Address: $C18B9C
; Size: 7 bytes
;------------------------------------------------------------------------------
DmaValueSetup:
	LDA #$71			 ; A9 71 | Load immediate value into accumulator
	LDA $77AE			; AD AE 77 | Load from absolute address into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; DmaComplexTransfer - Complex DMA transfer with address calculations
; Address: $C18BB0
; Size: 32 bytes
;------------------------------------------------------------------------------
DmaComplexTransfer:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $FE			  ; B0 FE | Branch if carry set
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	STA $AD71,X		  ; 9D 71 AD | Store accumulator to absolute,X
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $B477			; 6D 77 B4 | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC #$71			 ; 69 71 | Add with carry (immediate)
	LDA $2722			; AD 22 27 | Load from absolute address into accumulator
	ROL $C0			  ; 26 C0 | Rotate left (zero page)

;------------------------------------------------------------------------------
; DmaSubroutineCallAndRestore - Call C028B4 and restore stack registers
; Address: $C18BD2
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaSubroutineCallAndRestore:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaSortAndJump - Sort B493/B495 values and jump to C08C06
; Address: $C18BDA
; Size: 42 bytes
;------------------------------------------------------------------------------
DmaSortAndJump:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	STA $B495			; 8D 95 B4 | Store accumulator to absolute address
	JMP $C08C06		  ; 5C 06 8C C0 | Jump to address long
	LDA $B493			; AD 93 B4 | Load from absolute address into accumulator
	CMP $B495			; CD 95 B4 | Compare accumulator (absolute)
	BEQ $10			  ; F0 10 | Branch if equal
	BCC $0E			  ; 90 0E | Branch if carry clear
	LDA $B493			; AD 93 B4 | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $B495			; AD 95 B4 | Load from absolute address into accumulator
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $B495			; 8D 95 B4 | Store accumulator to absolute address
	JMP $C08C06		  ; 5C 06 8C C0 | Jump to address long

;------------------------------------------------------------------------------
; DmaAddressCalculator - Calculate addresses from B493/B495 with bit masking
; Address: $C18C06
; Size: 19 bytes
;------------------------------------------------------------------------------
DmaAddressCalculator:
	JSL $C08D06		  ; 22 06 8D C0 | Jump to subroutine long
	LDA $B493			; AD 93 B4 | Load from absolute address into accumulator
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $B497			; 8D 97 B4 | Store accumulator to absolute address
	LDA $B495			; AD 95 B4 | Load from absolute address into accumulator
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; DmaIndexSetupWithConditional - Setup indices with conditional C039 check
; Address: $C18C1B
; Size: 19 bytes
;------------------------------------------------------------------------------
DmaIndexSetupWithConditional:
	STA $B499			; 8D 99 B4 | Store accumulator to absolute address
	STZ $B49B			; 9C 9B B4 | Store zero to absolute
	LDX $B499			; AE 99 B4 | Load from absolute address into X register
	LDA $B49D			; AD 9D B4 | Load from absolute address into accumulator
	BEQ $14			  ; F0 14 | Branch if equal
	LDA $C039,X		  ; BD 39 C0 | Load from absolute,X into accumulator
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; DmaConditionalSubroutine1 - Call 8CA4 with C03B conditional processing
; Address: $C18C2E
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaConditionalSubroutine1:
	JSR $8CA4			; 20 A4 8C | Jump to subroutine
	LDA $C03B,X		  ; BD 3B C0 | Load from absolute,X into accumulator
	BEQ $07			  ; F0 07 | Branch if equal
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; DmaConditionalSubroutine2 - Call 8CA4 with F59D array check for FF
; Address: $C18C39
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaConditionalSubroutine2:
	JSR $8CA4			; 20 A4 8C | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	LDA $F59D,X		  ; BD 9D F5 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; DmaConditionalBranch - Call 8C74 with F59F array branching logic
; Address: $C18C45
; Size: 12 bytes
;------------------------------------------------------------------------------
DmaConditionalBranch:
	JSR $8C74			; 20 74 8C | Jump to subroutine
	BRA $0B			  ; 80 0B | Branch always
	LDA $F59F,X		  ; BD 9F F5 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; DmaSimpleCheck - Call 8C74 and check B49B for zero
; Address: $C18C52
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaSimpleCheck:
	JSR $8C74			; 20 74 8C | Jump to subroutine
	LDA $B49B			; AD 9B B4 | Load from absolute address into accumulator
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; DmaXDecrementLoop - Call subroutine, decrement X by 4 with bounds check
; Address: $C18C5A
; Size: 21 bytes
;------------------------------------------------------------------------------
DmaXDecrementLoop:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	LDX $B499			; AE 99 B4 | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	STX $B499			; 8E 99 B4 | Store X register to absolute address
	BMI $05			  ; 30 05 | Branch if negative
	CPX $B497			; EC 97 B4 | Compare X register (absolute)
	BCS $AF			  ; B0 AF | Branch if carry set

;------------------------------------------------------------------------------
; DmaLongCallWithIncrement - Call C0CBF9 and increment X twice
; Address: $C18C75
; Size: 6 bytes
;------------------------------------------------------------------------------
DmaLongCallWithIncrement:
	JSL $C0CBF9		  ; 22 F9 CB C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; DmaCalculationWithIncrement - Call C0CBF9, increment 7FE6, calculate address
; Address: $C18C7B
; Size: 17 bytes
;------------------------------------------------------------------------------
DmaCalculationWithIncrement:
	JSL $C0CBF9		  ; 22 F9 CB C0 | Jump to subroutine long
	INC $7FE6			; EE E6 7F | Increment (absolute)
	LDA $B499			; AD 99 B4 | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $B477			; 6D 77 B4 | Add with carry (absolute)

;------------------------------------------------------------------------------
; DmaShiftCalculation - Transfer to X, shift B499 by 5 bits, add 0x71
; Address: $C18C8C
; Size: 14 bytes
;------------------------------------------------------------------------------
DmaShiftCalculation:
	TAX				  ; AA | Transfer accumulator to X register
	LDA $B499			; AD 99 B4 | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$71			 ; 69 71 | Add with carry (immediate)
	LDA $80A0			; AD A0 80 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; DmaIncrementAndReturn - Call C02627, increment B49B, restore stack
; Address: $C18C9B
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaIncrementAndReturn:
	JSL $C02627		  ; 22 27 26 C0 | Jump to subroutine long
	INC $B49B			; EE 9B B4 | Increment (absolute)
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaZeroInitializer - Initialize BE43 and C039,X to zero, setup registers
; Address: $C18CA4
; Size: 14 bytes
;------------------------------------------------------------------------------
DmaZeroInitializer:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $BE43			; 9C 43 BE | Store zero to absolute
	STZ $C039,X		  ; 9E 39 C0 | Store zero to absolute,X
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $99D9			; AE D9 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D1
; Address: $C18CB4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D1:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	DEC $EE8C			; CE 8C EE | Decrement (absolute)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D2
; Address: $C18CCF
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D2:
	STY $8CD4			; 8C D4 8C | Store Y register to absolute address
	SBC $A98C,Y		  ; F9 8C A9 | Subtract with carry (absolute,Y)
	INC $2A99			; EE 99 2A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	INC $8A99			; EE 99 8A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	INC $EA99			; EE 99 EA | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	INC $4A99			; EE 99 4A | Increment (absolute)
	CPX $5DA9			; EC A9 5D | Compare X register (absolute)
	INC $AA99			; EE 99 AA | Increment (absolute)
	CPX $5FA9			; EC A9 5F | Compare X register (absolute)
	INC $0A99			; EE 99 0A | Increment (absolute)
	SBC $A960			; ED 60 A9 | Subtract with carry (absolute)
	INC $2A99			; EE 99 2A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D3
; Address: $C18D01
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D3:
	INC $8A99			; EE 99 8A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D5
; Address: $C18D0B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D5:
	JSL $C05668		  ; 22 68 56 C0 | Jump to subroutine long
	LDA $B471			; AD 71 B4 | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	SBC $F4			  ; E5 F4 | Subtract with carry (zero page)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D6
; Address: $C18D1C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D6:
	JSL $C0533E		  ; 22 3E 53 C0 | Jump to subroutine long
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STZ $B491			; 9C 91 B4 | Store zero to absolute
	LDX #$FE			 ; A2 FE | Load immediate value into X register
	ASL $BD			  ; 06 BD | Arithmetic shift left (zero page)
	BNE $04			  ; D0 04 | Branch if not equal
	LDA				  ; BF C6 E5 7F | Load from absolute long,X into accumulator
	STA $AD71,X		  ; 9D 71 AD | Store accumulator to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F0			  ; 10 F0 | Branch if positive
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D7
; Address: $C18D3C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D7:
	LDX #$FE			 ; A2 FE | Load immediate value into X register
	ASL $BD			  ; 06 BD | Arithmetic shift left (zero page)
	BEQ $03			  ; F0 03 | Branch if equal
	STA $AD71,X		  ; 9D 71 AD | Store accumulator to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F4			  ; 10 F4 | Branch if positive
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D8
; Address: $C18D4C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D8:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $C039,X		  ; 9E 39 C0 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0D9
; Address: $C18D5E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0D9:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0DA
; Address: $C18D63
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0DA:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $7C42,X		  ; 9E 42 7C | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $7D02,X		  ; 9E 02 7D | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$42			 ; E0 42 | Hardware register operation
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	EOR ($8D),Y		  ; 51 8D | Exclusive OR with accumulator ((zero page),Y)
	ADC $6918,X		  ; 7D 18 69 | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	STA $7D86			; 8D 86 7D | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $8D			  ; 80 8D | Branch always
	ADC $C2AB,X		  ; 7D AB C2 | Add with carry (absolute,X)
	BMI $7A			  ; 30 7A | Branch if negative
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0DB
; Address: $C18DA0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0DB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7DCA			; 8D CA 7D | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $7D86,X		  ; BD 86 7D | Load from absolute,X into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $7D44,X		  ; FD 44 7D | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $7DCA			; CD CA 7D | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0DC
; Address: $C18DC4
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0DC:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$42			 ; E0 42 | Hardware register operation
	BCC $E7			  ; 90 E7 | Branch if carry clear
	JMP $8E12			; 4C 12 8E | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $7C42,Y		  ; B9 42 7C | Load from absolute,Y into accumulator
	BPL $0A			  ; 10 0A | Branch if positive
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $8E12			; 4C 12 8E | Jump to address
	LDA $7D44,X		  ; BD 44 7D | Load from absolute,X into accumulator
	STA $7C82,Y		  ; 99 82 7C | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC $7DCA			; 6D CA 7D | Add with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	STA $7CC2,Y		  ; 99 C2 7C | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	STA $7D44,X		  ; 9D 44 7D | Store accumulator to absolute,X
	CMP $7D86,X		  ; DD 86 7D | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0DD
; Address: $C18DF7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0DD:
	JSR $8F77			; 20 77 8F | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $99			  ; 80 99 | Branch always
	WDM #$7C			 ; 42 7C | Reserved instruction
	STY $7DC8			; 8C C8 7D | Store Y register to absolute address
	LDA $7C82,Y		  ; B9 82 7C | Load from absolute,Y into accumulator
	STA $7DCC			; 8D CC 7D | Store accumulator to absolute address
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0DE
; Address: $C18E12
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0DE:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0DF
; Address: $C18E1B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0DF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E0
; Address: $C18E20
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E0:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $7C42,Y		  ; B9 42 7C | Load from absolute,Y into accumulator
	BPL $7B			  ; 10 7B | Branch if positive
	LDA $7C82,Y		  ; B9 82 7C | Load from absolute,Y into accumulator
	STA $7DCC			; 8D CC 7D | Store accumulator to absolute address
	LDA $7CC2,Y		  ; B9 C2 7C | Load from absolute,Y into accumulator
	STA $7DCE			; 8D CE 7D | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7C42,Y		  ; 99 42 7C | Store accumulator to absolute,Y
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	LDA $7D44,X		  ; BD 44 7D | Load from absolute,X into accumulator
	CMP $7DCC			; CD CC 7D | Compare accumulator (absolute)
	BCS $24			  ; B0 24 | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$42			 ; E0 42 | Hardware register operation
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDX #$40			 ; A2 40 | Load immediate value into X register
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	BPL $0E			  ; 10 0E | Branch if positive
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$42			 ; E0 42 | Hardware register operation
	BCS $43			  ; B0 43 | Branch if carry set
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	BPL $09			  ; 10 09 | Branch if positive
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E9			  ; 10 E9 | Branch if positive
	LDX #$00			 ; A2 00 | Load immediate value into X register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $09			  ; 30 09 | Branch if negative
	LDA $7D86,Y		  ; B9 86 7D | Load from absolute,Y into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $7DCC			; CD CC 7D | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E1
; Address: $C18E81
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E1:
	JSR $8F41			; 20 41 8F | Jump to subroutine
	BRA $07			  ; 80 07 | Branch always
	LDA $7DCE			; AD CE 7D | Load from absolute address into accumulator
	STA $7D86,Y		  ; 99 86 7D | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E2
; Address: $C18E8F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E2:
	INY				  ; C8 | Increment Y register
	CPY #$42			 ; C0 42 | Hardware register operation
	BCS $13			  ; B0 13 | Branch if carry set
	LDA $7DCE			; AD CE 7D | Load from absolute address into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $7D44,Y		  ; D9 44 7D | Compare accumulator (absolute,Y)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $7D86,Y		  ; B9 86 7D | Load from absolute,Y into accumulator
	STA $7D86,X		  ; 9D 86 7D | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E3
; Address: $C18EA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E3:
	JSR $8F77			; 20 77 8F | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E4
; Address: $C18EB0
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E4:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ASL $CA8D			; 0E 8D CA | Arithmetic shift left (absolute)
	ADC $00A9,X		  ; 7D A9 00 | Add with carry (absolute,X)
	EOR ($18),Y		  ; 51 18 | Exclusive OR with accumulator ((zero page),Y)
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	DEC				  ; 3A | Decrement accumulator
	STA $7DCE			; 8D CE 7D | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	BPL $12			  ; 10 12 | Branch if positive
	LDA $7D86,X		  ; BD 86 7D | Load from absolute,X into accumulator
	CMP $7DCE			; CD CE 7D | Compare accumulator (absolute)
	BNE $0A			  ; D0 0A | Branch if not equal
	SEC				  ; 38 | Set carry flag
	SBC $7D44,X		  ; FD 44 7D | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $7DCA			; CD CA 7D | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$42			 ; E0 42 | Hardware register operation
	BCC $E2			  ; 90 E2 | Branch if carry clear
	JMP $8F38			; 4C 38 8F | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E5
; Address: $C18EF4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E5:
	LDA $7C42,Y		  ; B9 42 7C | Load from absolute,Y into accumulator
	BPL $0A			  ; 10 0A | Branch if positive
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $8F38			; 4C 38 8F | Jump to address
	LDA $7D86,X		  ; BD 86 7D | Load from absolute,X into accumulator
	STA $7CC2,Y		  ; 99 C2 7C | Store accumulator to absolute,Y
	SEC				  ; 38 | Set carry flag
	SBC $7DCA			; ED CA 7D | Subtract with carry (absolute)
	INC				  ; 1A | Increment accumulator
	STA $7C82,Y		  ; 99 82 7C | Store accumulator to absolute,Y
	DEC				  ; 3A | Decrement accumulator
	STA $7D86,X		  ; 9D 86 7D | Store accumulator to absolute,X
	LDA $7D44,X		  ; BD 44 7D | Load from absolute,X into accumulator
	CMP $7D86,X		  ; DD 86 7D | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E6
; Address: $C18F1D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E6:
	JSR $8F77			; 20 77 8F | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $99			  ; 80 99 | Branch always
	WDM #$7C			 ; 42 7C | Reserved instruction
	STY $7DC8			; 8C C8 7D | Store Y register to absolute address
	LDA $7C82,Y		  ; B9 82 7C | Load from absolute,Y into accumulator
	STA $7DCC			; 8D CC 7D | Store accumulator to absolute address
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E7
; Address: $C18F38
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E7:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E8
; Address: $C18F41
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E8:
	PHX				  ; DA | Push X register to stack
	LDX #$3E			 ; A2 3E | Load immediate value into X register
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	STA $7D04,X		  ; 9D 04 7D | Store accumulator to absolute,X
	LDA $7D44,X		  ; BD 44 7D | Load from absolute,X into accumulator
	STA $7D46,X		  ; 9D 46 7D | Store accumulator to absolute,X
	LDA $7D86,X		  ; BD 86 7D | Load from absolute,X into accumulator
	STA $7D88,X		  ; 9D 88 7D | Store accumulator to absolute,X
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0E9
; Address: $C18F59
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0E9:
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E5			  ; 10 E5 | Branch if positive
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $9D			  ; 80 9D | Branch always
	ADC $CCAD,X		  ; 7D AD CC | Add with carry (absolute,X)
	ADC $449D,X		  ; 7D 9D 44 | Add with carry (absolute,X)
	ADC $CEAD,X		  ; 7D AD CE | Add with carry (absolute,X)
	ADC $869D,X		  ; 7D 9D 86 | Add with carry (absolute,X)
	ADC $60FA,X		  ; 7D FA 60 | Add with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$42			 ; E0 42 | Hardware register operation
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $7D02,X		  ; BD 02 7D | Load from absolute,X into accumulator
	STA $7D00,X		  ; 9D 00 7D | Store accumulator to absolute,X
	LDA $7D44,X		  ; BD 44 7D | Load from absolute,X into accumulator
	STA $7D42,X		  ; 9D 42 7D | Store accumulator to absolute,X
	LDA $7D86,X		  ; BD 86 7D | Load from absolute,X into accumulator
	STA $7D84,X		  ; 9D 84 7D | Store accumulator to absolute,X
	BRA $E5			  ; 80 E5 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0EA
; Address: $C18F95
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0EA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $ADD4,X		  ; 9E D4 AD | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $AE34,X		  ; 9E 34 AE | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $AE56			; 8D 56 AE | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0EB
; Address: $C18FC2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0EB:
	ADC #$D4			 ; 69 D4 | Add with carry (immediate)
	LDA $8D3A			; AD 3A 8D | Load from absolute address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	LDX $00A9			; AE A9 00 | Load from absolute address into X register
	BRA $8D			  ; 80 8D | Branch always
	LDX $C2AB			; AE AB C2 | Load from absolute address into X register
	BMI $7A			  ; 30 7A | Branch if negative
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0EC
; Address: $C18FD7
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0EC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $AE9C			; 8D 9C AE | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AE34,X		  ; BD 34 AE | Load from absolute,X into accumulator
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $AE78,X		  ; BD 78 AE | Load from absolute,X into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $AE56,X		  ; FD 56 AE | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $AE9C			; CD 9C AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	JMP $9049			; 4C 49 90 | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $ADD4,Y		  ; B9 D4 AD | Load from absolute,Y into accumulator
	BPL $0A			  ; 10 0A | Branch if positive
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $9049			; 4C 49 90 | Jump to address
	LDA $AE56,X		  ; BD 56 AE | Load from absolute,X into accumulator
	STA $ADF4,Y		  ; 99 F4 AD | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ADC $AE9C			; 6D 9C AE | Add with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	STA $AE14,Y		  ; 99 14 AE | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0ED
; Address: $C19026
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0ED:
	STA $AE56,X		  ; 9D 56 AE | Store accumulator to absolute,X
	CMP $AE78,X		  ; DD 78 AE | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0EE
; Address: $C1902E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0EE:
	JSR $9103			; 20 03 91 | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $99			  ; 80 99 | Branch always
	LDA $9A8C			; AD 8C 9A | Load from absolute address into accumulator
	LDX $F4B9			; AE B9 F4 | Load from absolute address into X register
	LDA $9E8D			; AD 8D 9E | Load from absolute address into accumulator
	LDX $C2AB			; AE AB C2 | Load from absolute address into X register
	BMI $7A			  ; 30 7A | Branch if negative
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaStackRestoreWithClear - Restore all stack registers and clear carry flag
; Address: $C19049
; Size: 9 bytes
;------------------------------------------------------------------------------
DmaStackRestoreWithClear:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaComplexArrayProcessor - Complex array processing with conditional branches
; Address: $C19052
; Size: 53 bytes
;------------------------------------------------------------------------------
DmaComplexArrayProcessor:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $ADD4,Y		  ; B9 D4 AD | Load from absolute,Y into accumulator
	BPL $61			  ; 10 61 | Branch if positive
	LDA $ADF4,Y		  ; B9 F4 AD | Load from absolute,Y into accumulator
	STA $AE9E			; 8D 9E AE | Store accumulator to absolute address
	LDA $AE14,Y		  ; B9 14 AE | Load from absolute,Y into accumulator
	STA $AEA0			; 8D A0 AE | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $ADD4,Y		  ; 99 D4 AD | Store accumulator to absolute,Y
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AE34,X		  ; BD 34 AE | Load from absolute,X into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	LDA $AE56,X		  ; BD 56 AE | Load from absolute,X into accumulator
	CMP $AE9E			; CD 9E AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F1
; Address: $C1908B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F1:
	BCC $EC			  ; 90 EC | Branch if carry clear
	JMP $90C5			; 4C C5 90 | Jump to address
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $09			  ; 30 09 | Branch if negative
	LDA $AE78,Y		  ; B9 78 AE | Load from absolute,Y into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $AE9E			; CD 9E AE | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F2
; Address: $C1909E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F2:
	JSR $90CD			; 20 CD 90 | Jump to subroutine
	BRA $07			  ; 80 07 | Branch always
	LDA $AEA0			; AD A0 AE | Load from absolute address into accumulator
	STA $AE78,Y		  ; 99 78 AE | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	LDA $AEA0			; AD A0 AE | Load from absolute address into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $AE56,Y		  ; D9 56 AE | Compare accumulator (absolute,Y)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $AE78,Y		  ; B9 78 AE | Load from absolute,Y into accumulator
	STA $AE78,X		  ; 9D 78 AE | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F3
; Address: $C190C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F3:
	JSR $9103			; 20 03 91 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F4
; Address: $C190CD
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F4:
	PHX				  ; DA | Push X register to stack
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	LDA $AE34,X		  ; BD 34 AE | Load from absolute,X into accumulator
	STA $AE36,X		  ; 9D 36 AE | Store accumulator to absolute,X
	LDA $AE56,X		  ; BD 56 AE | Load from absolute,X into accumulator
	STA $AE58,X		  ; 9D 58 AE | Store accumulator to absolute,X
	LDA $AE78,X		  ; BD 78 AE | Load from absolute,X into accumulator
	STA $AE7A,X		  ; 9D 7A AE | Store accumulator to absolute,X
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E5			  ; 10 E5 | Branch if positive
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $9D			  ; 80 9D | Branch always
	LDX $9EAD			; AE AD 9E | Load from absolute address into X register
	LDX $569D			; AE 9D 56 | Load from absolute address into X register
	LDX $A0AD			; AE AD A0 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F5
; Address: $C190FD
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F5:
	LDX $789D			; AE 9D 78 | Load from absolute address into X register
	LDX $60FA			; AE FA 60 | Load from absolute address into X register
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $AE34,X		  ; BD 34 AE | Load from absolute,X into accumulator
	STA $AE32,X		  ; 9D 32 AE | Store accumulator to absolute,X
	LDA $AE56,X		  ; BD 56 AE | Load from absolute,X into accumulator
	STA $AE54,X		  ; 9D 54 AE | Store accumulator to absolute,X
	LDA $AE78,X		  ; BD 78 AE | Load from absolute,X into accumulator
	STA $AE76,X		  ; 9D 76 AE | Store accumulator to absolute,X
	BRA $E5			  ; 80 E5 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F6
; Address: $C19121
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F6:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $DD49,X		  ; 9D 49 DD | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F7
; Address: $C1913C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F7:
	JSL $C09169		  ; 22 69 91 C0 | Jump to subroutine long
	STZ $DD45			; 9C 45 DD | Store zero to absolute
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F8
; Address: $C19148
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F8:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $DD89,X		  ; 9E 89 DD | Store zero to absolute,X
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0F9
; Address: $C1915B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0F9:
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0FA
; Address: $C19169
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0FA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $7EDD41		  ; 8F 41 DD 7E | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0FB
; Address: $C19177
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0FB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EDD41		  ; 8F 41 DD 7E | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0FC
; Address: $C19185
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0FC:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	BMI $09			  ; 30 09 | Branch if negative
	BVS $07			  ; 70 07 | Branch if overflow set
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	BRA $18			  ; 80 18 | Branch always
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BCS $0A			  ; B0 0A | Branch if carry set
	LDA $DD4B,X		  ; BD 4B DD | Load from absolute,X into accumulator
	STA $DD49,X		  ; 9D 49 DD | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0FD
; Address: $C191B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0FD:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $F1			  ; 80 F1 | Branch always
	LDX #$3E			 ; A2 3E | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $DD49,X		  ; 9D 49 DD | Store accumulator to absolute,X
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0FE
; Address: $C191C9
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0FE:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $C7E5,Y		  ; B9 E5 C7 | Load from absolute,Y into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $98A7,Y		  ; B9 A7 98 | Load from absolute,Y into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	BMI $34			  ; 30 34 | Branch if negative
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	BVS $14			  ; 70 14 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $C7E5,Y		  ; B9 E5 C7 | Load from absolute,Y into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $98A7,Y		  ; B9 A7 98 | Load from absolute,Y into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	PLY				  ; 7A | Pull Y register from stack
	BRA $07			  ; 80 07 | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $44F2,Y		  ; B9 F2 44 | Load from absolute,Y into accumulator
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BCC $10			  ; 90 10 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank02_DmaFunction_0FF
; Address: $C19212
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_0FF:
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $CE			  ; 90 CE | Branch if carry clear
	BRA $1C			  ; 80 1C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	LDY #$3E			 ; A0 3E | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDA $DD49,Y		  ; B9 49 DD | Load from absolute,Y into accumulator
	STA $DD4B,Y		  ; 99 4B DD | Store accumulator to absolute,Y
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_100
; Address: $C1923F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_100:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	LDA $44F2,X		  ; BD F2 44 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	BMI $3B			  ; 30 3B | Branch if negative
	BVS $18			  ; 70 18 | Branch if overflow set
	PHX				  ; DA | Push X register to stack
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C625,X		  ; BD 25 C6 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $C7E5,X		  ; BD E5 C7 | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $98A7,X		  ; BD A7 98 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	BRA $0B			  ; 80 0B | Branch always

;------------------------------------------------------------------------------
; Bank02_DmaFunction_101
; Address: $C1926D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_101:
	PHX				  ; DA | Push X register to stack
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $44F2,X		  ; BD F2 44 | Load from absolute,X into accumulator
	PLX				  ; FA | Pull X register from stack
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $CA			  ; 90 CA | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_102
; Address: $C19290
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_102:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $DD49,X		  ; 9D 49 DD | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_103
; Address: $C192A0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_103:
	PLA				  ; 68 | Pull accumulator from stack
	PHX				  ; DA | Push X register to stack
	LDY #$3E			 ; A0 3E | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDA $DD49,Y		  ; B9 49 DD | Load from absolute,Y into accumulator
	STA $DD4B,Y		  ; 99 4B DD | Store accumulator to absolute,Y
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA $DD49,X		  ; 9D 49 DD | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_104
; Address: $C192C1
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_104:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_105
; Address: $C192C4
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_105:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	BMI $0C			  ; 30 0C | Branch if negative
	BVC $0A			  ; 50 0A | Branch if overflow clear
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $E8			  ; 90 E8 | Branch if carry clear
	BRA $15			  ; 80 15 | Branch always
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	STA $DD47,X		  ; 9D 47 DD | Store accumulator to absolute,X
	BRA $F1			  ; 80 F1 | Branch always
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $DD47,X		  ; 9D 47 DD | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_106
; Address: $C19307
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_106:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $DD41			; AD 41 DD | Load from absolute address into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_107
; Address: $C19314
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_107:
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	STZ $1C			  ; 64 1C | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_108
; Address: $C1931E
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_108:
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	BMI $3E			  ; 30 3E | Branch if negative
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	BVS $14			  ; 70 14 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $C7E5,Y		  ; B9 E5 C7 | Load from absolute,Y into accumulator
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $98A7,Y		  ; B9 A7 98 | Load from absolute,Y into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	PLY				  ; 7A | Pull Y register from stack
	BRA $07			  ; 80 07 | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $44F2,Y		  ; B9 F2 44 | Load from absolute,Y into accumulator
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BCC $16			  ; 90 16 | Branch if carry clear
	BEQ $20			  ; F0 20 | Branch if equal
	LDA $DD47,X		  ; BD 47 DD | Load from absolute,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $DD49,X		  ; BD 49 DD | Load from absolute,X into accumulator
	STA $DD47,X		  ; 9D 47 DD | Store accumulator to absolute,X
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $DD49,X		  ; 9D 49 DD | Store accumulator to absolute,X
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	STY $1C			  ; 84 1C | Store Y register to zero page
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $B6			  ; 90 B6 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_109
; Address: $C19369
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_109:
	CPY $1C			  ; C4 1C | Compare Y register (zero page)
	BCS $F0			  ; B0 F0 | Branch if carry set
	BRA $DA			  ; 80 DA | Branch always
	PHP				  ; 08 | Push processor status to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $DD47			; AD 47 DD | Load from absolute address into accumulator
	BNE $05			  ; D0 05 | Branch if not equal
	LDA $DD45			; AD 45 DD | Load from absolute address into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	STZ $DD45			; 9C 45 DD | Store zero to absolute

;------------------------------------------------------------------------------
; Bank02_DmaFunction_10B
; Address: $C19386
; Size: 143 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_10B:
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $DB20			; 8D 20 DB | Store accumulator to absolute address
	STA $DB24			; 8D 24 DB | Store accumulator to absolute address
	STA $DB28			; 8D 28 DB | Store accumulator to absolute address
	STA $DB2C			; 8D 2C DB | Store accumulator to absolute address
	STA $DB30			; 8D 30 DB | Store accumulator to absolute address
	STA $DB34			; 8D 34 DB | Store accumulator to absolute address
	STA $DB38			; 8D 38 DB | Store accumulator to absolute address
	STA $DB3C			; 8D 3C DB | Store accumulator to absolute address
	STA $DB40			; 8D 40 DB | Store accumulator to absolute address
	STA $DB44			; 8D 44 DB | Store accumulator to absolute address
	STA $DB48			; 8D 48 DB | Store accumulator to absolute address
	STA $DB4C			; 8D 4C DB | Store accumulator to absolute address
	STA $DB50			; 8D 50 DB | Store accumulator to absolute address
	STA $DB54			; 8D 54 DB | Store accumulator to absolute address
	STA $DB58			; 8D 58 DB | Store accumulator to absolute address
	STA $DB5C			; 8D 5C DB | Store accumulator to absolute address
	STA $DB60			; 8D 60 DB | Store accumulator to absolute address
	STA $DB64			; 8D 64 DB | Store accumulator to absolute address
	STA $DB68			; 8D 68 DB | Store accumulator to absolute address
	STA $DB6C			; 8D 6C DB | Store accumulator to absolute address
	STA $DB70			; 8D 70 DB | Store accumulator to absolute address
	STA $DB74			; 8D 74 DB | Store accumulator to absolute address
	STA $DB78			; 8D 78 DB | Store accumulator to absolute address
	STA $DB7C			; 8D 7C DB | Store accumulator to absolute address
	STA $DB80			; 8D 80 DB | Store accumulator to absolute address
	STA $DB84			; 8D 84 DB | Store accumulator to absolute address
	STA $DB88			; 8D 88 DB | Store accumulator to absolute address
	STA $DB8C			; 8D 8C DB | Store accumulator to absolute address
	STA $DB90			; 8D 90 DB | Store accumulator to absolute address
	STA $DB94			; 8D 94 DB | Store accumulator to absolute address
	STA $DB98			; 8D 98 DB | Store accumulator to absolute address
	STA $DB9C			; 8D 9C DB | Store accumulator to absolute address
	STA $DBA0			; 8D A0 DB | Store accumulator to absolute address
	STA $DBA4			; 8D A4 DB | Store accumulator to absolute address
	STA $DBA8			; 8D A8 DB | Store accumulator to absolute address
	STA $DBAC			; 8D AC DB | Store accumulator to absolute address
	STA $DBB0			; 8D B0 DB | Store accumulator to absolute address
	STA $DBB4			; 8D B4 DB | Store accumulator to absolute address
	STA $DBB8			; 8D B8 DB | Store accumulator to absolute address
	STA $DBBC			; 8D BC DB | Store accumulator to absolute address
	STA $DBC0			; 8D C0 DB | Store accumulator to absolute address
	STA $DBC4			; 8D C4 DB | Store accumulator to absolute address
	STA $DBC8			; 8D C8 DB | Store accumulator to absolute address
	STA $DBCC			; 8D CC DB | Store accumulator to absolute address
	STA $DBD0			; 8D D0 DB | Store accumulator to absolute address
	STA $DBD4			; 8D D4 DB | Store accumulator to absolute address
	STA $DBD8			; 8D D8 DB | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_10C
; Address: $C19415
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_10C:
	STA $DBDC			; 8D DC DB | Store accumulator to absolute address
	STA $DBE0			; 8D E0 DB | Store accumulator to absolute address
	STA $DBE4			; 8D E4 DB | Store accumulator to absolute address
	STA $DBE8			; 8D E8 DB | Store accumulator to absolute address
	STA $DBEC			; 8D EC DB | Store accumulator to absolute address
	STA $DBF0			; 8D F0 DB | Store accumulator to absolute address
	STA $DBF4			; 8D F4 DB | Store accumulator to absolute address
	STA $DBF8			; 8D F8 DB | Store accumulator to absolute address
	STA $DBFC			; 8D FC DB | Store accumulator to absolute address
	STA $DC00			; 8D 00 DC | Store accumulator to absolute address
	STA $DC04			; 8D 04 DC | Store accumulator to absolute address
	STA $DC08			; 8D 08 DC | Store accumulator to absolute address
	STA $DC0C			; 8D 0C DC | Store accumulator to absolute address
	STA $DC10			; 8D 10 DC | Store accumulator to absolute address
	STA $DC14			; 8D 14 DC | Store accumulator to absolute address
	STA $DC18			; 8D 18 DC | Store accumulator to absolute address
	STA $DC1C			; 8D 1C DC | Store accumulator to absolute address
	STA $DC20			; 8D 20 DC | Store accumulator to absolute address
	STA $DC24			; 8D 24 DC | Store accumulator to absolute address
	STA $DC28			; 8D 28 DC | Store accumulator to absolute address
	STA $DC2C			; 8D 2C DC | Store accumulator to absolute address
	STA $DC30			; 8D 30 DC | Store accumulator to absolute address
	STA $DC34			; 8D 34 DC | Store accumulator to absolute address
	STA $DC38			; 8D 38 DC | Store accumulator to absolute address
	STA $DC3C			; 8D 3C DC | Store accumulator to absolute address
	STA $DC40			; 8D 40 DC | Store accumulator to absolute address
	STA $DC44			; 8D 44 DC | Store accumulator to absolute address
	STA $DC48			; 8D 48 DC | Store accumulator to absolute address
	STA $DC4C			; 8D 4C DC | Store accumulator to absolute address
	STA $DC50			; 8D 50 DC | Store accumulator to absolute address
	STA $DC54			; 8D 54 DC | Store accumulator to absolute address
	STA $DC58			; 8D 58 DC | Store accumulator to absolute address
	STA $DC5C			; 8D 5C DC | Store accumulator to absolute address
	STA $DC60			; 8D 60 DC | Store accumulator to absolute address
	STA $DC64			; 8D 64 DC | Store accumulator to absolute address
	STA $DC68			; 8D 68 DC | Store accumulator to absolute address
	STA $DC6C			; 8D 6C DC | Store accumulator to absolute address
	STA $DC70			; 8D 70 DC | Store accumulator to absolute address
	STA $DC74			; 8D 74 DC | Store accumulator to absolute address
	STA $DC78			; 8D 78 DC | Store accumulator to absolute address
	STA $DC7C			; 8D 7C DC | Store accumulator to absolute address
	STA $DC80			; 8D 80 DC | Store accumulator to absolute address
	STA $DC84			; 8D 84 DC | Store accumulator to absolute address
	STA $DC88			; 8D 88 DC | Store accumulator to absolute address
	STA $DC8C			; 8D 8C DC | Store accumulator to absolute address
	STA $DC90			; 8D 90 DC | Store accumulator to absolute address
	STA $DC94			; 8D 94 DC | Store accumulator to absolute address
	STA $DC98			; 8D 98 DC | Store accumulator to absolute address
	STA $DC9C			; 8D 9C DC | Store accumulator to absolute address
	STA $DCA0			; 8D A0 DC | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_10D
; Address: $C194AB
; Size: 149 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_10D:
	STA $DCA4			; 8D A4 DC | Store accumulator to absolute address
	STA $DCA8			; 8D A8 DC | Store accumulator to absolute address
	STA $DCAC			; 8D AC DC | Store accumulator to absolute address
	STA $DCB0			; 8D B0 DC | Store accumulator to absolute address
	STA $DCB4			; 8D B4 DC | Store accumulator to absolute address
	STA $DCB8			; 8D B8 DC | Store accumulator to absolute address
	STA $DCBC			; 8D BC DC | Store accumulator to absolute address
	STA $DCC0			; 8D C0 DC | Store accumulator to absolute address
	STA $DCC4			; 8D C4 DC | Store accumulator to absolute address
	STA $DCC8			; 8D C8 DC | Store accumulator to absolute address
	STA $DCCC			; 8D CC DC | Store accumulator to absolute address
	STA $DCD0			; 8D D0 DC | Store accumulator to absolute address
	STA $DCD4			; 8D D4 DC | Store accumulator to absolute address
	STA $DCD8			; 8D D8 DC | Store accumulator to absolute address
	STA $DCDC			; 8D DC DC | Store accumulator to absolute address
	STA $DCE0			; 8D E0 DC | Store accumulator to absolute address
	STA $DCE4			; 8D E4 DC | Store accumulator to absolute address
	STA $DCE8			; 8D E8 DC | Store accumulator to absolute address
	STA $DCEC			; 8D EC DC | Store accumulator to absolute address
	STA $DCF0			; 8D F0 DC | Store accumulator to absolute address
	STA $DCF4			; 8D F4 DC | Store accumulator to absolute address
	STA $DCF8			; 8D F8 DC | Store accumulator to absolute address
	STA $DCFC			; 8D FC DC | Store accumulator to absolute address
	STA $DD00			; 8D 00 DD | Store accumulator to absolute address
	STA $DD04			; 8D 04 DD | Store accumulator to absolute address
	STA $DD08			; 8D 08 DD | Store accumulator to absolute address
	STA $DD0C			; 8D 0C DD | Store accumulator to absolute address
	STA $DD10			; 8D 10 DD | Store accumulator to absolute address
	STA $DD14			; 8D 14 DD | Store accumulator to absolute address
	STA $DD18			; 8D 18 DD | Store accumulator to absolute address
	STA $DD1C			; 8D 1C DD | Store accumulator to absolute address
	REP #$30			 ; C2 30 | Reset processor status bits
	STZ $DD1F			; 9C 1F DD | Store zero to absolute
	STZ $DD21			; 9C 21 DD | Store zero to absolute
	STZ $DD23			; 9C 23 DD | Store zero to absolute
	STZ $DD25			; 9C 25 DD | Store zero to absolute
	STZ $DD27			; 9C 27 DD | Store zero to absolute
	STZ $DD29			; 9C 29 DD | Store zero to absolute
	STZ $DD2B			; 9C 2B DD | Store zero to absolute
	STZ $DD2D			; 9C 2D DD | Store zero to absolute
	STZ $DD2F			; 9C 2F DD | Store zero to absolute
	STZ $DD31			; 9C 31 DD | Store zero to absolute
	STZ $DD33			; 9C 33 DD | Store zero to absolute
	STZ $DD35			; 9C 35 DD | Store zero to absolute
	STZ $DD37			; 9C 37 DD | Store zero to absolute
	STZ $DD39			; 9C 39 DD | Store zero to absolute
	STZ $DD3B			; 9C 3B DD | Store zero to absolute
	STZ $DD3D			; 9C 3D DD | Store zero to absolute
	PEA #$99C5		   ; F4 C5 99 | Push effective address to stack
	PEA #$0010		   ; F4 10 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_10F
; Address: $C19543
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_10F:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	STA $28			  ; 85 28 | Store accumulator to zero page
	STZ $DD3F			; 9C 3F DD | Store zero to absolute
	LDA $7FFC5A		  ; AF 5A FC 7F | Load from absolute long address into accumulator
	LSR $7FFC,X		  ; 5E FC 7F | Logical shift right (absolute,X)
	STA $DD43			; 8D 43 DD | Store accumulator to absolute address
	LDA $7FFC58		  ; AF 58 FC 7F | Load from absolute long address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	JMP $9576			; 4C 76 95 | Jump to address
	JMP $9E58			; 4C 58 9E | Jump to address
	JMP $A87A			; 4C 7A A8 | Jump to address
	JMP $B29C			; 4C 9C B2 | Jump to address
	LDA $DD49			; AD 49 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD49			; 2C 49 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_110
; Address: $C195B2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_110:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4B			; AD 4B DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD4B			; 2C 4B DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_111
; Address: $C195C8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_111:
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_112
; Address: $C195F9
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_112:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4D			; AD 4D DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD4D			; 2C 4D DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_113
; Address: $C19640
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_113:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4F			; AD 4F DD | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_114
; Address: $C1964E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_114:
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD4F			; 2C 4F DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemoryManagerComplex - Complex memory management with DD region access
; Address: $C19687
; Size: 65 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerComplex:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD51			; AD 51 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD51			; 2C 51 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemoryManagerVariant1 - Memory manager variant working on DD53
; Address: $C196D2
; Size: 61 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerVariant1:
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD53			; AD 53 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD53			; 2C 53 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemoryManagerVariant2 - Memory manager variant working on DD55
; Address: $C19715
; Size: 59 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerVariant2:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD55			; AD 55 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD55			; 2C 55 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_119
; Address: $C19755
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_119:
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_11A
; Address: $C1975C
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_11A:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD57			; AD 57 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD57			; 2C 57 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_11B
; Address: $C197A3
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_11B:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD59			; AD 59 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD59			; 2C 59 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_11C
; Address: $C197D7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_11C:
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_11D
; Address: $C197EA
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_11D:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5B			; AD 5B DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD5B			; 2C 5B DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_11E
; Address: $C19831
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_11E:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5D			; AD 5D DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD5D			; 2C 5D DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_11F
; Address: $C1985A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_11F:
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_120
; Address: $C19878
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_120:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5F			; AD 5F DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD5F			; 2C 5F DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_121
; Address: $C198BF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_121:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD61			; AD 61 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD61			; 2C 61 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_122
; Address: $C198DD
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_122:
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_123
; Address: $C19906
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_123:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD63			; AD 63 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD63			; 2C 63 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_124
; Address: $C1994D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_124:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD65			; AD 65 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD65			; 2C 65 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_125
; Address: $C19962
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_125:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_126
; Address: $C19994
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_126:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD67			; AD 67 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD67			; 2C 67 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_127
; Address: $C199DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_127:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_128
; Address: $C199E6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_128:
	LDA $DD69			; AD 69 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD69			; 2C 69 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_129
; Address: $C19A22
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_129:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6B			; AD 6B DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD6B			; 2C 6B DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_12A
; Address: $C19A69
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_12A:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6D			; AD 6D DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD6D			; 2C 6D DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_12B
; Address: $C19AB0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_12B:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6F			; AD 6F DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD6F			; 2C 6F DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_12C
; Address: $C19AEC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_12C:
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_12D
; Address: $C19AF7
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_12D:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD71			; AD 71 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD71			; 2C 71 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_12E
; Address: $C19B3E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_12E:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD73			; AD 73 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD73			; 2C 73 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_12F
; Address: $C19B70
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_12F:
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_130
; Address: $C19B85
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_130:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD75			; AD 75 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD75			; 2C 75 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_131
; Address: $C19BCC
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_131:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD77			; AD 77 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD77			; 2C 77 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_132
; Address: $C19BF2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_132:
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_133
; Address: $C19C13
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_133:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD79			; AD 79 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD79			; 2C 79 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_134
; Address: $C19C5A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_134:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7B			; AD 7B DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD7B			; 2C 7B DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_135
; Address: $C19C76
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_135:
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_136
; Address: $C19CA1
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_136:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7D			; AD 7D DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD7D			; 2C 7D DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_137
; Address: $C19CE8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_137:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7F			; AD 7F DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD7F			; 2C 7F DD | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_138
; Address: $C19CFB
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_138:
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemoryManagerDD81 - Memory manager for DD81 region
; Address: $C19D2F
; Size: 65 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerDD81:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD81			; AD 81 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD81			; 2C 81 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemorySetupShort - Short setup for DD region memory management
; Address: $C19D76
; Size: 8 bytes
;------------------------------------------------------------------------------
DmaMemorySetupShort:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)

;------------------------------------------------------------------------------
; DmaMemoryManagerDD83 - Memory manager for DD83 region (continuation)
; Address: $C19D7E
; Size: 57 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerDD83:
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD83			; AD 83 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD83			; 2C 83 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemoryManagerDD85 - Memory manager for DD85 region
; Address: $C19DBD
; Size: 63 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerDD85:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD85			; AD 85 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD85			; 2C 85 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always

;------------------------------------------------------------------------------
; DmaMemoryManagerDD87 - Memory manager for DD87 region
; Address: $C19E04
; Size: 65 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerDD87:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD87			; AD 87 DD | Load from absolute address into accumulator
	BMI $42			  ; 30 42 | Hardware register operation
	BIT $DD87			; 2C 87 DD | Test bits in accumulator (absolute)
	BVS $2F			  ; 70 2F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $2C			  ; D0 2C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $27			  ; 30 27 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; DmaMemoryFinalize - Finalize memory operation and return
; Address: $C19E4B
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaMemoryFinalize:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaMemoryManagerDD49 - Memory manager for DD49 region (variant)
; Address: $C19E58
; Size: 38 bytes
;------------------------------------------------------------------------------
DmaMemoryManagerDD49:
	LDA $DD49			; AD 49 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD49			; 2C 49 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; DmaConditionalProcessor - Process C8E5 array with DD43 mask check
; Address: $C19E81
; Size: 26 bytes
;------------------------------------------------------------------------------
DmaConditionalProcessor:
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_142
; Address: $C19E9E
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_142:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4B			; AD 4B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD4B			; 2C 4B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_143
; Address: $C19EEF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_143:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4D			; AD 4D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD4D			; 2C 4D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_144
; Address: $C19F04
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_144:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_145
; Address: $C19F40
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_145:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4F			; AD 4F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD4F			; 2C 4F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_146
; Address: $C19F86
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_146:
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_147
; Address: $C19F91
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_147:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD51			; AD 51 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD51			; 2C 51 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_148
; Address: $C19FE2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_148:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD53			; AD 53 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD53			; 2C 53 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_149
; Address: $C1A008
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_149:
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_14A
; Address: $C1A033
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_14A:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD55			; AD 55 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD55			; 2C 55 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_14B
; Address: $C1A084
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_14B:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_14C
; Address: $C1A08C
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_14C:
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD57			; AD 57 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD57			; 2C 57 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_14D
; Address: $C1A0D5
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_14D:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD59			; AD 59 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD59			; 2C 59 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_14E
; Address: $C1A10E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_14E:
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_14F
; Address: $C1A126
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_14F:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5B			; AD 5B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD5B			; 2C 5B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_150
; Address: $C1A177
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_150:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5D			; AD 5D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD5D			; 2C 5D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_151
; Address: $C1A190
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_151:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_152
; Address: $C1A1C8
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_152:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5F			; AD 5F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD5F			; 2C 5F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_154
; Address: $C1A219
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_154:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD61			; AD 61 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD61			; 2C 61 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_155
; Address: $C1A26A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_155:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD63			; AD 63 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD63			; 2C 63 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative

;------------------------------------------------------------------------------
; Bank02_DmaFunction_156
; Address: $C1A295
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_156:
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_157
; Address: $C1A2BB
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_157:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD65			; AD 65 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD65			; 2C 65 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_158
; Address: $C1A30C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_158:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD67			; AD 67 DD | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_159
; Address: $C1A31A
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_159:
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD67			; 2C 67 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_15A
; Address: $C1A35D
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_15A:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD69			; AD 69 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD69			; 2C 69 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_15B
; Address: $C1A39B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_15B:
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_15C
; Address: $C1A3AE
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_15C:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6B			; AD 6B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD6B			; 2C 6B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_15D
; Address: $C1A3FF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_15D:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6D			; AD 6D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD6D			; 2C 6D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_15E
; Address: $C1A41D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_15E:
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_15F
; Address: $C1A450
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_15F:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6F			; AD 6F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD6F			; 2C 6F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_160
; Address: $C1A4A1
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_160:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD71			; AD 71 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD71			; 2C 71 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_161
; Address: $C1A4F2
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_161:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD73			; AD 73 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD73			; 2C 73 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_162
; Address: $C1A524
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_162:
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_163
; Address: $C1A543
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_163:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD75			; AD 75 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD75			; 2C 75 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_164
; Address: $C1A594
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_164:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD77			; AD 77 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD77			; 2C 77 DD | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_165
; Address: $C1A5A7
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_165:
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_166
; Address: $C1A5E5
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_166:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD79			; AD 79 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD79			; 2C 79 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_167
; Address: $C1A629
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_167:
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_168
; Address: $C1A636
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_168:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7B			; AD 7B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD7B			; 2C 7B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_169
; Address: $C1A687
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_169:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7D			; AD 7D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD7D			; 2C 7D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_16A
; Address: $C1A6AB
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_16A:
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_16B
; Address: $C1A6D8
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_16B:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7F			; AD 7F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD7F			; 2C 7F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_16D
; Address: $C1A72E
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_16D:
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD81			; AD 81 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD81			; 2C 81 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_16E
; Address: $C1A77A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_16E:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD83			; AD 83 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD83			; 2C 83 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_16F
; Address: $C1A7B1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_16F:
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_170
; Address: $C1A7CB
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_170:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD85			; AD 85 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD85			; 2C 85 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_171
; Address: $C1A81C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_171:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD87			; AD 87 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD87			; 2C 87 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_172
; Address: $C1A832
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_172:
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	AND $DD43			; 2D 43 DD | Logical AND with accumulator (absolute)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_173
; Address: $C1A86D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_173:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_174
; Address: $C1A87A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_174:
	LDA $DD49			; AD 49 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD49			; 2C 49 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_175
; Address: $C1A8B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_175:
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_176
; Address: $C1A8C0
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_176:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4B			; AD 4B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD4B			; 2C 4B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_177
; Address: $C1A911
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_177:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4D			; AD 4D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD4D			; 2C 4D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_178
; Address: $C1A935
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_178:
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_179
; Address: $C1A962
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_179:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4F			; AD 4F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD4F			; 2C 4F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_17B
; Address: $C1A9B8
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_17B:
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD51			; AD 51 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD51			; 2C 51 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_17C
; Address: $C1AA04
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_17C:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD53			; AD 53 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD53			; 2C 53 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_17D
; Address: $C1AA3B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_17D:
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_17E
; Address: $C1AA55
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_17E:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD55			; AD 55 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD55			; 2C 55 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_17F
; Address: $C1AAA6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_17F:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD57			; AD 57 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD57			; 2C 57 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_180
; Address: $C1AABC
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_180:
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_181
; Address: $C1AAF7
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_181:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD59			; AD 59 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD59			; 2C 59 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_182
; Address: $C1AB41
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_182:
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_183
; Address: $C1AB48
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_183:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5B			; AD 5B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD5B			; 2C 5B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_184
; Address: $C1AB99
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_184:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5D			; AD 5D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD5D			; 2C 5D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_185
; Address: $C1ABC2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_185:
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_186
; Address: $C1ABEA
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_186:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5F			; AD 5F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD5F			; 2C 5F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_187
; Address: $C1AC3B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_187:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_188
; Address: $C1AC46
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_188:
	LDA $DD61			; AD 61 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD61			; 2C 61 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_189
; Address: $C1AC8C
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_189:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD63			; AD 63 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD63			; 2C 63 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_18A
; Address: $C1ACC8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_18A:
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_18B
; Address: $C1ACDD
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_18B:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD65			; AD 65 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD65			; 2C 65 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_18C
; Address: $C1AD2E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_18C:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD67			; AD 67 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD67			; 2C 67 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_18D
; Address: $C1AD4A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_18D:
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_18E
; Address: $C1AD7F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_18E:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD69			; AD 69 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD69			; 2C 69 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always

;------------------------------------------------------------------------------
; Bank02_DmaFunction_190
; Address: $C1ADD0
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_190:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6B			; AD 6B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD6B			; 2C 6B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_191
; Address: $C1AE21
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_191:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6D			; AD 6D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD6D			; 2C 6D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_192
; Address: $C1AE50
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_192:
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_193
; Address: $C1AE72
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_193:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6F			; AD 6F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD6F			; 2C 6F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_194
; Address: $C1AEC3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_194:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD71			; AD 71 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative

;------------------------------------------------------------------------------
; Bank02_DmaFunction_195
; Address: $C1AED3
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_195:
	BIT $DD71			; 2C 71 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_196
; Address: $C1AF14
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_196:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD73			; AD 73 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD73			; 2C 73 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_197
; Address: $C1AF55
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_197:
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_198
; Address: $C1AF65
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_198:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD75			; AD 75 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD75			; 2C 75 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_199
; Address: $C1AFB6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_199:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD77			; AD 77 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD77			; 2C 77 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_19A
; Address: $C1AFD7
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_19A:
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_19B
; Address: $C1B007
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_19B:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD79			; AD 79 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD79			; 2C 79 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_19D
; Address: $C1B05C
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_19D:
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7B			; AD 7B DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD7B			; 2C 7B DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_19E
; Address: $C1B0A9
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_19E:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7D			; AD 7D DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD7D			; 2C 7D DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_19F
; Address: $C1B0DD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_19F:
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A0
; Address: $C1B0FA
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A0:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7F			; AD 7F DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD7F			; 2C 7F DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A1
; Address: $C1B14B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A1:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD81			; AD 81 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD81			; 2C 81 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A2
; Address: $C1B160
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A2:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A3
; Address: $C1B19C
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A3:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD83			; AD 83 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD83			; 2C 83 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A4
; Address: $C1B1E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A4:
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A5
; Address: $C1B1ED
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A5:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD85			; AD 85 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD85			; 2C 85 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A6
; Address: $C1B23E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A6:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD87			; AD 87 DD | Load from absolute address into accumulator
	BMI $4C			  ; 30 4C | Branch if negative
	BIT $DD87			; 2C 87 DD | Test bits in accumulator (absolute)
	BVS $39			  ; 70 39 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $36			  ; D0 36 | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A7
; Address: $C1B264
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A7:
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $31			  ; 30 31 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CMP #$7B			 ; C9 7B | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A8
; Address: $C1B28F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A8:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1A9
; Address: $C1B29C
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1A9:
	LDA $DD49			; AD 49 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD49			; 2C 49 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1AA
; Address: $C1B2E8
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1AA:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4B			; AD 4B DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD4B			; 2C 4B DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1AB
; Address: $C1B33F
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1AB:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4D			; AD 4D DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD4D			; 2C 4D DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1AC
; Address: $C1B36E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1AC:
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1AD
; Address: $C1B396
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1AD:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD4F			; AD 4F DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD4F			; 2C 4F DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1AE
; Address: $C1B3ED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1AE:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1AF
; Address: $C1B3F8
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1AF:
	LDA $DD51			; AD 51 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD51			; 2C 51 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B0
; Address: $C1B444
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B0:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD53			; AD 53 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD53			; 2C 53 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B1
; Address: $C1B47D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B1:
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B2
; Address: $C1B49B
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B2:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD55			; AD 55 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD55			; 2C 55 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B3
; Address: $C1B4F2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B3:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD57			; AD 57 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD57			; 2C 57 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B4
; Address: $C1B507
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B4:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B5
; Address: $C1B549
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B5:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD59			; AD 59 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD59			; 2C 59 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B6
; Address: $C1B58F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B6:
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B7
; Address: $C1B5A0
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B7:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5B			; AD 5B DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD5B			; 2C 5B DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B8
; Address: $C1B5F7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B8:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5D			; AD 5D DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD5D			; 2C 5D DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1B9
; Address: $C1B615
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1B9:
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1BA
; Address: $C1B64E
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1BA:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD5F			; AD 5F DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD5F			; 2C 5F DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1BC
; Address: $C1B6A5
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1BC:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD61			; AD 61 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD61			; 2C 61 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1BD
; Address: $C1B6FC
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1BD:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD63			; AD 63 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD63			; 2C 63 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1BE
; Address: $C1B725
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1BE:
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1BF
; Address: $C1B753
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1BF:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD65			; AD 65 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD65			; 2C 65 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C1
; Address: $C1B7AF
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C1:
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD67			; AD 67 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD67			; 2C 67 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C2
; Address: $C1B801
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C2:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD69			; AD 69 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD69			; 2C 69 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C3
; Address: $C1B835
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C3:
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C4
; Address: $C1B858
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C4:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6B			; AD 6B DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD6B			; 2C 6B DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C5
; Address: $C1B8AF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C5:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6D			; AD 6D DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C6
; Address: $C1B8BF
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C6:
	BIT $DD6D			; 2C 6D DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C7
; Address: $C1B906
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C7:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD6F			; AD 6F DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD6F			; 2C 6F DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C8
; Address: $C1B945
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C8:
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1C9
; Address: $C1B95D
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1C9:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD71			; AD 71 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD71			; 2C 71 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1CA
; Address: $C1B9B4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1CA:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD73			; AD 73 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD73			; 2C 73 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1CB
; Address: $C1B9CD
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1CB:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1CC
; Address: $C1BA0B
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1CC:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD75			; AD 75 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD75			; 2C 75 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1CD
; Address: $C1BA57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1CD:
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1CE
; Address: $C1BA62
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1CE:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD77			; AD 77 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD77			; 2C 77 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1CF
; Address: $C1BAB9
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1CF:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD79			; AD 79 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD79			; 2C 79 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D0
; Address: $C1BADD
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D0:
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D1
; Address: $C1BB10
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D1:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7B			; AD 7B DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD7B			; 2C 7B DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D2
; Address: $C1BB67
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D2:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7D			; AD 7D DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD7D			; 2C 7D DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D3
; Address: $C1BBBE
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D3:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD7F			; AD 7F DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD7F			; 2C 7F DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D4
; Address: $C1BBED
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D4:
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D5
; Address: $C1BC15
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D5:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD81			; AD 81 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD81			; 2C 81 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D6
; Address: $C1BC6C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D6:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D7
; Address: $C1BC77
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D7:
	LDA $DD83			; AD 83 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD83			; 2C 83 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D8
; Address: $C1BCC3
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D8:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD85			; AD 85 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD85			; 2C 85 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1D9
; Address: $C1BCFC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1D9:
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1DA
; Address: $C1BD1A
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1DA:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	LDA $DD87			; AD 87 DD | Load from absolute address into accumulator
	BMI $52			  ; 30 52 | Branch if negative
	BIT $DD87			; 2C 87 DD | Test bits in accumulator (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	BMI $37			  ; 30 37 | Branch if negative
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA $C8E5,Y		  ; B9 E5 C8 | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $DD43			; CD 43 DD | Compare accumulator (absolute)
	BEQ $24			  ; F0 24 | Branch if equal
	JMP $D07FFC		  ; 5C FC 7F D0 | Jump to address long
	ASL $3FAD,X		  ; 1E AD 3F | Arithmetic shift left (absolute,X)
	CMP $7BC9,X		  ; DD C9 7B | Compare accumulator (absolute,X)
	BCS $16			  ; B0 16 | Branch if carry set
	LDX $CFE5,Y		  ; BE E5 CF | Load from absolute,Y into X register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $0E			  ; 80 0E | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1DB
; Address: $C1BD71
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1DB:
	JSL $C7A235		  ; 22 35 A2 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $DD3F			; 6D 3F DD | Add with carry (absolute)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1DD
; Address: $C1BD82
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1DD:
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1DE
; Address: $C1BDB0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1DE:
	BRA $34			  ; 80 34 | Branch always
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	CMP #$F8			 ; C9 F8 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	CMP #$F8			 ; C9 F8 | Compare accumulator (immediate)
	BCS $1B			  ; B0 1B | Branch if carry set
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	CMP #$D8			 ; C9 D8 | Compare accumulator (immediate)
	BCS $04			  ; B0 04 | Branch if carry set
	STA $1A			  ; 85 1A | Store accumulator to zero page
	BRA $01			  ; 80 01 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1DF
; Address: $C1BDE6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1DF:
	LDA $C825,Y		  ; B9 25 C8 | Load from absolute,Y into accumulator
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $20			  ; 85 20 | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E0
; Address: $C1BDFE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E0:
	BMI $48			  ; 30 48 | Branch if negative
	LDA $C425,Y		  ; B9 25 C4 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E1
; Address: $C1BE09
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E1:
	JSL $D42068		  ; 22 68 20 D4 | Jump to subroutine long
	DEC $AD			  ; C6 AD | Decrement (zero page)
	CMP $0A0A,X		  ; DD 0A 0A | Compare accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BED4			; 4C D4 BE | Jump to address
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA ($E2,X)		  ; A1 E2 | Load from (zero page,X) into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E2
; Address: $C1BE77
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E2:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $DB			  ; 25 DB | Logical AND with accumulator (zero page)
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA $E2			  ; A5 E2 | Load from zero page into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E3
; Address: $C1BE9D
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E3:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $A6DB			; 2D DB A6 | Logical AND with accumulator (absolute)
	ASL $02BF,X		  ; 1E BF 02 | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E4
; Address: $C1BEC3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E4:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E5
; Address: $C1BED4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E5:
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDA $E2A1,Y		  ; B9 A1 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDA $E2A3,Y		  ; B9 A3 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDA $E2A5,Y		  ; B9 A5 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E6
; Address: $C1BEF6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E6:
	LDA $E2A7,Y		  ; B9 A7 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB2D,X		  ; 9D 2D DB | Store accumulator to absolute,X
	LDA $E2A9,Y		  ; B9 A9 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDA $E2AB,Y		  ; B9 AB E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E7
; Address: $C1BF1F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E7:
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1E8
; Address: $C1BF4D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1E8:
	LDA $C825,Y		  ; B9 25 C8 | Load from absolute,Y into accumulator
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $20			  ; 85 20 | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $48			  ; 30 48 | Branch if negative
	LDA $C425,Y		  ; B9 25 C4 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1EA
; Address: $C1BF73
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1EA:
	JSL $D42068		  ; 22 68 20 D4 | Jump to subroutine long
	DEC $AD			  ; C6 AD | Decrement (zero page)
	CMP $0A0A,X		  ; DD 0A 0A | Compare accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	JMP $BE4A			; 4C 4A BE | Jump to address
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1EC
; Address: $C1BFEA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1EC:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $20			  ; 85 20 | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $48			  ; 30 48 | Branch if negative
	LDA $C425,Y		  ; B9 25 C4 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA $22			  ; 85 22 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1ED
; Address: $C1C00D
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1ED:
	JSR $C6D4			; 20 D4 C6 | Jump to subroutine
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C0D6			; 4C D6 C0 | Jump to address
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDX $20			  ; A6 20 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1EE
; Address: $C1C05B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1EE:
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA ($E2,X)		  ; A1 E2 | Load from (zero page,X) into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1EF
; Address: $C1C079
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1EF:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $DB			  ; 25 DB | Logical AND with accumulator (zero page)
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA $E2			  ; A5 E2 | Load from zero page into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F0
; Address: $C1C09F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F0:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $A6DB			; 2D DB A6 | Logical AND with accumulator (absolute)
	ASL $00BF,X		  ; 1E BF 00 | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F1
; Address: $C1C0C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F1:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F3
; Address: $C1C0DA
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F3:
	LDA $E2A1,Y		  ; B9 A1 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDA $E2A3,Y		  ; B9 A3 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDA $E2A5,Y		  ; B9 A5 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDA $E2A7,Y		  ; B9 A7 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB2D,X		  ; 9D 2D DB | Store accumulator to absolute,X
	LDA $E2A9,Y		  ; B9 A9 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDA $E2AB,Y		  ; B9 AB E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F4
; Address: $C1C121
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F4:
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F6
; Address: $C1C154
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F6:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $20			  ; 85 20 | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $85			  ; 30 85 | Branch if negative

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F7
; Address: $C1C169
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F7:
	JSL $C6D420		  ; 22 20 D4 C6 | Jump to subroutine long
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA ($E2,X)		  ; A1 E2 | Load from (zero page,X) into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1F9
; Address: $C1C1CF
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1F9:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $DB			  ; 25 DB | Logical AND with accumulator (zero page)
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA $E2			  ; A5 E2 | Load from zero page into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1FA
; Address: $C1C1F8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1FA:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $A6DB			; 2D DB A6 | Logical AND with accumulator (absolute)
	ASL $02BF,X		  ; 1E BF 02 | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1FB
; Address: $C1C21E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1FB:
	JSL $080009		  ; 22 09 00 08 | Jump to subroutine long
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1FC
; Address: $C1C232
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1FC:
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1FD
; Address: $C1C245
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1FD:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1FE
; Address: $C1C260
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1FE:
	LDA $C825,Y		  ; B9 25 C8 | Load from absolute,Y into accumulator
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $20			  ; 85 20 | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $85			  ; 30 85 | Branch if negative

;------------------------------------------------------------------------------
; Bank02_DmaFunction_1FF
; Address: $C1C27A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_1FF:
	JSL $C6D420		  ; 22 20 D4 C6 | Jump to subroutine long
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_200
; Address: $C1C2BC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_200:
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA ($E2,X)		  ; A1 E2 | Load from (zero page,X) into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_201
; Address: $C1C2E0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_201:
	JSL $080009		  ; 22 09 00 08 | Jump to subroutine long
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA $E2			  ; A5 E2 | Load from zero page into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_202
; Address: $C1C30C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_202:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $A6DB			; 2D DB A6 | Logical AND with accumulator (absolute)
	ASL $02BF,X		  ; 1E BF 02 | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_203
; Address: $C1C335
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_203:
	JSL $080009		  ; 22 09 00 08 | Jump to subroutine long
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_204
; Address: $C1C349
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_204:
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BNE $30			  ; D0 30 | Branch if not equal
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_205
; Address: $C1C37B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_205:
	BRA $34			  ; 80 34 | Branch always
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	CMP #$F8			 ; C9 F8 | Compare accumulator (immediate)
	BCS $1B			  ; B0 1B | Branch if carry set
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	CMP #$D8			 ; C9 D8 | Compare accumulator (immediate)
	BCS $04			  ; B0 04 | Branch if carry set
	STA $1A			  ; 85 1A | Store accumulator to zero page
	BRA $01			  ; 80 01 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_206
; Address: $C1C3B1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_206:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $C825,Y		  ; B9 25 C8 | Load from absolute,Y into accumulator
	STA $1C			  ; 85 1C | Store accumulator to zero page
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $48			  ; 30 48 | Branch if negative
	LDA $C425,Y		  ; B9 25 C4 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank02_DmaFunction_207
; Address: $C1C3CF
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_207:
	JSL $D42068		  ; 22 68 20 D4 | Jump to subroutine long
	DEC $AD			  ; C6 AD | Decrement (zero page)
	CMP $0A0A,X		  ; DD 0A 0A | Compare accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank02_DmaFunction_208
; Address: $C1C42B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_208:
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C4BB			; 4C BB C4 | Jump to address
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_209
; Address: $C1C44B
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_209:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND ($DB,X)		  ; 21 DB | Logical AND with accumulator ((zero page,X))
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA ($E2,X)		  ; A1 E2 | Load from (zero page,X) into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_20A
; Address: $C1C484
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_20A:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $A6DB			; 2D DB A6 | Logical AND with accumulator (absolute)
	ASL $04BF,X		  ; 1E BF 04 | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_20B
; Address: $C1C497
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_20B:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND ($DB),Y		  ; 31 DB | Logical AND with accumulator ((zero page),Y)
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 04 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA $E2			  ; A5 E2 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_20C
; Address: $C1C4A9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_20C:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_20D
; Address: $C1C4BB
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_20D:
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDA $E2A7,Y		  ; B9 A7 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDA $E2A1,Y		  ; B9 A1 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDA $E2A9,Y		  ; B9 A9 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDA $E2A3,Y		  ; B9 A3 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB2D,X		  ; 9D 2D DB | Store accumulator to absolute,X
	LDA $E2AB,Y		  ; B9 AB E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDA $E2A5,Y		  ; B9 A5 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_20E
; Address: $C1C506
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_20E:
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BNE $30			  ; D0 30 | Branch if not equal
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_20F
; Address: $C1C51F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_20F:
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_210
; Address: $C1C538
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_210:
	BRA $34			  ; 80 34 | Branch always
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	CMP #$F8			 ; C9 F8 | Compare accumulator (immediate)
	BCS $1B			  ; B0 1B | Branch if carry set
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $C625,Y		  ; B9 25 C6 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	CMP #$D8			 ; C9 D8 | Compare accumulator (immediate)
	BCS $04			  ; B0 04 | Branch if carry set
	STA $1A			  ; 85 1A | Store accumulator to zero page
	BRA $01			  ; 80 01 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_211
; Address: $C1C56E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_211:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $C825,Y		  ; B9 25 C8 | Load from absolute,Y into accumulator
	STA $1C			  ; 85 1C | Store accumulator to zero page
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $48			  ; 30 48 | Branch if negative
	LDA $C425,Y		  ; B9 25 C4 | Load from absolute,Y into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA $22			  ; 85 22 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_212
; Address: $C1C591
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_212:
	JSR $C6D4			; 20 D4 C6 | Jump to subroutine
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_213
; Address: $C1C598
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_213:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $DB1F,X		  ; 9D 1F DB | Store accumulator to absolute,X
	STA $DB23,X		  ; 9D 23 DB | Store accumulator to absolute,X
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $DB27,X		  ; 9D 27 DB | Store accumulator to absolute,X
	STA $DB2B,X		  ; 9D 2B DB | Store accumulator to absolute,X
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $DB2F,X		  ; 9D 2F DB | Store accumulator to absolute,X
	STA $DB33,X		  ; 9D 33 DB | Store accumulator to absolute,X
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB20,X		  ; 9D 20 DB | Store accumulator to absolute,X
	STA $DB28,X		  ; 9D 28 DB | Store accumulator to absolute,X
	STA $DB30,X		  ; 9D 30 DB | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $DB24,X		  ; 9D 24 DB | Store accumulator to absolute,X
	STA $DB2C,X		  ; 9D 2C DB | Store accumulator to absolute,X
	STA $DB34,X		  ; 9D 34 DB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C67B			; 4C 7B C6 | Jump to address
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_215
; Address: $C1C60F
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_215:
	AND ($DB,X)		  ; 21 DB | Logical AND with accumulator ((zero page,X))
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA $E2			  ; A5 E2 | Load from zero page into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 02 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_216
; Address: $C1C644
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_216:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND $A6DB			; 2D DB A6 | Logical AND with accumulator (absolute)
	ASL $04BF,X		  ; 1E BF 04 | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	SEP #$05			 ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank02_DmaFunction_217
; Address: $C1C657
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_217:
	JSL $9D26A6		  ; 22 A6 26 9D | Jump to subroutine long
	AND ($DB),Y		  ; 31 DB | Logical AND with accumulator ((zero page),Y)
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF 04 00 7F | Load from absolute long,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	LDA ($E2,X)		  ; A1 E2 | Load from (zero page,X) into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDX $26			  ; A6 26 | Load from zero page into X register
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_218
; Address: $C1C67B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_218:
	STX $26			  ; 86 26 | Store X register to zero page
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDA $E2A7,Y		  ; B9 A7 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB21,X		  ; 9D 21 DB | Store accumulator to absolute,X
	LDA $E2A1,Y		  ; B9 A1 E2 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_219
; Address: $C1C68C
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_219:
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB25,X		  ; 9D 25 DB | Store accumulator to absolute,X
	LDA $E2A9,Y		  ; B9 A9 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB29,X		  ; 9D 29 DB | Store accumulator to absolute,X
	LDA $E2A3,Y		  ; B9 A3 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB2D,X		  ; 9D 2D DB | Store accumulator to absolute,X
	LDA $E2AB,Y		  ; B9 AB E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB31,X		  ; 9D 31 DB | Store accumulator to absolute,X
	LDA $E2A5,Y		  ; B9 A5 E2 | Load from absolute,Y into accumulator
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STA $DB35,X		  ; 9D 35 DB | Store accumulator to absolute,X
	LDA $DD3F			; AD 3F DD | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	STA $DD3F			; 8D 3F DD | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_21A
; Address: $C1C6C6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_21A:
	ROR $1FBD,X		  ; 7E BD 1F | Rotate right (absolute,X)
	LDA				  ; BF B7 BF 21 | Load from absolute long,X into accumulator
	CMP ($32,X)		  ; C1 32 | Compare accumulator ((zero page,X))
	REP #$49			 ; C2 49 | Reset processor status bits
	ASL $C5			  ; 06 C5 | Arithmetic shift left (zero page)
	LDA $CF25,Y		  ; B9 25 CF | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $CFA5,Y		  ; B9 A5 CF | Load from absolute,Y into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $24			  ; 85 24 | Store accumulator to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $24			  ; 65 24 | Add with carry (zero page)
	INC $C0C6			; EE C6 C0 | Increment (absolute)
	STA $24			  ; 85 24 | Store accumulator to zero page
	LDA $D025,Y		  ; B9 25 D0 | Load from absolute,Y into accumulator
	STA $2A			  ; 85 2A | Store accumulator to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_21D
; Address: $C1C6F4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_21D:
	JSR $8001			; 20 01 80 | Jump to subroutine
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_21F
; Address: $C1C704
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_21F:
	JSR $8004			; 20 04 80 | Jump to subroutine
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $A0			  ; 05 A0 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	BRA $07			  ; 80 07 | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	ORA #$60			 ; 09 60 | Logical OR with accumulator (immediate)
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $0A			  ; 80 0A | Branch always
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_220
; Address: $C1C731
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_220:
	JSL $C0267F		  ; 22 7F 26 C0 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $EAC9,X		  ; 9D C9 EA | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	STA $EAE9,X		  ; 9D E9 EA | Store accumulator to absolute,X
	STA $EB09,X		  ; 9D 09 EB | Store accumulator to absolute,X
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	STA $EAEC,X		  ; 9D EC EA | Store accumulator to absolute,X
	STA $EB0C,X		  ; 9D 0C EB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	CMP #$9D			 ; C9 9D | Compare accumulator (immediate)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	STA $EB0A,X		  ; 9D 0A EB | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_222
; Address: $C1C771
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_222:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2B			 ; C0 2B | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_224
; Address: $C1C784
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_224:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2C			 ; C0 2C | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_226
; Address: $C1C797
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_226:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2D			 ; C0 2D | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_228
; Address: $C1C7AA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_228:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_22A
; Address: $C1C7BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_22A:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_22C
; Address: $C1C7D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_22C:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_22E
; Address: $C1C7E3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_22E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_237
; Address: $C1C814
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_237:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C8B3			; 4C B3 C8 | Jump to address
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_238
; Address: $C1C820
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_238:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_239
; Address: $C1C830
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_239:
	STA $001D9A		  ; 8F 9A 1D 00 | Store accumulator to absolute long address
	INY				  ; C8 | Increment Y register
	STA $001D9B		  ; 8F 9B 1D 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_23A
; Address: $C1C83B
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_23A:
	JSL $C01576		  ; 22 76 15 C0 | Jump to subroutine long
	BCC $72			  ; 90 72 | Branch if carry clear
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	STA $EE39			; 8D 39 EE | Store accumulator to absolute address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $EE3C			; 8D 3C EE | Store accumulator to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $EE3D			; 8D 3D EE | Store accumulator to absolute address
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $EE3B			; 8D 3B EE | Store accumulator to absolute address
	STA $EE3E			; 8D 3E EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$39			 ; A0 39 | Load immediate value into Y register
	INC $9222			; EE 22 92 | Increment (absolute)
	ROL $C0			  ; 26 C0 | Rotate left (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ORA $9D			  ; 05 9D | Logical OR with accumulator (zero page)
	CMP #$EA			 ; C9 EA | Compare accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_23B
; Address: $C1C87B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_23B:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	STA $EAEA,X		  ; 9D EA EA | Store accumulator to absolute,X
	LDY #$0D			 ; A0 0D | Load immediate value into Y register
	STA $EB0A,X		  ; 9D 0A EB | Store accumulator to absolute,X
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	STA $EAE9,X		  ; 9D E9 EA | Store accumulator to absolute,X
	STA $EB09,X		  ; 9D 09 EB | Store accumulator to absolute,X
	LDY #$0C			 ; A0 0C | Load immediate value into Y register
	STA $EAEC,X		  ; 9D EC EA | Store accumulator to absolute,X
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	STA $EB0C,X		  ; 9D 0C EB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_23E
; Address: $C1C8BA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_23E:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $4F			  ; 90 4F | Branch if carry clear
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $EAC9,X		  ; 9D C9 EA | Store accumulator to absolute,X
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_240
; Address: $C1C8D0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_240:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	STA $001D9A		  ; 8F 9A 1D 00 | Store accumulator to absolute long address
	INY				  ; C8 | Increment Y register
	STA $001D9B		  ; 8F 9B 1D 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_241
; Address: $C1C8EB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_241:
	JSL $C01576		  ; 22 76 15 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	CMP #$9D			 ; C9 9D | Compare accumulator (immediate)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	STA $EB0A,X		  ; 9D 0A EB | Store accumulator to absolute,X
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	STA $EAE9,X		  ; 9D E9 EA | Store accumulator to absolute,X
	STA $EB09,X		  ; 9D 09 EB | Store accumulator to absolute,X
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	STA $EAEC,X		  ; 9D EC EA | Store accumulator to absolute,X
	STA $EB0C,X		  ; 9D 0C EB | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_242
; Address: $C1C913
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_242:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $EAC9,X		  ; DD C9 EA | Compare accumulator (absolute,X)
	BEQ $0C			  ; F0 0C | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank02_DmaFunction_246
; Address: $C1C92F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_246:
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $EE			  ; D0 EE | Branch if not equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_247
; Address: $C1C94F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_247:
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	INC $1A			  ; E6 1A | Increment (zero page)
	INC $1A			  ; E6 1A | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $EA			  ; D0 EA | Branch if not equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_248
; Address: $C1C973
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_248:
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_249
; Address: $C1C990
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_249:
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $E6			  ; D0 E6 | Branch if not equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_24A
; Address: $C1C99B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_24A:
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA $0001,Y		  ; 99 01 00 | Store accumulator to absolute,Y
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $E6			  ; D0 E6 | Branch if not equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $0000,Y		  ; 99 00 00 | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_24B
; Address: $C1C9C3
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_24B:
	JSL $C0C9FF		  ; 22 FF C9 C0 | Jump to subroutine long
	STZ $EE43			; 9C 43 EE | Store zero to absolute
	STZ $EE45			; 9C 45 EE | Store zero to absolute
	STZ $EB7D			; 9C 7D EB | Store zero to absolute
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $EB29			; 8D 29 EB | Store accumulator to absolute address
	STA $EB7A			; 8D 7A EB | Store accumulator to absolute address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	INC $2A8D			; EE 8D 2A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	STA $EB7B			; 8D 7B EB | Store accumulator to absolute address
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $EB2C,Y		  ; 99 2C EB | Store accumulator to absolute,Y
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	INC $2D99			; EE 99 2D | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $ED			  ; D0 ED | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_24C
; Address: $C1C9FF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_24C:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7FC8			; AD C8 7F | Load from absolute address into accumulator
	STA $EE3F			; 8D 3F EE | Store accumulator to absolute address
	LDA $7FCA			; AD CA 7F | Load from absolute address into accumulator
	STA $EE40			; 8D 40 EE | Store accumulator to absolute address
	LDA $7FCC			; AD CC 7F | Load from absolute address into accumulator
	STA $EE41			; 8D 41 EE | Store accumulator to absolute address
	LDA $7FCE			; AD CE 7F | Load from absolute address into accumulator
	STA $EE42			; 8D 42 EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_24D
; Address: $C1CA1C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_24D:
	JSL $C0CA2C		  ; 22 2C CA C0 | Jump to subroutine long
	LDY #$89			 ; A0 89 | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	INC $2F22			; EE 22 2F | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_24E
; Address: $C1CA2C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_24E:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7F94			; AD 94 7F | Load from absolute address into accumulator
	STA $EE4F			; 8D 4F EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_24F
; Address: $C1CA37
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_24F:
	JSL $C0CA47		  ; 22 47 CA C0 | Jump to subroutine long
	LDY #$E9			 ; A0 E9 | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	INC $2F22			; EE 22 2F | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_250
; Address: $C1CA47
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_250:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7FD0			; AD D0 7F | Load from absolute address into accumulator
	STA $EE55			; 8D 55 EE | Store accumulator to absolute address
	LDA $7FD2			; AD D2 7F | Load from absolute address into accumulator
	STA $EE56			; 8D 56 EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_251
; Address: $C1CA58
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_251:
	JSL $C0CA68		  ; 22 68 CA C0 | Jump to subroutine long
	LDY #$49			 ; A0 49 | Load immediate value into Y register
	CPX $59A9			; EC A9 59 | Compare X register (absolute)
	INC $2F22			; EE 22 2F | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_252
; Address: $C1CA68
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_252:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7FBC			; AD BC 7F | Load from absolute address into accumulator
	STA $EE59			; 8D 59 EE | Store accumulator to absolute address
	LDA $7FBE			; AD BE 7F | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_253
; Address: $C1CA73
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_253:
	STA $EE5A			; 8D 5A EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_254
; Address: $C1CA79
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_254:
	JSL $C0CA99		  ; 22 99 CA C0 | Jump to subroutine long
	LDY #$A9			 ; A0 A9 | Load immediate value into Y register
	CPX $5DA9			; EC A9 5D | Compare X register (absolute)
	INC $2F22			; EE 22 2F | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_255
; Address: $C1CA89
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_255:
	JSL $C0CAA4		  ; 22 A4 CA C0 | Jump to subroutine long
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	SBC $5FA9			; ED A9 5F | Subtract with carry (absolute)
	INC $2F22			; EE 22 2F | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_256
; Address: $C1CA99
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_256:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7FA0			; AD A0 7F | Load from absolute address into accumulator
	STA $EE5D			; 8D 5D EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_257
; Address: $C1CAA4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_257:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7FA8			; AD A8 7F | Load from absolute address into accumulator
	STA $EE5F			; 8D 5F EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_259
; Address: $C1CAB2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_259:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $13			  ; 90 13 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_25A
; Address: $C1CABB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_25A:
	JSL $C0CBF9		  ; 22 F9 CB C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BCC $F5			  ; 90 F5 | Branch if carry clear
	INC $7FE6			; EE E6 7F | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_25B
; Address: $C1CACB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_25B:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7FC0			; AD C0 7F | Load from absolute address into accumulator
	STA $F59D,X		  ; 9D 9D F5 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank02_DmaFunction_25C
; Address: $C1CAD4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_25C:
	JSL $C0CBF9		  ; 22 F9 CB C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	SBC $9DA9			; ED A9 9D | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_25E
; Address: $C1CAE9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_25E:
	INC $7FE6			; EE E6 7F | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_25F
; Address: $C1CAEE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_25F:
	LDA $7FE6			; AD E6 7F | Load from absolute address into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_260
; Address: $C1CAF4
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_260:
	LDA $F565			; AD 65 F5 | Load from absolute address into accumulator
	STA $F59D			; 8D 9D F5 | Store accumulator to absolute address
	LDA $F567			; AD 67 F5 | Load from absolute address into accumulator
	STA $F59F			; 8D 9F F5 | Store accumulator to absolute address
	LDA $F569			; AD 69 F5 | Load from absolute address into accumulator
	STA $F5A1			; 8D A1 F5 | Store accumulator to absolute address
	LDA $F56B			; AD 6B F5 | Load from absolute address into accumulator
	STA $F5A3			; 8D A3 F5 | Store accumulator to absolute address
	LDA $F56D			; AD 6D F5 | Load from absolute address into accumulator
	STA $F5A5			; 8D A5 F5 | Store accumulator to absolute address
	LDA $F56F			; AD 6F F5 | Load from absolute address into accumulator
	STA $F5A7			; 8D A7 F5 | Store accumulator to absolute address
	LDA $F571			; AD 71 F5 | Load from absolute address into accumulator
	STA $F5A9			; 8D A9 F5 | Store accumulator to absolute address
	LDA $F573			; AD 73 F5 | Load from absolute address into accumulator
	STA $F5AB			; 8D AB F5 | Store accumulator to absolute address
	LDA $F575			; AD 75 F5 | Load from absolute address into accumulator
	STA $F5AD			; 8D AD F5 | Store accumulator to absolute address
	LDA $F577			; AD 77 F5 | Load from absolute address into accumulator
	STA $F5AF			; 8D AF F5 | Store accumulator to absolute address
	LDA $F579			; AD 79 F5 | Load from absolute address into accumulator
	STA $F5B1			; 8D B1 F5 | Store accumulator to absolute address
	LDA $F57B			; AD 7B F5 | Load from absolute address into accumulator
	STA $F5B3			; 8D B3 F5 | Store accumulator to absolute address
	LDA $F57D			; AD 7D F5 | Load from absolute address into accumulator
	STA $F5B5			; 8D B5 F5 | Store accumulator to absolute address
	LDA $F57F			; AD 7F F5 | Load from absolute address into accumulator
	STA $F5B7			; 8D B7 F5 | Store accumulator to absolute address
	LDA $F581			; AD 81 F5 | Load from absolute address into accumulator
	STA $F5B9			; 8D B9 F5 | Store accumulator to absolute address
	LDA $F583			; AD 83 F5 | Load from absolute address into accumulator
	STA $F5BB			; 8D BB F5 | Store accumulator to absolute address
	LDA $F585			; AD 85 F5 | Load from absolute address into accumulator
	STA $F5BD			; 8D BD F5 | Store accumulator to absolute address
	LDA $F587			; AD 87 F5 | Load from absolute address into accumulator
	STA $F5BF			; 8D BF F5 | Store accumulator to absolute address
	LDA $F589			; AD 89 F5 | Load from absolute address into accumulator
	STA $F5C1			; 8D C1 F5 | Store accumulator to absolute address
	LDA $F58B			; AD 8B F5 | Load from absolute address into accumulator
	STA $F5C3			; 8D C3 F5 | Store accumulator to absolute address
	LDA $F58D			; AD 8D F5 | Load from absolute address into accumulator
	STA $F5C5			; 8D C5 F5 | Store accumulator to absolute address
	LDA $F58F			; AD 8F F5 | Load from absolute address into accumulator
	STA $F5C7			; 8D C7 F5 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_261
; Address: $C1CB78
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_261:
	LDA $F591			; AD 91 F5 | Load from absolute address into accumulator
	STA $F5C9			; 8D C9 F5 | Store accumulator to absolute address
	LDA $F593			; AD 93 F5 | Load from absolute address into accumulator
	STA $F5CB			; 8D CB F5 | Store accumulator to absolute address
	LDA $F595			; AD 95 F5 | Load from absolute address into accumulator
	STA $F5CD			; 8D CD F5 | Store accumulator to absolute address
	LDA $F597			; AD 97 F5 | Load from absolute address into accumulator
	STA $F5CF			; 8D CF F5 | Store accumulator to absolute address
	LDA $F599			; AD 99 F5 | Load from absolute address into accumulator
	STA $F5D1			; 8D D1 F5 | Store accumulator to absolute address
	LDA $F59B			; AD 9B F5 | Load from absolute address into accumulator
	STA $F5D3			; 8D D3 F5 | Store accumulator to absolute address
	STZ $7FE6			; 9C E6 7F | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_262
; Address: $C1CBA0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_262:
	JSR $CBE3			; 20 E3 CB | Jump to subroutine
	BCC $3D			  ; 90 3D | Branch if carry clear
	LDA #$06			 ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_264
; Address: $C1CBAF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_264:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_265
; Address: $C1CBC1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_265:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0B			 ; C0 0B | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_266
; Address: $C1CBD3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_266:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_267
; Address: $C1CBE3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_267:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F565,X		  ; BD 65 F5 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_269
; Address: $C1CBF9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_269:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_26A
; Address: $C1CC00
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_26A:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BNE $13			  ; D0 13 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $9848			; 8D 48 98 | Store accumulator to absolute address
	STZ $9846			; 9C 46 98 | Store zero to absolute
	BRA $1C			  ; 80 1C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9848			; 8D 48 98 | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BNE $F3			  ; D0 F3 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	STA $9846			; 8D 46 98 | Store accumulator to absolute address
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $9846			; AD 46 98 | Load from absolute address into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $9848			; AD 48 98 | Load from absolute address into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $F565,X		  ; 9D 65 F5 | Store accumulator to absolute,X
	LDA $B475			; AD 75 B4 | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	LDA $B473			; AD 73 B4 | Load from absolute address into accumulator
	STA $984A			; 8D 4A 98 | Store accumulator to absolute address
	LDA $7FBA			; AD BA 7F | Load from absolute address into accumulator
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	LSR $984A			; 4E 4A 98 | Logical shift right (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_26B
; Address: $C1CC67
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_26B:
	LSR $984A			; 4E 4A 98 | Logical shift right (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Store accumulator to absolute address
	LDA $7FBC			; AD BC 7F | Load from absolute address into accumulator
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	LSR $984A			; 4E 4A 98 | Logical shift right (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	LSR $984A			; 4E 4A 98 | Logical shift right (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Store accumulator to absolute address
	LDA $7FBE			; AD BE 7F | Load from absolute address into accumulator
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_26C
; Address: $C1CC9B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_26C:
	JSL $C0CCAA		  ; 22 AA CC C0 | Jump to subroutine long
	LDY #$89			 ; A0 89 | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	INC $2F22			; EE 22 2F | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_26D
; Address: $C1CCAA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_26D:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7F8C			; AD 8C 7F | Load from absolute address into accumulator
	STA $EE4B			; 8D 4B EE | Store accumulator to absolute address
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	STA $EE50			; 8D 50 EE | Store accumulator to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_26E
; Address: $C1CCBA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_26E:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7FAE			; AD AE 7F | Load from absolute address into accumulator
	STA $F025,X		  ; 9D 25 F0 | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDY #$E9			 ; A0 E9 | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_270
; Address: $C1CCD9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_270:
	LDA $7FB0			; AD B0 7F | Load from absolute address into accumulator
	STA $F1E5,X		  ; 9D E5 F1 | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDY #$49			 ; A0 49 | Load immediate value into Y register
	CPX $E5A9			; EC A9 E5 | Compare X register (absolute)
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_271
; Address: $C1CCF2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_271:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7FB2			; AD B2 7F | Load from absolute address into accumulator
	STA $F3A5,X		  ; 9D A5 F3 | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDY #$A9			 ; A0 A9 | Load immediate value into Y register
	CPX $A5A9			; EC A9 A5 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_272
; Address: $C1CD08
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_272:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_273
; Address: $C1CD0E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_273:
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	SBC $25A9			; ED A9 25 | Subtract with carry (absolute)
	BEQ $22			  ; F0 22 | Branch if equal
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_274
; Address: $C1CD1A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_274:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7FD4			; AD D4 7F | Load from absolute address into accumulator
	STA $EE65,X		  ; 9D 65 EE | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDY #$69			 ; A0 69 | Load immediate value into Y register
	SBC $65A9			; ED A9 65 | Subtract with carry (absolute)
	INC $9B22			; EE 22 9B | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_276
; Address: $C1CD39
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_276:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_278
; Address: $C1CD47
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_278:
	STA $EE65,X		  ; 9D 65 EE | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	SBC $65A9			; ED A9 65 | Subtract with carry (absolute)
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_27B
; Address: $C1CD65
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_27B:
	STA $001D9A		  ; 8F 9A 1D 00 | Store accumulator to absolute long address
	INY				  ; C8 | Increment Y register
	STA $001D9B		  ; 8F 9B 1D 00 | Store accumulator to absolute long address
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $559C,X		  ; 1D 9C 55 | Logical OR with accumulator (absolute,X)
	LDA $7E3500		  ; AF 00 35 7E | Load from absolute long address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $7F70			; AD 70 7F | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	INC $C355			; EE 55 C3 | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_27C
; Address: $C1CD8B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_27C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $C6A5			; AD A5 C6 | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C35F			; 8D 5F C3 | Store accumulator to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C5E5			; AD E5 C5 | Load from absolute address into accumulator
	STA $C367			; 8D 67 C3 | Store accumulator to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	SBC $9A0F,X		  ; FD 0F 9A | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_27D
; Address: $C1CDAF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_27D:
	STA $C361			; 8D 61 C3 | Store accumulator to absolute address
	LDA $C625			; AD 25 C6 | Load from absolute address into accumulator
	STA $C369			; 8D 69 C3 | Store accumulator to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	SBC $9A17,X		  ; FD 17 9A | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $C363			; 8D 63 C3 | Store accumulator to absolute address
	LDA $C7A5			; AD A5 C7 | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C365			; 8D 65 C3 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_280
; Address: $C1CDD4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_280:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_283
; Address: $C1CDE9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_283:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $C1C3			; 8D C3 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_284
; Address: $C1CDF4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_284:
	LDA $C1CB			; AD CB C1 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $C1C9			; 6D C9 C1 | Add with carry (absolute)
	CMP #$68			 ; C9 68 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C1C9			; 8D C9 C1 | Store accumulator to absolute address
	LDA $C1C3			; AD C3 C1 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_289
; Address: $C1CE33
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_289:
	LDA $C1C7			; AD C7 C1 | Load from absolute address into accumulator
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCS $03			  ; B0 03 | Branch if carry set
	INC $C1C7			; EE C7 C1 | Increment (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_28A
; Address: $C1CE3F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_28A:
	LDA $C1C7			; AD C7 C1 | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	DEC $C1C7			; CE C7 C1 | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_28B
; Address: $C1CE48
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_28B:
	LDA $C1C7			; AD C7 C1 | Load from absolute address into accumulator
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	DEC $C1C7			; CE C7 C1 | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_28D
; Address: $C1CE58
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_28D:
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $CFA5,Y		  ; B9 A5 CF | Load from absolute,Y into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $C1C5			; 8D C5 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_28F
; Address: $C1CE69
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_28F:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_290
; Address: $C1CE71
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_290:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C1B5			; 8D B5 C1 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C1B9			; 8D B9 C1 | Store accumulator to absolute address
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	STA $C1B7			; 8D B7 C1 | Store accumulator to absolute address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	STA $C1BB			; 8D BB C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_291
; Address: $C1CE89
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_291:
	JSR $CEDB			; 20 DB CE | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDA $8DC1,X		  ; BD C1 8D | Load from absolute,X into accumulator
	LDA				  ; BF C1 9C C1 | Load from absolute long,X into accumulator
	CMP ($A0,X)		  ; C1 A0 | Compare accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_292
; Address: $C1CE9B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_292:
	LDA #$65			 ; A9 65 | Load immediate value into accumulator
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_293
; Address: $C1CEA4
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_293:
	LDA $C1C1			; AD C1 C1 | Load from absolute address into accumulator
	CMP #$1D			 ; C9 1D | Compare accumulator (immediate)
	BCS $2A			  ; B0 2A | Branch if carry set
	LDA $C1B5			; AD B5 C1 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $C1BD			; 6D BD C1 | Add with carry (absolute)
	STA $C1B5			; 8D B5 C1 | Store accumulator to absolute address
	LDA $C1B9			; AD B9 C1 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $C1BF			; 6D BF C1 | Add with carry (absolute)
	STA $C1B9			; 8D B9 C1 | Store accumulator to absolute address
	LDA $C1BD			; AD BD C1 | Load from absolute address into accumulator
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $C1BD			; 8D BD C1 | Store accumulator to absolute address
	LDA $C1BF			; AD BF C1 | Load from absolute address into accumulator
	ADC #$28			 ; 69 28 | Add with carry (immediate)
	STA $C1BF			; 8D BF C1 | Store accumulator to absolute address
	INC $C1C1			; EE C1 C1 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_295
; Address: $C1CEDB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_295:
	LDA $C1B7			; AD B7 C1 | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7FC0			; AD C0 7F | Load from absolute address into accumulator
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	STA $EE65,X		  ; 9D 65 EE | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $F5			  ; 80 F5 | Branch always

;------------------------------------------------------------------------------
; Bank02_DmaFunction_296
; Address: $C1CEF2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_296:
	JSR $CF05			; 20 05 CF | Jump to subroutine
	LDA $7FC0			; AD C0 7F | Load from absolute address into accumulator
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	STA $EE65,X		  ; 9D 65 EE | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $F4			  ; 80 F4 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_297
; Address: $C1CF05
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_297:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $C1B6			; AD B6 C1 | Load from absolute address into accumulator
	STA $20			  ; 85 20 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank02_DmaFunction_298
; Address: $C1CF0C
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_298:
	SEC				  ; 38 | Set carry flag
	SBC $C1BA			; ED BA C1 | Subtract with carry (absolute)
	INC				  ; 1A | Increment accumulator
	STA $22			  ; 85 22 | Store accumulator to zero page
	LDA $C1BB			; AD BB C1 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $C1B7			; ED B7 C1 | Subtract with carry (absolute)
	INC				  ; 1A | Increment accumulator
	STA $24			  ; 85 24 | Store accumulator to zero page
	STA $26			  ; 85 26 | Store accumulator to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $26			  ; A5 26 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $22			  ; E5 22 | Subtract with carry (zero page)
	BCS $0A			  ; B0 0A | Branch if carry set
	DEC $20			  ; C6 20 | Decrement (zero page)
	LDA $26			  ; A5 26 | Load from zero page into accumulator
	ADC $24			  ; 65 24 | Add with carry (zero page)
	STA $26			  ; 85 26 | Store accumulator to zero page
	BRA $EF			  ; 80 EF | Branch always
	STA $26			  ; 85 26 | Store accumulator to zero page
	LDA $20			  ; A5 20 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	BCC $02			  ; 90 02 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $EE66,X		  ; 9D 66 EE | Store accumulator to absolute,X
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $20			  ; E5 20 | Subtract with carry (zero page)
	BCS $02			  ; B0 02 | Branch if carry set
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $EE65,X		  ; 9D 65 EE | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $D0			  ; D0 D0 | Branch if not equal
	REP #$20			 ; C2 20 | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_29A
; Address: $C1CF56
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_29A:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_29D
; Address: $C1CF65
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_29D:
	JSL $C0CF70		  ; 22 70 CF C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A0
; Address: $C1CF70
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A0:
	LDA $C1AF			; AD AF C1 | Load from absolute address into accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $7FA8			; AC A8 7F | Load from absolute address into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($D4),Y		  ; 11 D4 | Logical OR with accumulator ((zero page),Y)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	LDA $F3			  ; A5 F3 | Load from zero page into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	LDA #$F3			 ; A9 F3 | Load immediate value into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	PLB				  ; AB | Pull data bank register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	ORA $C0D4,Y		  ; 19 D4 C0 | Logical OR with accumulator (absolute,Y)
	STA $F3AD			; 8D AD F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	LDA $3898F3		  ; AF F3 98 38 | Load from absolute long address into accumulator
	ORA $C0D4,X		  ; 1D D4 C0 | Logical OR with accumulator (absolute,X)
	STA $F3B1			; 8D B1 F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	AND ($D4,X)		  ; 21 D4 | Logical AND with accumulator ((zero page,X))
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	AND $D4			  ; 25 D4 | Logical AND with accumulator (zero page)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	LDA $98F3,Y		  ; B9 F3 98 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A1
; Address: $C1CFE7
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A1:
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	AND #$D4			 ; 29 D4 | Logical AND with accumulator (immediate)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	LDA $98F3,X		  ; BD F3 98 | Load from absolute,X into accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	LDA				  ; BF F3 98 38 | Load from absolute long,X into accumulator
	AND $C0D4			; 2D D4 C0 | Logical AND with accumulator (absolute)
	STA $F3C1			; 8D C1 F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	AND ($D4),Y		  ; 31 D4 | Logical AND with accumulator ((zero page),Y)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	CMP $F3			  ; C5 F3 | Compare accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	CMP #$F3			 ; C9 F3 | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	AND $C0D4,Y		  ; 39 D4 C0 | Logical AND with accumulator (absolute,Y)
	STA $F3CD			; 8D CD F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	AND $C0D4,X		  ; 3D D4 C0 | Logical AND with accumulator (absolute,X)
	STA $F3D1			; 8D D1 F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	EOR ($D4,X)		  ; 41 D4 | Exclusive OR with accumulator ((zero page,X))
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A2
; Address: $C1D066
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A2:
	SEC				  ; 38 | Set carry flag
	EOR $D4			  ; 45 D4 | Exclusive OR with accumulator (zero page)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	CMP $98F3,Y		  ; D9 F3 98 | Compare accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	EOR #$D4			 ; 49 D4 | Exclusive OR with accumulator (immediate)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	CMP $98F3,X		  ; DD F3 98 | Compare accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	EOR $C0D4			; 4D D4 C0 | Exclusive OR with accumulator (absolute)
	STA $F3E1			; 8D E1 F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	EOR ($D4),Y		  ; 51 D4 | Exclusive OR with accumulator ((zero page),Y)
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	SBC $F3			  ; E5 F3 | Subtract with carry (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	SBC #$F3			 ; E9 F3 | Subtract with carry (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	EOR $C0D4,Y		  ; 59 D4 C0 | Exclusive OR with accumulator (absolute,Y)
	STA $F3ED			; 8D ED F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	EOR $C0D4,X		  ; 5D D4 C0 | Exclusive OR with accumulator (absolute,X)
	STA $F3F1			; 8D F1 F3 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A4
; Address: $C1D0E8
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A4:
	LDA $7FE37A		  ; AF 7A E3 7F | Load from absolute long address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$88			 ; A2 88 | Load immediate value into X register
	LDA $C039			; AD 39 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED09			; 8E 09 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED0A			; 8D 0A ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C03B			; AD 3B C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED0C			; 8E 0C ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED0D			; 8D 0D ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C03D			; AD 3D C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED0F			; 8E 0F ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED10			; 8D 10 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C03F			; AD 3F C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED12			; 8E 12 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED13			; 8D 13 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A5
; Address: $C1D14F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A5:
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C041			; AD 41 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED15			; 8E 15 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED16			; 8D 16 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C043			; AD 43 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED18			; 8E 18 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED19			; 8D 19 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C045			; AD 45 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED1B			; 8E 1B ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED1C			; 8D 1C ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C047			; AD 47 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED1E			; 8E 1E ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED1F			; 8D 1F ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A6
; Address: $C1D1B7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A6:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C049			; AD 49 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED21			; 8E 21 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED22			; 8D 22 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C04B			; AD 4B C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED24			; 8E 24 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED25			; 8D 25 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C04D			; AD 4D C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED27			; 8E 27 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED28			; 8D 28 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C04F			; AD 4F C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED2A			; 8E 2A ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED2B			; 8D 2B ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C051			; AD 51 C0 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A7
; Address: $C1D21F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A7:
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED2D			; 8E 2D ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED2E			; 8D 2E ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C053			; AD 53 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED30			; 8E 30 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED31			; 8D 31 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C055			; AD 55 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED33			; 8E 33 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED34			; 8D 34 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C057			; AD 57 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED36			; 8E 36 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED37			; 8D 37 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C059			; AD 59 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED39			; 8E 39 ED | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A8
; Address: $C1D288
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A8:
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED3A			; 8D 3A ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C05B			; AD 5B C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED3C			; 8E 3C ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED3D			; 8D 3D ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C05D			; AD 5D C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED3F			; 8E 3F ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED40			; 8D 40 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C05F			; AD 5F C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED42			; 8E 42 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED43			; 8D 43 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C061			; AD 61 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED45			; 8E 45 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2A9
; Address: $C1D2F0
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2A9:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED46			; 8D 46 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C063			; AD 63 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED48			; 8E 48 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED49			; 8D 49 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C065			; AD 65 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED4B			; 8E 4B ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED4C			; 8D 4C ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C067			; AD 67 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED4E			; 8E 4E ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED4F			; 8D 4F ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C069			; AD 69 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED51			; 8E 51 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2AA
; Address: $C1D358
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2AA:
	STA $ED52			; 8D 52 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C06B			; AD 6B C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED54			; 8E 54 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED55			; 8D 55 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C06D			; AD 6D C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED57			; 8E 57 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED58			; 8D 58 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C06F			; AD 6F C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED5A			; 8E 5A ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED5B			; 8D 5B ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C071			; AD 71 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED5D			; 8E 5D ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED5E			; 8D 5E ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2AB
; Address: $C1D3C0
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2AB:
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C073			; AD 73 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED60			; 8E 60 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED61			; 8D 61 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C075			; AD 75 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED63			; 8E 63 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED64			; 8D 64 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C077			; AD 77 C0 | Load from absolute address into accumulator
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED66			; 8E 66 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED67			; 8D 67 ED | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2AC
; Address: $C1D415
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2AC:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2AD
; Address: $C1D457
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2AD:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $C1C7			; AD C7 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2AE
; Address: $C1D4AA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2AE:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $C1C7			; AD C7 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2AF
; Address: $C1D4C3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2AF:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B0
; Address: $C1D4D1
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B0:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	LDA $C1C7			; AD C7 C1 | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C1CD			; 8D CD C1 | Store accumulator to absolute address
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $C1CF			; 8D CF C1 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $352C			; AD 2C 35 | Load from absolute address into accumulator
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BCC $1F			  ; 90 1F | Branch if carry clear
	INX				  ; E8 | Increment X register
	CMP #$50			 ; C9 50 | Compare accumulator (immediate)
	BCC $19			  ; 90 19 | Branch if carry clear
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B1
; Address: $C1D4FD
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B1:
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $13			  ; 90 13 | Branch if carry clear
	INX				  ; E8 | Increment X register
	CMP #$90			 ; C9 90 | Compare accumulator (immediate)
	BCC $0D			  ; 90 0D | Branch if carry clear
	INX				  ; E8 | Increment X register
	CMP #$B0			 ; C9 B0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	INX				  ; E8 | Increment X register
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	LDA				  ; BF 22 D5 C0 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $22			  ; 85 22 | Store accumulator to zero page
	JMP $D529			; 4C 29 D5 | Jump to address
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $A6			  ; 80 A6 | Branch always
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B3
; Address: $C1D530
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B3:
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF025		  ; 8F 25 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE65		  ; 8F 65 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF027		  ; 8F 27 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE66		  ; 8F 66 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B4
; Address: $C1D56E
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B4:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF029		  ; 8F 29 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE67		  ; 8F 67 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF02B		  ; 8F 2B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE68		  ; 8F 68 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF02D		  ; 8F 2D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE69		  ; 8F 69 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF02F		  ; 8F 2F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE6A		  ; 8F 6A EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF031		  ; 8F 31 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE6B		  ; 8F 6B EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B5
; Address: $C1D5F0
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B5:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF033		  ; 8F 33 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE6C		  ; 8F 6C EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF035		  ; 8F 35 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE6D		  ; 8F 6D EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF037		  ; 8F 37 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE6E		  ; 8F 6E EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF039		  ; 8F 39 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE6F		  ; 8F 6F EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF03B		  ; 8F 3B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE70		  ; 8F 70 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B6
; Address: $C1D672
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B6:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF03D		  ; 8F 3D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE71		  ; 8F 71 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF03F		  ; 8F 3F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE72		  ; 8F 72 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF041		  ; 8F 41 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE73		  ; 8F 73 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF043		  ; 8F 43 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE74		  ; 8F 74 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF045		  ; 8F 45 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE75		  ; 8F 75 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B7
; Address: $C1D6F4
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B7:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF047		  ; 8F 47 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE76		  ; 8F 76 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF049		  ; 8F 49 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE77		  ; 8F 77 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF04B		  ; 8F 4B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE78		  ; 8F 78 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF04D		  ; 8F 4D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE79		  ; 8F 79 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF04F		  ; 8F 4F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE7A		  ; 8F 7A EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B8
; Address: $C1D776
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B8:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF051		  ; 8F 51 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE7B		  ; 8F 7B EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF053		  ; 8F 53 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE7C		  ; 8F 7C EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF055		  ; 8F 55 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE7D		  ; 8F 7D EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF057		  ; 8F 57 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE7E		  ; 8F 7E EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF059		  ; 8F 59 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE7F		  ; 8F 7F EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2B9
; Address: $C1D7F8
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2B9:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF05B		  ; 8F 5B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE80		  ; 8F 80 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF05D		  ; 8F 5D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE81		  ; 8F 81 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF05F		  ; 8F 5F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE82		  ; 8F 82 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF061		  ; 8F 61 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE83		  ; 8F 83 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF063		  ; 8F 63 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE84		  ; 8F 84 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2BA
; Address: $C1D87A
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2BA:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF065		  ; 8F 65 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE85		  ; 8F 85 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF067		  ; 8F 67 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE86		  ; 8F 86 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF069		  ; 8F 69 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE87		  ; 8F 87 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF06B		  ; 8F 6B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE88		  ; 8F 88 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF06D		  ; 8F 6D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE89		  ; 8F 89 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2BB
; Address: $C1D8FC
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2BB:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF06F		  ; 8F 6F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE8A		  ; 8F 8A EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF071		  ; 8F 71 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE8B		  ; 8F 8B EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF073		  ; 8F 73 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE8C		  ; 8F 8C EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF075		  ; 8F 75 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE8D		  ; 8F 8D EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF077		  ; 8F 77 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE8E		  ; 8F 8E EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2BC
; Address: $C1D97E
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2BC:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF079		  ; 8F 79 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE8F		  ; 8F 8F EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF07B		  ; 8F 7B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE90		  ; 8F 90 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF07D		  ; 8F 7D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE91		  ; 8F 91 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF07F		  ; 8F 7F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE92		  ; 8F 92 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF081		  ; 8F 81 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE93		  ; 8F 93 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2BD
; Address: $C1DA00
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2BD:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF083		  ; 8F 83 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE94		  ; 8F 94 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF085		  ; 8F 85 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE95		  ; 8F 95 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF087		  ; 8F 87 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE96		  ; 8F 96 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF089		  ; 8F 89 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE97		  ; 8F 97 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF08B		  ; 8F 8B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE98		  ; 8F 98 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2BE
; Address: $C1DA82
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2BE:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF08D		  ; 8F 8D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE99		  ; 8F 99 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF08F		  ; 8F 8F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE9A		  ; 8F 9A EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF091		  ; 8F 91 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE9B		  ; 8F 9B EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF093		  ; 8F 93 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE9C		  ; 8F 9C EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF095		  ; 8F 95 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE9D		  ; 8F 9D EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2BF
; Address: $C1DB04
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2BF:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF097		  ; 8F 97 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE9E		  ; 8F 9E EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF099		  ; 8F 99 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEE9F		  ; 8F 9F EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF09B		  ; 8F 9B F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA0		  ; 8F A0 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF09D		  ; 8F 9D F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA1		  ; 8F A1 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF09F		  ; 8F 9F F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA2		  ; 8F A2 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C0
; Address: $C1DB86
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C0:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0A1		  ; 8F A1 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA3		  ; 8F A3 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0A3		  ; 8F A3 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA4		  ; 8F A4 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0A5		  ; 8F A5 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA5		  ; 8F A5 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0A7		  ; 8F A7 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA6		  ; 8F A6 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0A9		  ; 8F A9 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA7		  ; 8F A7 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C1
; Address: $C1DC08
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C1:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0AB		  ; 8F AB F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA8		  ; 8F A8 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0AD		  ; 8F AD F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEA9		  ; 8F A9 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0AF		  ; 8F AF F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEAA		  ; 8F AA EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0B1		  ; 8F B1 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEAB		  ; 8F AB EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0B3		  ; 8F B3 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEAC		  ; 8F AC EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C2
; Address: $C1DC8A
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C2:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0B5		  ; 8F B5 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEAD		  ; 8F AD EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0B7		  ; 8F B7 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEAE		  ; 8F AE EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0B9		  ; 8F B9 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEAF		  ; 8F AF EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0BB		  ; 8F BB F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB0		  ; 8F B0 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0BD		  ; 8F BD F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB1		  ; 8F B1 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C3
; Address: $C1DD0C
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C3:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0BF		  ; 8F BF F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB2		  ; 8F B2 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0C1		  ; 8F C1 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB3		  ; 8F B3 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0C3		  ; 8F C3 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB4		  ; 8F B4 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0C5		  ; 8F C5 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB5		  ; 8F B5 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0C7		  ; 8F C7 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB6		  ; 8F B6 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C4
; Address: $C1DD8E
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C4:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0C9		  ; 8F C9 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB7		  ; 8F B7 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0CB		  ; 8F CB F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB8		  ; 8F B8 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0CD		  ; 8F CD F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEB9		  ; 8F B9 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0CF		  ; 8F CF F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEBA		  ; 8F BA EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0D1		  ; 8F D1 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEBB		  ; 8F BB EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C5
; Address: $C1DE10
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C5:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0D3		  ; 8F D3 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEBC		  ; 8F BC EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0D5		  ; 8F D5 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEBD		  ; 8F BD EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0D7		  ; 8F D7 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEBE		  ; 8F BE EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0D9		  ; 8F D9 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEBF		  ; 8F BF EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0DB		  ; 8F DB F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC0		  ; 8F C0 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C6
; Address: $C1DE92
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C6:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0DD		  ; 8F DD F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC1		  ; 8F C1 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0DF		  ; 8F DF F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC2		  ; 8F C2 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0E1		  ; 8F E1 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC3		  ; 8F C3 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0E3		  ; 8F E3 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC4		  ; 8F C4 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0E5		  ; 8F E5 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC5		  ; 8F C5 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C7
; Address: $C1DF14
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C7:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0E7		  ; 8F E7 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC6		  ; 8F C6 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0E9		  ; 8F E9 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC7		  ; 8F C7 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0EB		  ; 8F EB F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC8		  ; 8F C8 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0ED		  ; 8F ED F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEC9		  ; 8F C9 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0EF		  ; 8F EF F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEECA		  ; 8F CA EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C8
; Address: $C1DF96
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C8:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0F1		  ; 8F F1 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEECB		  ; 8F CB EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0F3		  ; 8F F3 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEECC		  ; 8F CC EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0F5		  ; 8F F5 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEECD		  ; 8F CD EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0F7		  ; 8F F7 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEECE		  ; 8F CE EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0F9		  ; 8F F9 F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEECF		  ; 8F CF EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2C9
; Address: $C1E018
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2C9:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0FB		  ; 8F FB F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED0		  ; 8F D0 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0FD		  ; 8F FD F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED1		  ; 8F D1 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF0FF		  ; 8F FF F0 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED2		  ; 8F D2 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF101		  ; 8F 01 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED3		  ; 8F D3 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF103		  ; 8F 03 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED4		  ; 8F D4 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2CA
; Address: $C1E09A
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2CA:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF105		  ; 8F 05 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED5		  ; 8F D5 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF107		  ; 8F 07 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED6		  ; 8F D6 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF109		  ; 8F 09 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED7		  ; 8F D7 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF10B		  ; 8F 0B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED8		  ; 8F D8 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF10D		  ; 8F 0D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEED9		  ; 8F D9 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2CB
; Address: $C1E11C
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2CB:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF10F		  ; 8F 0F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEDA		  ; 8F DA EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF111		  ; 8F 11 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEDB		  ; 8F DB EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF113		  ; 8F 13 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEDC		  ; 8F DC EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF115		  ; 8F 15 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEDD		  ; 8F DD EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF117		  ; 8F 17 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEDE		  ; 8F DE EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2CC
; Address: $C1E19E
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2CC:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF119		  ; 8F 19 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEDF		  ; 8F DF EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF11B		  ; 8F 1B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE0		  ; 8F E0 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF11D		  ; 8F 1D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE1		  ; 8F E1 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF11F		  ; 8F 1F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE2		  ; 8F E2 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF121		  ; 8F 21 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE3		  ; 8F E3 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2CD
; Address: $C1E220
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2CD:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF123		  ; 8F 23 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE4		  ; 8F E4 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF125		  ; 8F 25 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE5		  ; 8F E5 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF127		  ; 8F 27 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE6		  ; 8F E6 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF129		  ; 8F 29 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE7		  ; 8F E7 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF12B		  ; 8F 2B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE8		  ; 8F E8 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2CE
; Address: $C1E2A2
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2CE:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF12D		  ; 8F 2D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEE9		  ; 8F E9 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF12F		  ; 8F 2F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEEA		  ; 8F EA EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF131		  ; 8F 31 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEEB		  ; 8F EB EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF133		  ; 8F 33 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEEC		  ; 8F EC EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF135		  ; 8F 35 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEED		  ; 8F ED EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2CF
; Address: $C1E324
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2CF:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF137		  ; 8F 37 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEEE		  ; 8F EE EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF139		  ; 8F 39 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEEF		  ; 8F EF EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF13B		  ; 8F 3B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF0		  ; 8F F0 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF13D		  ; 8F 3D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF1		  ; 8F F1 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF13F		  ; 8F 3F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF2		  ; 8F F2 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D0
; Address: $C1E3A6
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D0:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF141		  ; 8F 41 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF3		  ; 8F F3 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF143		  ; 8F 43 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF4		  ; 8F F4 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF145		  ; 8F 45 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF5		  ; 8F F5 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF147		  ; 8F 47 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF6		  ; 8F F6 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF149		  ; 8F 49 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF7		  ; 8F F7 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D1
; Address: $C1E428
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D1:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF14B		  ; 8F 4B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF8		  ; 8F F8 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF14D		  ; 8F 4D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEF9		  ; 8F F9 EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF14F		  ; 8F 4F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEFA		  ; 8F FA EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF151		  ; 8F 51 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEFB		  ; 8F FB EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF153		  ; 8F 53 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEFC		  ; 8F FC EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D2
; Address: $C1E4AA
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D2:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF155		  ; 8F 55 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEFD		  ; 8F FD EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF157		  ; 8F 57 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEFE		  ; 8F FE EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF159		  ; 8F 59 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEEFF		  ; 8F FF EE 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF15B		  ; 8F 5B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF00		  ; 8F 00 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF15D		  ; 8F 5D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF01		  ; 8F 01 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D3
; Address: $C1E52C
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D3:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF15F		  ; 8F 5F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF02		  ; 8F 02 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF161		  ; 8F 61 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF03		  ; 8F 03 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF163		  ; 8F 63 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF04		  ; 8F 04 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF165		  ; 8F 65 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF05		  ; 8F 05 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF167		  ; 8F 67 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF06		  ; 8F 06 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D4
; Address: $C1E5AE
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D4:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF169		  ; 8F 69 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF07		  ; 8F 07 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF16B		  ; 8F 6B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF08		  ; 8F 08 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF16D		  ; 8F 6D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF09		  ; 8F 09 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF16F		  ; 8F 6F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF0A		  ; 8F 0A EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF171		  ; 8F 71 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF0B		  ; 8F 0B EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D5
; Address: $C1E630
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D5:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF173		  ; 8F 73 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF0C		  ; 8F 0C EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF175		  ; 8F 75 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF0D		  ; 8F 0D EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF177		  ; 8F 77 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF0E		  ; 8F 0E EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF179		  ; 8F 79 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF0F		  ; 8F 0F EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF17B		  ; 8F 7B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF10		  ; 8F 10 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D6
; Address: $C1E6B2
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D6:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF17D		  ; 8F 7D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF11		  ; 8F 11 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF17F		  ; 8F 7F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF12		  ; 8F 12 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF181		  ; 8F 81 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF13		  ; 8F 13 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF183		  ; 8F 83 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF14		  ; 8F 14 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF185		  ; 8F 85 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF15		  ; 8F 15 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D7
; Address: $C1E734
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D7:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF187		  ; 8F 87 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF16		  ; 8F 16 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF189		  ; 8F 89 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF17		  ; 8F 17 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF18B		  ; 8F 8B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF18		  ; 8F 18 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF18D		  ; 8F 8D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF19		  ; 8F 19 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF18F		  ; 8F 8F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF1A		  ; 8F 1A EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D8
; Address: $C1E7B6
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D8:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF191		  ; 8F 91 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF1B		  ; 8F 1B EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF193		  ; 8F 93 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF1C		  ; 8F 1C EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF195		  ; 8F 95 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF1D		  ; 8F 1D EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF197		  ; 8F 97 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF1E		  ; 8F 1E EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF199		  ; 8F 99 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF1F		  ; 8F 1F EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2D9
; Address: $C1E838
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2D9:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF19B		  ; 8F 9B F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF20		  ; 8F 20 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF19D		  ; 8F 9D F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF21		  ; 8F 21 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF19F		  ; 8F 9F F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF22		  ; 8F 22 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1A1		  ; 8F A1 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF23		  ; 8F 23 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1A3		  ; 8F A3 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF24		  ; 8F 24 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2DA
; Address: $C1E8BA
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2DA:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1A5		  ; 8F A5 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF25		  ; 8F 25 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1A7		  ; 8F A7 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF26		  ; 8F 26 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1A9		  ; 8F A9 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF27		  ; 8F 27 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1AB		  ; 8F AB F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF28		  ; 8F 28 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1AD		  ; 8F AD F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF29		  ; 8F 29 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2DB
; Address: $C1E93C
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2DB:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1AF		  ; 8F AF F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF2A		  ; 8F 2A EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1B1		  ; 8F B1 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF2B		  ; 8F 2B EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1B3		  ; 8F B3 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF2C		  ; 8F 2C EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1B5		  ; 8F B5 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF2D		  ; 8F 2D EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1B7		  ; 8F B7 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF2E		  ; 8F 2E EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2DC
; Address: $C1E9BE
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2DC:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1B9		  ; 8F B9 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF2F		  ; 8F 2F EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1BB		  ; 8F BB F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF30		  ; 8F 30 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1BD		  ; 8F BD F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF31		  ; 8F 31 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1BF		  ; 8F BF F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF32		  ; 8F 32 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1C1		  ; 8F C1 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF33		  ; 8F 33 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2DD
; Address: $C1EA40
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2DD:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1C3		  ; 8F C3 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF34		  ; 8F 34 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1C5		  ; 8F C5 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF35		  ; 8F 35 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1C7		  ; 8F C7 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF36		  ; 8F 36 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1C9		  ; 8F C9 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF37		  ; 8F 37 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1CB		  ; 8F CB F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF38		  ; 8F 38 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2DE
; Address: $C1EAC2
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2DE:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1CD		  ; 8F CD F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF39		  ; 8F 39 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1CF		  ; 8F CF F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF3A		  ; 8F 3A EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1D1		  ; 8F D1 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF3B		  ; 8F 3B EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1D3		  ; 8F D3 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF3C		  ; 8F 3C EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1D5		  ; 8F D5 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF3D		  ; 8F 3D EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2DF
; Address: $C1EB44
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2DF:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1D7		  ; 8F D7 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF3E		  ; 8F 3E EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1D9		  ; 8F D9 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF3F		  ; 8F 3F EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1DB		  ; 8F DB F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF40		  ; 8F 40 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1DD		  ; 8F DD F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF41		  ; 8F 41 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1DF		  ; 8F DF F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF42		  ; 8F 42 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E0
; Address: $C1EBC6
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E0:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1E1		  ; 8F E1 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF43		  ; 8F 43 EF 7E | Store accumulator to absolute long address
	LDA $1B			  ; A5 1B | Load from zero page into accumulator
	STA $4206			; 8D 06 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $4214			; AD 14 42 | Hardware register operation
	STA $7EF1E3		  ; 8F E3 F1 7E | Store accumulator to absolute long address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7EEF44		  ; 8F 44 EF 7E | Store accumulator to absolute long address
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E1
; Address: $C1EBFC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E1:
	CPY #$56			 ; C0 56 | Compare Y register (immediate)
	LDA				  ; BF AC BE 02 | Load from absolute long,X into accumulator
	LDX $BD58,Y		  ; BE 58 BD | Load from absolute,Y into X register
	LDX $04BC			; AE BC 04 | Load from absolute address into X register
	LDY $BB5A,X		  ; BC 5A BB | Load from absolute,X into Y register
	BCS $BA			  ; B0 BA | Branch if carry set
	ASL $BA			  ; 06 BA | Arithmetic shift left (zero page)
	JMP $B8B2B9		  ; 5C B9 B2 B8 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	LSR $B4B7,X		  ; 5E B7 B4 | Logical shift right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E2
; Address: $C1EC23
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E2:
	CLV				  ; B8 | Clear overflow flag
	ASL $64B2			; 0E B2 64 | Arithmetic shift left (absolute)
	LDA ($BA),Y		  ; B1 BA | Load from (zero page),Y into accumulator
	BCS $10			  ; B0 10 | Branch if carry set
	BCS $66			  ; B0 66 | Branch if carry set
	LDA $12AEBC		  ; AF BC AE 12 | Load from absolute long address into accumulator
	LDX $AD68			; AE 68 AD | Load from absolute address into X register
	LDX $14AC,Y		  ; BE AC 14 | Load from absolute,Y into X register
	LDY $AB6A			; AC 6A AB | Load from absolute address into Y register
	CPY #$AA			 ; C0 AA | Compare Y register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	JMP ($C2A9)		  ; 6C A9 C2 | Jump to address (absolute indirect)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E3
; Address: $C1EC45
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E3:
	ROR $C4A7			; 6E A7 C4 | Rotate right (absolute)
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDX $70			  ; A6 70 | Load from zero page into X register
	LDA $C6			  ; A5 C6 | Load from zero page into accumulator
	LDY $1C			  ; A4 1C | Load from zero page into Y register
	LDY $72			  ; A4 72 | Load from zero page into Y register
	INY				  ; C8 | Increment Y register
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	LDX #$74			 ; A2 74 | Load immediate value into X register
	LDA ($CA,X)		  ; A1 CA | Load from (zero page,X) into accumulator
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDY #$76			 ; A0 76 | Load immediate value into Y register
	STA				  ; 9F CC 9E 22 | Store accumulator to absolute long,X
	STZ $9D78,X		  ; 9E 78 9D | Store zero to absolute,X
	DEC $249C			; CE 9C 24 | Decrement (absolute)
	STZ $9B7A			; 9C 7A 9B | Store zero to absolute
	BNE $9A			  ; D0 9A | Branch if not equal
	ROL $9A			  ; 26 9A | Rotate left (zero page)
	STA $98D2,Y		  ; 99 D2 98 | Store accumulator to absolute,Y
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $D497,X		  ; 7E 97 D4 | Rotate right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $95			  ; 80 95 | Branch always
	BIT $8294			; 2C 94 82 | Test bits in accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	ROL $8492			; 2E 92 84 | Rotate left (absolute)
	STA ($DA),Y		  ; 91 DA | Store accumulator to (zero page),Y
	BCC $30			  ; 90 30 | Branch if carry clear
	BCC $86			  ; 90 86 | Branch if carry clear
	STA $328EDC		  ; 8F DC 8E 32 | Store accumulator to absolute long address
	STX $8D88			; 8E 88 8D | Store X register to absolute address
	DEC $348C,X		  ; DE 8C 34 | Decrement (absolute,X)
	STY $8B8A			; 8C 8A 8B | Store Y register to absolute address
	CPX #$8A			 ; E0 8A | Compare X register (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	STY $E289			; 8C 89 E2 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	STX $E487			; 8E 87 E4 | Store X register to absolute address
	STX $3A			  ; 86 3A | Store X register to zero page
	STX $90			  ; 86 90 | Store X register to zero page
	STA $E6			  ; 85 E6 | Store accumulator to zero page
	STY $3C			  ; 84 3C | Store Y register to zero page
	STY $92			  ; 84 92 | Store Y register to zero page
	INX				  ; E8 | Increment X register
	ROL $9482,X		  ; 3E 82 94 | Rotate left (absolute,X)
	STA ($EA,X)		  ; 81 EA | Store accumulator to (zero page,X)
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E4
; Address: $C1ECBC
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E4:
	BRA $96			  ; 80 96 | Branch always
	CPX $427E			; EC 7E 42 | Hardware register operation
	ROR $7D98,X		  ; 7E 98 7D | Rotate right (absolute,X)
	INC $447C			; EE 7C 44 | Increment (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	BEQ $7A			  ; F0 7A | Branch if equal
	LSR $7A			  ; 46 7A | Logical shift right (zero page)
	STZ $F279			; 9C 79 F2 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	STZ $F477,X		  ; 9E 77 F4 | Store zero to absolute,X
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY #$75			 ; A0 75 | Load immediate value into Y register
	JMP $A274			; 4C 74 A2 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	LSR $A472			; 4E 72 A4 | Logical shift right (absolute)
	ADC ($FA),Y		  ; 71 FA | Add with carry ((zero page),Y)
	BVS $50			  ; 70 50 | Branch if overflow set
	BVS $A6			  ; 70 A6 | Branch if overflow set
	ROR $6E52			; 6E 52 6E | Rotate right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $6CFE			; 6D FE 6C | Add with carry (absolute)
	JMP ($6BAA)		  ; 6C AA 6B | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E5
; Address: $C1ECFE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E5:
	ROR				  ; 6A | Rotate right (accumulator)
	LDY $0269			; AC 69 02 | Load from absolute address into Y register
	ADC #$58			 ; 69 58 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	LDX $0467			; AE 67 04 | Load from absolute address into X register
	PHY				  ; 5A | Push Y register to stack
	ROR $B0			  ; 66 B0 | Rotate right (zero page)
	ADC $06			  ; 65 06 | Add with carry (zero page)
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	STZ $B2			  ; 64 B2 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	LSR $B462,X		  ; 5E 62 B4 | Logical shift right (absolute,X)
	ADC ($0A,X)		  ; 61 0A | Add with carry ((zero page,X))
	ADC ($60,X)		  ; 61 60 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E6
; Address: $C1ED22
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E6:
	LSR $5DB8,X		  ; 5E B8 5D | Logical shift right (absolute,X)
	ASL $645D			; 0E 5D 64 | Arithmetic shift left (absolute)
	JMP $105BBA		  ; 5C BA 5B 10 | Jump to address long
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	LDY $1259,X		  ; BC 59 12 | Load from absolute,X into Y register
	EOR $5868,Y		  ; 59 68 58 | Exclusive OR with accumulator (absolute,Y)
	LDX $1457,Y		  ; BE 57 14 | Load from absolute,Y into X register
	ROR				  ; 6A | Rotate right (accumulator)
	CPY #$55			 ; C0 55 | Compare Y register (immediate)
	JMP ($C254)		  ; 6C 54 C2 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E7
; Address: $C1ED43
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E7:
	CLC				  ; 18 | Clear carry flag
	ROR $C452			; 6E 52 C4 | Rotate right (absolute)
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	EOR ($70),Y		  ; 51 70 | Exclusive OR with accumulator ((zero page),Y)
	BVC $C6			  ; 50 C6 | Branch if overflow clear
	LSR $4DC8			; 4E C8 4D | Logical shift right (absolute)
	ASL $744D,X		  ; 1E 4D 74 | Arithmetic shift left (absolute,X)
	JMP $4BCA			; 4C CA 4B | Jump to address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E8
; Address: $C1ED5B
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E8:
	JSR $764B			; 20 4B 76 | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $2249			; CC 49 22 | Compare Y register (absolute)
	EOR #$78			 ; 49 78 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	DEC $2447			; CE 47 24 | Decrement (absolute)
	PLY				  ; 7A | Pull Y register from stack
	LSR $D0			  ; 46 D0 | Logical shift right (zero page)
	EOR $26			  ; 45 26 | Exclusive OR with accumulator (zero page)
	EOR $7C			  ; 45 7C | Exclusive OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROR $D442,X		  ; 7E 42 D4 | Rotate right (absolute,X)
	EOR ($2A,X)		  ; 41 2A | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $3F			  ; 80 3F | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	BRA $3E			  ; 80 3E | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	CPY #$3D			 ; C0 3D | Compare Y register (immediate)
	BRA $3D			  ; 80 3D | Branch always
	RTI				  ; 40 | Return from interrupt
	AND $3D00,X		  ; 3D 00 3D | Logical AND with accumulator (absolute,X)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BRA $3C			  ; 80 3C | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $3B			  ; 80 3B | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$3A			 ; C0 3A | Compare Y register (immediate)
	BRA $3A			  ; 80 3A | Branch always
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	CPY #$39			 ; C0 39 | Compare Y register (immediate)
	BRA $39			  ; 80 39 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2E9
; Address: $C1EDB7
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2E9:
	BRA $38			  ; 80 38 | Branch always
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	BRA $37			  ; 80 37 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$36			 ; C0 36 | Compare Y register (immediate)
	BRA $36			  ; 80 36 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$35			 ; C0 35 | Compare Y register (immediate)
	BRA $35			  ; 80 35 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$34			 ; C0 34 | Compare Y register (immediate)
	BRA $34			  ; 80 34 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	BRA $33			  ; 80 33 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$32			 ; C0 32 | Compare Y register (immediate)
	BRA $32			  ; 80 32 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	BRA $31			  ; 80 31 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($C0),Y		  ; 31 C0 | Logical AND with accumulator ((zero page),Y)
	BMI $80			  ; 30 80 | Branch if negative
	BMI $40			  ; 30 40 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	BRA $2F			  ; 80 2F | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	BRA $2E			  ; 80 2E | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	CPY #$2D			 ; C0 2D | Compare Y register (immediate)
	BRA $2D			  ; 80 2D | Branch always
	RTI				  ; 40 | Return from interrupt
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	CPY #$2C			 ; C0 2C | Compare Y register (immediate)
	BRA $2C			  ; 80 2C | Branch always
	RTI				  ; 40 | Return from interrupt
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	CPY #$2B			 ; C0 2B | Compare Y register (immediate)
	BRA $2B			  ; 80 2B | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	BRA $2A			  ; 80 2A | Branch always

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2EA
; Address: $C1EE29
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2EA:
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$29			 ; C0 29 | Compare Y register (immediate)
	BRA $29			  ; 80 29 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BRA $28			  ; 80 28 | Branch always
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	ORA $0E00			; 0D 00 0E | Logical OR with accumulator (absolute)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	ORA $1A00,Y		  ; 19 00 1A | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ORA $1D00,X		  ; 1D 00 1D | Logical OR with accumulator (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2EB
; Address: $C1EEE9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2EB:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2ED
; Address: $C1EEF7
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2ED:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
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
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	AND $3D00,X		  ; 3D 00 3D | Logical AND with accumulator (absolute,X)
	AND $3E00,X		  ; 3D 00 3E | Logical AND with accumulator (absolute,X)
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
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
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2EE
; Address: $C1EFB7
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2EE:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3D00,X		  ; 3E 00 3D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F0
; Address: $C1F027
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F0:
	JSR $1F00			; 20 00 1F | Jump to subroutine
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ORA $1C00,X		  ; 1D 00 1C | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0D00			; 0E 00 0D | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7FE08C		  ; 8F 8C E0 7F | Store accumulator to absolute long address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $7FE090		  ; 8F 90 E0 7F | Store accumulator to absolute long address
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F1
; Address: $C1F090
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F1:
	JSL $C1BA53		  ; 22 53 BA C1 | Jump to subroutine long
	STY $C311			; 8C 11 C3 | Store Y register to absolute address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $C30D			; 8D 0D C3 | Store accumulator to absolute address
	STA $C30F			; 8D 0F C3 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F2
; Address: $C1F0A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F2:
	JSL $C1BACC		  ; 22 CC BA C1 | Jump to subroutine long
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $14			  ; F0 14 | Branch if equal
	STA $C30D			; 8D 0D C3 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F3
; Address: $C1F0AC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F3:
	JSL $C1BACC		  ; 22 CC BA C1 | Jump to subroutine long
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	STA $C30F			; 8D 0F C3 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F7
; Address: $C1F0C4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F7:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $00C7			; 2D C7 00 | Logical AND with accumulator (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $C30D			; CD 0D C3 | Compare accumulator (absolute)
	BNE $1C			  ; D0 1C | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F8
; Address: $C1F0D8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F8:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $01C7			; 2D C7 01 | Logical AND with accumulator (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $C30F			; CD 0F C3 | Compare accumulator (absolute)
	BNE $08			  ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2F9
; Address: $C1F0EC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2F9:
	JSR $F134			; 20 34 F1 | Jump to subroutine
	INC $C311			; EE 11 C3 | Increment (absolute)
	BRA $39			  ; 80 39 | Branch always
	INX				  ; E8 | Increment X register
	CPX #$21			 ; E0 21 | PPU graphics register access
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2FA
; Address: $C1F0FD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2FA:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $00C7			; 2D C7 00 | Logical AND with accumulator (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $C30D			; CD 0D C3 | Compare accumulator (absolute)
	BNE $16			  ; D0 16 | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2FB
; Address: $C1F111
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2FB:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $01C7			; 2D C7 01 | Logical AND with accumulator (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2FD
; Address: $C1F125
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2FD:
	BRA $06			  ; 80 06 | Branch always
	INX				  ; E8 | Increment X register
	CPX #$21			 ; E0 21 | PPU graphics register access
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	BNE $EE			  ; D0 EE | Branch if not equal
	ORA ($C3),Y		  ; 11 C3 | Logical OR with accumulator ((zero page),Y)
	LDY $C311			; AC 11 C3 | Load from absolute address into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_2FF
; Address: $C1F135
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_2FF:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $02C7			; 2D C7 02 | Logical AND with accumulator (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PHX				  ; DA | Push X register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_301
; Address: $C1F14E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_301:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	STY $7FE0			; 8C E0 7F | Store Y register to absolute address
	STA $7FE08C		  ; 8F 8C E0 7F | Store accumulator to absolute long address
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank02_DmaFunction_302
; Address: $C1F16B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_302:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $E442,Y		  ; B9 42 E4 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$18			 ; A2 18 | Load immediate value into X register
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $E090			; AD 90 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank02_DmaFunction_303
; Address: $C1F184
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_303:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	ADC $E412,Y		  ; 79 12 E4 | Add with carry (absolute,Y)
	STA $18			  ; 85 18 | Store accumulator to zero page
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank02_DmaFunction_304
; Address: $C1F199
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_304:
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF 00 00 7F | Load from absolute long,X into accumulator
	STA $C315,Y		  ; 99 15 C3 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA				  ; 9F 00 00 7F | Store accumulator to absolute long,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	LDA $7FE08C		  ; AF 8C E0 7F | Load from absolute long address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ADC $18			  ; 65 18 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $7FE08C		  ; AF 8C E0 7F | Load from absolute long address into accumulator
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	DEC $1C			  ; C6 1C | Decrement (zero page)
	BMI $0D			  ; 30 0D | Branch if negative
	LDA $C315,Y		  ; B9 15 C3 | Load from absolute,Y into accumulator
	STA				  ; 9F 00 00 7F | Store accumulator to absolute long,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $EF			  ; 80 EF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; DmaEAArrayProcessor - Process EAC9/EAD9 arrays with conditional branching
; Address: $C1F1E1
; Size: 19 bytes
;------------------------------------------------------------------------------
DmaEAArrayProcessor:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $EAC9,X		  ; BD C9 EA | Load from absolute,X into accumulator
	STA $EAD9,X		  ; 9D D9 EA | Store accumulator to absolute,X
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; DmaLoopCallAndRestore - Loop call C0C8B7 with stack restore
; Address: $C1F1F7
; Size: 11 bytes
;------------------------------------------------------------------------------
DmaLoopCallAndRestore:
	JSL $C0C8B7		  ; 22 B7 C8 C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E5			  ; 90 E5 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; DmaStackRestoreAndReturn - Simple stack restore and return
; Address: $C1F203
; Size: 3 bytes
;------------------------------------------------------------------------------
DmaStackRestoreAndReturn:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_308
; Address: $C1F206
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_308:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $EAD9,X		  ; BD D9 EA | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank02_DmaFunction_309
; Address: $C1F219
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_309:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E8			  ; 90 E8 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_30A
; Address: $C1F228
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_30A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; DmaRegisterHardware1 - Hardware register operations with interrupt setup
; Address: $C1F23E
; Size: 20 bytes
;------------------------------------------------------------------------------
DmaRegisterHardware1:
	JSL $C47C27		  ; 22 27 7C C4 | Jump to subroutine long
	STZ $4EFA			; 9C FA 4E | Store zero to absolute
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $424D			; 8D 4D 42 | Hardware register operation
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_30F
; Address: $C1F254
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_30F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	STX $2000			; 8E 00 20 | Store X register to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; DmaRegisterHardware2 - Hardware register 20XX region initialization
; Address: $C1F261
; Size: 21 bytes
;------------------------------------------------------------------------------
DmaRegisterHardware2:
	STA $2008			; 8D 08 20 | Store accumulator to absolute address
	STZ $200A			; 9C 0A 20 | Store zero to absolute
	STZ $200C			; 9C 0C 20 | Store zero to absolute
	STZ $200E			; 9C 0E 20 | Store zero to absolute
	STZ $2002			; 9C 02 20 | Store zero to absolute
	STZ $2004			; 9C 04 20 | Store zero to absolute
	STZ $2006			; 9C 06 20 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank02_DmaFunction_311
; Address: $C1F276
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_311:
	JSL $C47D87		  ; 22 87 7D C4 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_312
; Address: $C1F284
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_312:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank02_DmaFunction_313
; Address: $C1F28E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_313:
	JSL $C48A96		  ; 22 96 8A C4 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_314
; Address: $C1F29B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_314:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDX $4EFA			; AE FA 4E | Load from absolute address into X register
	LDA $4252,X		  ; BD 52 42 | Hardware register operation
	CMP #$42			 ; C9 42 | Hardware register operation
	BEQ $51			  ; F0 51 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; DmaDataBlock_014 - Data block with WDM instruction and zero page operations
; Address: $C1F2B5
; Size: 13 bytes
;------------------------------------------------------------------------------
DmaDataBlock_014:
	db $22, $0D, $05, $C9	; JSL call data
	db $0E, $00, $A6		 ; ASL absolute data
	db $42, $C5			  ; WDM reserved instruction (indicates data)
	db $A0, $00			  ; LDY immediate data
	db $85, $04			  ; STA zero page data

;------------------------------------------------------------------------------
; DmaComplexCalculation - Complex calculation with hardware division
; Address: $C1F2C7
; Size: 46 bytes
;------------------------------------------------------------------------------
DmaComplexCalculation:
	INY				  ; C8 | Increment Y register
	STA $05			  ; 85 05 | Store accumulator to zero page
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $004204		  ; 8F 04 42 00 | Store accumulator to absolute long address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $004206		  ; 8F 06 42 00 | Store accumulator to absolute long address
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004214		  ; AF 14 42 00 | Load from absolute long address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $06			  ; 85 06 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STA $04			  ; 85 04 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STA $02			  ; 85 02 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STA $00			  ; 85 00 | Store accumulator to zero page
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank02_DmaFunction_317
; Address: $C1F2F9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank02_DmaFunction_317:
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; DmaDataBlock_015 - Jump table and interrupt vector data
; Address: $C1FF98
; Size: 35 bytes
;------------------------------------------------------------------------------
DmaDataBlock_015:
	db $78			   ; SEI data
	db $18			   ; CLC data
	db $D8			   ; CLD data
	db $5C, $A4, $04, $C0 ; JMP long data
	db $5C, $E0, $05, $C0 ; JMP long data
	db $5C, $E3, $0F, $C0 ; JMP long data
	db $5C, $8C, $37, $C7 ; JMP long data
	db $5C, $4B, $2A, $C0 ; JMP long data
	db $42, $34		  ; WDM data (indicates data block)
	db $41, $51		  ; EOR data
	db $4A			   ; LSR data
	db $41, $47		  ; EOR data
	db $4E, $51, $55	 ; LSR data
	db $45, $53		  ; EOR data

;------------------------------------------------------------------------------
; DmaDataBlock_016 - End-of-bank data with FF padding and register patterns
; Address: $C1FFDC
; Size: 25 bytes
;------------------------------------------------------------------------------
DmaDataBlock_016:
	db $8C, $8B, $73	 ; STY absolute data
	db $AC, $FF, $A8	 ; LDY absolute data
	db $A4, $FF		  ; LDY zero page data
	db $A0, $FF		  ; LDY immediate data
	db $A4, $FF		  ; LDY zero page data (padding)
	db $A4, $FF		  ; LDY zero page data (padding)
	db $A4, $FF		  ; LDY zero page data (padding)
	db $A4, $FF		  ; LDY zero page data (padding)
	db $A4, $FF		  ; LDY zero page data (padding)
	db $A0, $FF		  ; LDY immediate data (padding)
	db $98			   ; TYA data
	db $A4, $FF		  ; LDY zero page data (padding)
