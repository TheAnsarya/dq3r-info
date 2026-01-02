;==============================================================================
; DQ4r Chapter System - Chapter Management Module
; Handles DQ4's unique 5-chapter narrative structure
; Ported from NES DW4 with SNES enhancements
;==============================================================================

.include "constants.inc"

;------------------------------------------------------------------------------
; Chapter System Constants
;------------------------------------------------------------------------------
.DEFINE CHAPTER_COUNT         5
.DEFINE CHAPTER_DATA_SIZE     28      ; Size of each chapter data structure

; Chapter IDs
.DEFINE CHAPTER_1_RAGNAR      $00
.DEFINE CHAPTER_2_ALENA       $01
.DEFINE CHAPTER_3_TALOON      $02
.DEFINE CHAPTER_4_SISTERS     $03
.DEFINE CHAPTER_5_HERO        $04

; Chapter Mechanics Flags
.DEFINE MECH_AI_PARTY         $01     ; AI-controlled party members
.DEFINE MECH_MERCHANT         $02     ; Merchant abilities (Taloon)
.DEFINE MECH_SOLO             $04     ; Solo protagonist
.DEFINE MECH_MAGIC            $08     ; Magic-focused party
.DEFINE MECH_WAGON            $10     ; Wagon system enabled
.DEFINE MECH_TACTICS          $20     ; Tactics menu enabled
.DEFINE MECH_NPC_COMPANION    $40     ; NPC companion follows
.DEFINE MECH_FULL_CONTROL     $80     ; Full player control

; Battle Tactics (Chapter 5)
.DEFINE TACTIC_SHOW_NO_MERCY  $00
.DEFINE TACTIC_WATCH_MY_MP    $01
.DEFINE TACTIC_GO_ALL_OUT     $02
.DEFINE TACTIC_DONT_USE_MAGIC $03
.DEFINE TACTIC_TRY_OUT        $04
.DEFINE TACTIC_FOLLOW_ORDERS  $05

;------------------------------------------------------------------------------
; Chapter State RAM Addresses (WRAM Bank 7E/7F)
;------------------------------------------------------------------------------
.DEFINE CHAPTER_STATE_BASE    $7E1000

.DEFINE RAM_CURRENT_CHAPTER   $7E1000  ; 1 byte - Current chapter ID
.DEFINE RAM_CHAPTERS_DONE     $7E1001  ; 1 byte - Completed chapters bitmask
.DEFINE RAM_CURRENT_MAP_LO    $7E1002  ; 2 bytes - Current map ID
.DEFINE RAM_CURRENT_MAP_HI    $7E1003
.DEFINE RAM_CURRENT_X         $7E1004  ; 1 byte - Current X position
.DEFINE RAM_CURRENT_Y         $7E1005  ; 1 byte - Current Y position
.DEFINE RAM_GOLD_LO           $7E1006  ; 3 bytes - Gold amount
.DEFINE RAM_GOLD_MID          $7E1007
.DEFINE RAM_GOLD_HI           $7E1008
.DEFINE RAM_STEP_COUNT        $7E1009  ; 2 bytes - Step counter
.DEFINE RAM_CURRENT_TACTIC    $7E100B  ; 1 byte - Current battle tactic
.DEFINE RAM_ACTIVE_PARTY      $7E100C  ; 4 bytes - Active party IDs
.DEFINE RAM_WAGON_PARTY       $7E1010  ; 4 bytes - Wagon party IDs
.DEFINE RAM_PLAY_TIME         $7E1014  ; 4 bytes - Play time in frames
.DEFINE RAM_EVENT_FLAGS       $7E1020  ; 32 bytes - Event flags

;------------------------------------------------------------------------------
; Chapter Data Structure Offsets
;------------------------------------------------------------------------------
.DEFINE CH_ID                 0        ; Chapter ID
.DEFINE CH_PROTAGONIST        1        ; Protagonist character ID
.DEFINE CH_PARTY_COUNT        2        ; Number of party members
.DEFINE CH_COMPANION_COUNT    3        ; Number of NPC companions
.DEFINE CH_START_MAP_LO       4        ; Starting map ID (low byte)
.DEFINE CH_START_MAP_HI       5        ; Starting map ID (high byte)
.DEFINE CH_START_X            6        ; Starting X coordinate
.DEFINE CH_START_Y            7        ; Starting Y coordinate
.DEFINE CH_MECHANICS          8        ; Mechanics flags
.DEFINE CH_MAX_PARTY          9        ; Maximum party size
.DEFINE CH_INTRO_MUSIC        10       ; Intro music track
.DEFINE CH_OVERWORLD_MUSIC    11       ; Overworld music track
.DEFINE CH_COMPLETE_EVENT_LO  12       ; Completion event ID (low)
.DEFINE CH_COMPLETE_EVENT_HI  13       ; Completion event ID (high)
.DEFINE CH_WAGON_ENABLED      14       ; Wagon flag
.DEFINE CH_TACTICS_ENABLED    15       ; Tactics flag
.DEFINE CH_PARTY_IDS          16       ; Party member IDs (8 bytes)
.DEFINE CH_COMPANION_IDS      24       ; Companion IDs (4 bytes)

.segment "CHAPTER_CODE"

;==============================================================================
; Chapter_Initialize
; Initialize chapter system for new game
; Input: None
; Output: None
; Clobbers: A, X, Y
;==============================================================================
Chapter_Initialize:
    PHP
    REP #$30                ; 16-bit A, X, Y

    ; Clear chapter state
    LDA #$0000
    STA RAM_CURRENT_CHAPTER
    STA RAM_CURRENT_MAP_LO
    STA RAM_CURRENT_X       ; Also clears Y
    STA RAM_GOLD_LO
    STA RAM_GOLD_MID        ; Also clears HI
    STA RAM_STEP_COUNT
    STA RAM_CURRENT_TACTIC

    ; Clear active party
    STA RAM_ACTIVE_PARTY
    STA RAM_ACTIVE_PARTY+2
    STA RAM_WAGON_PARTY
    STA RAM_WAGON_PARTY+2

    ; Clear play time
    STA RAM_PLAY_TIME
    STA RAM_PLAY_TIME+2

    ; Clear event flags (32 bytes = 16 words)
    LDX #$001E
@ClearFlags:
    STA RAM_EVENT_FLAGS,X
    DEX
    DEX
    BPL @ClearFlags

    ; Initialize to Chapter 1
    SEP #$20                ; 8-bit A
    LDA #CHAPTER_1_RAGNAR
    JSL Chapter_TransitionTo

    PLP
    RTL

;==============================================================================
; Chapter_TransitionTo
; Transition to a new chapter
; Input: A = Target chapter ID (0-4)
; Output: Carry = 1 if successful, 0 if failed
; Clobbers: A, X, Y
;==============================================================================
Chapter_TransitionTo:
    PHP
    PHB
    SEP #$20                ; 8-bit A

    ; Validate chapter ID
    CMP #CHAPTER_COUNT
    BCS @Failed

    ; Store target chapter
    PHA

    ; Get pointer to chapter data
    JSR Chapter_GetDataPointer

    ; Check prerequisites
    ; TODO: Implement prerequisite flag checking

    ; Mark previous chapter as complete
    SEP #$20
    LDA RAM_CURRENT_CHAPTER
    BEQ @SkipMarkComplete   ; Don't mark if starting new game
    TAX
    LDA #$01
@ShiftLoop:
    DEX
    BMI @SetComplete
    ASL
    BRA @ShiftLoop
@SetComplete:
    ORA RAM_CHAPTERS_DONE
    STA RAM_CHAPTERS_DONE
@SkipMarkComplete:

    ; Update current chapter
    PLA
    STA RAM_CURRENT_CHAPTER

    ; Get chapter data pointer again
    JSR Chapter_GetDataPointer

    ; Set starting position
    REP #$20                ; 16-bit A
    LDA [CHAPTER_DATA_PTR]
    LDY #CH_START_MAP_LO
    LDA [CHAPTER_DATA_PTR],Y
    STA RAM_CURRENT_MAP_LO

    SEP #$20                ; 8-bit A
    LDY #CH_START_X
    LDA [CHAPTER_DATA_PTR],Y
    STA RAM_CURRENT_X
    INY
    LDA [CHAPTER_DATA_PTR],Y
    STA RAM_CURRENT_Y

    ; Initialize party for this chapter
    JSR Chapter_InitializeParty

    ; Reset step count
    REP #$20
    STZ RAM_STEP_COUNT

    ; Set default tactic
    SEP #$20
    LDA #TACTIC_SHOW_NO_MERCY
    STA RAM_CURRENT_TACTIC

    ; Play intro music
    LDY #CH_INTRO_MUSIC
    LDA [CHAPTER_DATA_PTR],Y
    JSL Audio_PlayMusic

    SEC                     ; Success
    BRA @Done

@Failed:
    CLC                     ; Failure

@Done:
    PLB
    PLP
    RTL

;==============================================================================
; Chapter_GetDataPointer
; Get pointer to chapter data structure
; Input: A = Chapter ID
; Output: CHAPTER_DATA_PTR = 24-bit pointer to chapter data
; Clobbers: X, Y
;==============================================================================
Chapter_GetDataPointer:
    PHP
    REP #$30                ; 16-bit A, X, Y

    ; Calculate offset: ChapterId * CHAPTER_DATA_SIZE
    AND #$00FF
    STA SCRATCH_1
    ASL                     ; *2
    ASL                     ; *4
    CLC
    ADC SCRATCH_1           ; *5
    ASL                     ; *10
    ASL                     ; *20
    CLC
    ADC SCRATCH_1           ; *21
    ASL                     ; *42... wait, need *28

    ; Recalculate: ID * 28
    LDA SCRATCH_1
    ASL                     ; *2
    ASL                     ; *4
    ASL                     ; *8
    ASL                     ; *16
    CLC
    ADC SCRATCH_1           ; *17
    ASL                     ; *34... still wrong

    ; Simpler: ID * 32 - ID * 4
    LDA SCRATCH_1
    ASL                     ; *2
    ASL                     ; *4
    ASL                     ; *8
    ASL                     ; *16
    ASL                     ; *32
    SEC
    SBC SCRATCH_1           ; *31
    SEC
    SBC SCRATCH_1           ; *30
    SEC
    SBC SCRATCH_1           ; *29
    SEC
    SBC SCRATCH_1           ; *28

    ; Add base address
    CLC
    ADC #ChapterDataTable
    STA CHAPTER_DATA_PTR
    SEP #$20
    LDA #^ChapterDataTable
    STA CHAPTER_DATA_PTR+2

    PLP
    RTS

;==============================================================================
; Chapter_InitializeParty
; Initialize party members for current chapter
; Input: CHAPTER_DATA_PTR = Pointer to chapter data
; Output: None
; Clobbers: A, X, Y
;==============================================================================
Chapter_InitializeParty:
    PHP
    SEP #$20                ; 8-bit A

    ; Get party count
    LDY #CH_PARTY_COUNT
    LDA [CHAPTER_DATA_PTR],Y
    STA SCRATCH_1           ; Party count

    ; Copy party member IDs
    LDY #CH_PARTY_IDS
    LDX #$0000
@CopyParty:
    CPX SCRATCH_1
    BCS @PadParty
    LDA [CHAPTER_DATA_PTR],Y
    STA RAM_ACTIVE_PARTY,X
    INY
    INX
    CPX #$04
    BCC @CopyParty
    BRA @CheckWagon

@PadParty:
    LDA #$FF                ; Empty slot marker
    STA RAM_ACTIVE_PARTY,X
    INX
    CPX #$04
    BCC @PadParty

@CheckWagon:
    ; Check if wagon is enabled
    LDY #CH_WAGON_ENABLED
    LDA [CHAPTER_DATA_PTR],Y
    BEQ @ClearWagon

    ; Copy remaining party to wagon
    LDY #CH_PARTY_IDS+4     ; Start from 5th party member
    LDX #$0000
@CopyWagon:
    LDA [CHAPTER_DATA_PTR],Y
    CMP #$FF
    BEQ @DoneWagon
    STA RAM_WAGON_PARTY,X
    INY
    INX
    CPX #$04
    BCC @CopyWagon
    BRA @Done

@ClearWagon:
    ; Clear wagon party
    LDA #$FF
    LDX #$0000
@ClearWagonLoop:
    STA RAM_WAGON_PARTY,X
    INX
    CPX #$04
    BCC @ClearWagonLoop
    BRA @Done

@DoneWagon:
    ; Pad remaining wagon slots
    LDA #$FF
@PadWagon:
    STA RAM_WAGON_PARTY,X
    INX
    CPX #$04
    BCC @PadWagon

@Done:
    PLP
    RTS

;==============================================================================
; Chapter_GetCurrentMechanics
; Get mechanics flags for current chapter
; Input: None
; Output: A = Mechanics flags
; Clobbers: X, Y
;==============================================================================
Chapter_GetCurrentMechanics:
    PHP
    SEP #$20

    LDA RAM_CURRENT_CHAPTER
    JSR Chapter_GetDataPointer

    LDY #CH_MECHANICS
    LDA [CHAPTER_DATA_PTR],Y

    PLP
    RTL

;==============================================================================
; Chapter_IsWagonEnabled
; Check if wagon system is available
; Input: None
; Output: Carry = 1 if enabled, 0 if not
; Clobbers: A, X, Y
;==============================================================================
Chapter_IsWagonEnabled:
    PHP
    SEP #$20

    LDA RAM_CURRENT_CHAPTER
    JSR Chapter_GetDataPointer

    LDY #CH_WAGON_ENABLED
    LDA [CHAPTER_DATA_PTR],Y
    BEQ @NotEnabled

    SEC
    BRA @Done

@NotEnabled:
    CLC

@Done:
    PLP
    RTL

;==============================================================================
; Chapter_IsTacticsEnabled
; Check if tactics menu is available
; Input: None
; Output: Carry = 1 if enabled, 0 if not
; Clobbers: A, X, Y
;==============================================================================
Chapter_IsTacticsEnabled:
    PHP
    SEP #$20

    LDA RAM_CURRENT_CHAPTER
    JSR Chapter_GetDataPointer

    LDY #CH_TACTICS_ENABLED
    LDA [CHAPTER_DATA_PTR],Y
    BEQ @NotEnabled

    SEC
    BRA @Done

@NotEnabled:
    CLC

@Done:
    PLP
    RTL

;==============================================================================
; Chapter_SwapPartyMember
; Swap a party member between active party and wagon
; Input: A = Active party slot (0-3)
;        X = Wagon slot (0-3)
; Output: Carry = 1 if successful, 0 if failed
; Clobbers: A, Y
;==============================================================================
Chapter_SwapPartyMember:
    PHP
    SEP #$20
    PHX

    ; Check wagon enabled
    JSL Chapter_IsWagonEnabled
    BCC @Failed

    ; Validate slots
    PLX
    CMP #$04
    BCS @Failed
    CPX #$04
    BCS @Failed

    ; Perform swap
    TAY
    LDA RAM_ACTIVE_PARTY,Y
    PHA
    LDA RAM_WAGON_PARTY,X
    STA RAM_ACTIVE_PARTY,Y
    PLA
    STA RAM_WAGON_PARTY,X

    SEC
    BRA @Done

@Failed:
    CLC

@Done:
    PLP
    RTL

;==============================================================================
; Chapter_SetTactic
; Set the current battle tactic
; Input: A = Tactic ID
; Output: Carry = 1 if successful, 0 if failed
; Clobbers: None
;==============================================================================
Chapter_SetTactic:
    PHP
    PHA

    JSL Chapter_IsTacticsEnabled
    BCC @Failed

    PLA
    CMP #$06                ; Valid tactics: 0-5
    BCS @Failed

    STA RAM_CURRENT_TACTIC
    SEC
    BRA @Done

@Failed:
    PLA
    CLC

@Done:
    PLP
    RTL

;==============================================================================
; Chapter_GetEventFlag
; Check if an event flag is set
; Input: A = Flag ID (0-255)
; Output: Carry = 1 if set, 0 if not
; Clobbers: X, Y
;==============================================================================
Chapter_GetEventFlag:
    PHP
    SEP #$20

    ; Calculate byte index
    TAX
    LSR
    LSR
    LSR                     ; Divide by 8
    TAY

    ; Calculate bit mask
    TXA
    AND #$07
    TAX
    LDA #$01
@ShiftMask:
    CPX #$00
    BEQ @CheckFlag
    ASL
    DEX
    BRA @ShiftMask

@CheckFlag:
    AND RAM_EVENT_FLAGS,Y
    BEQ @NotSet

    SEC
    BRA @Done

@NotSet:
    CLC

@Done:
    PLP
    RTL

;==============================================================================
; Chapter_SetEventFlag
; Set an event flag
; Input: A = Flag ID (0-255)
; Output: None
; Clobbers: X, Y
;==============================================================================
Chapter_SetEventFlag:
    PHP
    SEP #$20

    ; Calculate byte index
    TAX
    LSR
    LSR
    LSR                     ; Divide by 8
    TAY

    ; Calculate bit mask
    TXA
    AND #$07
    TAX
    LDA #$01
@ShiftMask:
    CPX #$00
    BEQ @SetFlag
    ASL
    DEX
    BRA @ShiftMask

@SetFlag:
    ORA RAM_EVENT_FLAGS,Y
    STA RAM_EVENT_FLAGS,Y

    PLP
    RTL

;==============================================================================
; Chapter_ClearEventFlag
; Clear an event flag
; Input: A = Flag ID (0-255)
; Output: None
; Clobbers: X, Y
;==============================================================================
Chapter_ClearEventFlag:
    PHP
    SEP #$20

    ; Calculate byte index
    TAX
    LSR
    LSR
    LSR                     ; Divide by 8
    TAY

    ; Calculate bit mask
    TXA
    AND #$07
    TAX
    LDA #$01
@ShiftMask:
    CPX #$00
    BEQ @ClearFlag
    ASL
    DEX
    BRA @ShiftMask

@ClearFlag:
    EOR #$FF                ; Invert mask
    AND RAM_EVENT_FLAGS,Y
    STA RAM_EVENT_FLAGS,Y

    PLP
    RTL

.segment "CHAPTER_DATA"

;==============================================================================
; Chapter Data Table
;==============================================================================
ChapterDataTable:

; Chapter 1: Ragnar
Chapter1Data:
    .DB $00                 ; +$00: Chapter ID
    .DB $06                 ; +$01: Protagonist ID (Ragnar)
    .DB $01                 ; +$02: Party count
    .DB $01                 ; +$03: Companion count (Healie)
    .DW $0002               ; +$04: Start map (Burland Castle)
    .DB $08                 ; +$06: Start X
    .DB $0a                 ; +$07: Start Y
    .DB MECH_SOLO | MECH_NPC_COMPANION  ; +$08: Mechanics
    .DB $01                 ; +$09: Max party size
    .DB $10                 ; +$0a: Intro music
    .DB $08                 ; +$0b: Overworld music
    .DW $0100               ; +$0c: Completion event
    .DB $00                 ; +$0e: Wagon enabled
    .DB $00                 ; +$0f: Tactics enabled
    .DB $06, $ff, $ff, $ff, $ff, $ff, $ff, $ff  ; +$10: Party IDs
    .DB $c5, $ff, $ff, $ff  ; +$18: Companion IDs (Healie)

; Chapter 2: Alena
Chapter2Data:
    .DB $01                 ; Chapter ID
    .DB $07                 ; Protagonist ID (Alena)
    .DB $03                 ; Party count
    .DB $00                 ; Companion count
    .DW $0001               ; Start map (Santeem Castle)
    .DB $10                 ; Start X
    .DB $08                 ; Start Y
    .DB MECH_AI_PARTY       ; Mechanics
    .DB $03                 ; Max party size
    .DB $11                 ; Intro music
    .DB $09                 ; Overworld music
    .DW $0200               ; Completion event
    .DB $00                 ; Wagon enabled
    .DB $00                 ; Tactics enabled
    .DB $07, $01, $04, $ff, $ff, $ff, $ff, $ff  ; Party: Alena, Cristo, Brey
    .DB $ff, $ff, $ff, $ff  ; Companions

; Chapter 3: Taloon
Chapter3Data:
    .DB $02                 ; Chapter ID
    .DB $05                 ; Protagonist ID (Taloon)
    .DB $01                 ; Party count
    .DB $02                 ; Companion count
    .DW $0016               ; Start map (Lakanaba)
    .DB $0c                 ; Start X
    .DB $0e                 ; Start Y
    .DB MECH_SOLO | MECH_MERCHANT  ; Mechanics
    .DB $01                 ; Max party size
    .DB $12                 ; Intro music
    .DB $0a                 ; Overworld music
    .DW $0300               ; Completion event
    .DB $00                 ; Wagon enabled
    .DB $00                 ; Tactics enabled
    .DB $05, $ff, $ff, $ff, $ff, $ff, $ff, $ff  ; Party: Taloon
    .DB $c7, $c8, $ff, $ff  ; Companions: Laurent, Strom

; Chapter 4: Sisters
Chapter4Data:
    .DB $03                 ; Chapter ID
    .DB $02                 ; Protagonist ID (Nara)
    .DB $02                 ; Party count
    .DB $01                 ; Companion count
    .DW $0015               ; Start map (Monbaraba)
    .DB $08                 ; Start X
    .DB $0a                 ; Start Y
    .DB MECH_AI_PARTY | MECH_MAGIC  ; Mechanics
    .DB $02                 ; Max party size
    .DB $13                 ; Intro music
    .DB $0b                 ; Overworld music
    .DW $0400               ; Completion event
    .DB $00                 ; Wagon enabled
    .DB $00                 ; Tactics enabled
    .DB $02, $03, $ff, $ff, $ff, $ff, $ff, $ff  ; Party: Nara, Mara
    .DB $c6, $ff, $ff, $ff  ; Companions: Orin

; Chapter 5: Hero
Chapter5Data:
    .DB $04                 ; Chapter ID
    .DB $00                 ; Protagonist ID (Hero)
    .DB $08                 ; Party count
    .DB $04                 ; Companion count
    .DW $0014               ; Start map (Hero's Village)
    .DB $08                 ; Start X
    .DB $0c                 ; Start Y
    .DB MECH_WAGON | MECH_TACTICS | MECH_FULL_CONTROL  ; Mechanics
    .DB $04                 ; Max party size
    .DB $14                 ; Intro music
    .DB $0c                 ; Overworld music
    .DW $0500               ; Completion event
    .DB $01                 ; Wagon enabled
    .DB $01                 ; Tactics enabled
    .DB $00, $01, $02, $03, $04, $05, $06, $07  ; All party members
    .DB $c9, $ca, $cb, $cc  ; Companions: Hector, Panon, Lucia, Doran

;------------------------------------------------------------------------------
; Scratch RAM and pointers (to be defined in RAM map)
;------------------------------------------------------------------------------
.DEFINE SCRATCH_1           $00
.DEFINE SCRATCH_2           $02
.DEFINE CHAPTER_DATA_PTR    $04       ; 3-byte pointer

; Placeholder for audio function
Audio_PlayMusic:
    RTL
