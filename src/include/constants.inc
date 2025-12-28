;==============================================================================
; Dragon Quest III - Game Constants
; Comprehensive game-specific constants and definitions
;==============================================================================

.ifndef CONSTANTS_INC
.define CONSTANTS_INC

;==============================================================================
; Button Input Bit Masks
;==============================================================================
.define BUTTON_B        $8000    ; B button
.define BUTTON_Y        $4000    ; Y button
.define BUTTON_SELECT   $2000    ; Select button
.define BUTTON_START    $1000    ; Start button
.define BUTTON_UP       $0800    ; D-pad Up
.define BUTTON_DOWN     $0400    ; D-pad Down
.define BUTTON_LEFT     $0200    ; D-pad Left
.define BUTTON_RIGHT    $0100    ; D-pad Right
.define BUTTON_A        $0080    ; A button
.define BUTTON_X        $0040    ; X button
.define BUTTON_L        $0020    ; L shoulder button
.define BUTTON_R        $0010    ; R shoulder button

;==============================================================================
; PPU Configuration Constants
;==============================================================================
.define BG_MODE_0       $00      ; 4 backgrounds, 2bpp
.define BG_MODE_1       $01      ; 2 backgrounds (BG1/2: 4bpp, BG3: 2bpp)
.define BG_MODE_7       $07      ; 1 background, rotation/scaling

.define BRIGHTNESS_FULL $0F      ; Full brightness
.define BRIGHTNESS_OFF  $00      ; Screen off

;==============================================================================
; DMA Transfer Types
;==============================================================================
.define DMA_CPU_TO_PPU  $00      ; CPU to PPU transfer
.define DMA_PPU_TO_CPU  $80      ; PPU to CPU transfer
.define DMA_INCREMENT   $00      ; Increment source address
.define DMA_FIXED       $08      ; Fixed source address

;==============================================================================
; Memory Bank Layout (HiROM)
;==============================================================================
.define ROM_BANK_00     $C00000  ; ROM Bank 00 - System boot code
.define ROM_BANK_01     $C08000  ; ROM Bank 01 - Core engine
.define ROM_BANK_02     $C10000  ; ROM Bank 02 - Battle system
.define ROM_BANK_03     $C18000  ; ROM Bank 03 - Menu system
.define ROM_BANK_04     $C20000  ; ROM Bank 04 - Field system
.define ROM_BANK_05     $C28000  ; ROM Bank 05 - Audio system
.define ROM_BANK_06     $C30000  ; ROM Bank 06 - Graphics system
.define ROM_BANK_07     $C38000  ; ROM Bank 07 - Text system

;==============================================================================
; Dragon Quest III Specific Constants
;==============================================================================

; Character Classes
.define CLASS_HERO      $00      ; Hero (Yuusha)
.define CLASS_WARRIOR   $01      ; Warrior (Senshi)
.define CLASS_FIGHTER   $02      ; Fighter (Budouka)
.define CLASS_PILGRIM   $03      ; Pilgrim (Souryo)
.define CLASS_WIZARD    $04      ; Wizard (Madoushi)
.define CLASS_MERCHANT  $05      ; Merchant (Shouninshi)
.define CLASS_SAGE      $06      ; Sage (Kenja)

; Character Stats
.define STAT_HP         $00      ; Hit Points
.define STAT_MP         $01      ; Magic Points
.define STAT_STRENGTH   $02      ; Physical attack power
.define STAT_AGILITY    $03      ; Speed and evasion
.define STAT_LUCK       $04      ; Critical hit and treasure
.define STAT_WISDOM     $05      ; Magic defense
.define STAT_VITALITY   $06      ; HP growth and poison resistance

; Status Ailments
.define STATUS_POISON   $01      ; Poison - lose HP each turn
.define STATUS_SLEEP    $02      ; Sleep - cannot act
.define STATUS_PARALYZE $04      ; Paralyze - cannot move
.define STATUS_CURSE    $08      ; Curse - reduced stats
.define STATUS_CHARM    $10      ; Charm - attacks allies
.define STATUS_MUTE     $20      ; Mute - cannot cast spells

; Battle Actions
.define ACTION_ATTACK   $00      ; Physical attack
.define ACTION_SPELL    $01      ; Cast magic spell
.define ACTION_ITEM     $02      ; Use item
.define ACTION_DEFEND   $03      ; Defend (reduce damage)
.define ACTION_RUN      $04      ; Attempt to flee

; Game Progression Flags
.define FLAG_INTRO_COMPLETE     $01      ; Completed intro sequence
.define FLAG_GOT_FIRST_KEY      $02      ; Obtained first key item
.define FLAG_DEFEATED_BOSS_1    $04      ; Defeated first boss
.define FLAG_OPENED_PORTAL      $08      ; Opened travel portal
.define FLAG_VISITED_CASTLE     $10      ; Visited main castle

; Item Categories
.define ITEM_WEAPON     $00      ; Weapons (swords, axes, etc.)
.define ITEM_ARMOR      $01      ; Armor (shields, helmets, etc.)
.define ITEM_ACCESSORY  $02      ; Accessories (rings, amulets)
.define ITEM_CONSUMABLE $03      ; Consumable items (herbs, potions)
.define ITEM_KEY        $04      ; Key items (quest items)
.define ITEM_TOOL       $05      ; Tools (special use items)

; Magic Spells
.define SPELL_HEAL      $00      ; Heal HP
.define SPELL_HEALMORE  $01      ; Heal more HP
.define SPELL_HEALALL   $02      ; Full HP heal
.define SPELL_HURT      $10      ; Damage spell
.define SPELL_SLEEP     $20      ; Sleep spell
.define SPELL_ZOOM      $30      ; Teleportation
.define SPELL_OUTSIDE   $31      ; Exit dungeon
.define SPELL_RETURN    $32      ; Return to last town

; Sound Effects
.define SFX_MENU_SELECT $01      ; Menu selection sound
.define SFX_MENU_CANCEL $02      ; Menu cancel sound
.define SFX_BATTLE_HIT  $10      ; Battle hit sound
.define SFX_BATTLE_MISS $11      ; Battle miss sound
.define SFX_SPELL_CAST  $20      ; Magic spell casting
.define SFX_LEVEL_UP    $30      ; Character level up
.define SFX_TREASURE    $40      ; Found treasure

; Music Tracks
.define MUSIC_OVERTURE     $01   ; Opening theme
.define MUSIC_FIELD        $02   ; Overworld theme
.define MUSIC_TOWN         $03   ; Town theme
.define MUSIC_DUNGEON      $04   ; Dungeon theme
.define MUSIC_BATTLE       $05   ; Battle theme
.define MUSIC_BOSS_BATTLE  $06   ; Boss battle theme
.define MUSIC_VICTORY      $07   ; Victory fanfare
.define MUSIC_GAME_OVER    $08   ; Game over theme

; Screen Modes
.define SCREEN_TITLE       $00   ; Title screen
.define SCREEN_FIELD       $01   ; Overworld field
.define SCREEN_TOWN        $02   ; Town screen
.define SCREEN_DUNGEON     $03   ; Dungeon screen
.define SCREEN_BATTLE      $04   ; Battle screen
.define SCREEN_MENU        $05   ; Menu screen
.define SCREEN_STATUS      $06   ; Character status
.define SCREEN_SHOP        $07   ; Shop interface

; Game Timers
.define TIMER_FRAME_RATE   $3C   ; 60 FPS (NTSC)
.define TIMER_SECOND       $3C   ; 60 frames = 1 second
.define TIMER_MINUTE       $E10  ; 3600 frames = 1 minute

; Memory Sizes
.define SIZE_SAVE_DATA     $2000 ; Size of save data (8KB)
.define SIZE_SPRITE_DATA   $4000 ; Size of sprite data (16KB)
.define SIZE_MAP_DATA      $8000 ; Size of map data (32KB)
.define SIZE_MUSIC_DATA    $4000 ; Size of music data (16KB)

; Text Constants
.define TEXT_END_MARKER    $FF   ; End of text string
.define TEXT_NEWLINE       $FE   ; Force new line
.define TEXT_WAIT          $FD   ; Wait for input
.define TEXT_CLEAR         $FC   ; Clear text box
.define TEXT_COLOR_WHITE   $00   ; White text
.define TEXT_COLOR_BLUE    $01   ; Blue text
.define TEXT_COLOR_RED     $02   ; Red text
.define TEXT_COLOR_GREEN   $03   ; Green text

; Animation Frame Counts
.define ANIM_WALK_FRAMES   $04   ; Walking animation frames
.define ANIM_SPELL_FRAMES  $08   ; Spell casting frames
.define ANIM_ATTACK_FRAMES $06   ; Attack animation frames
.define ANIM_DAMAGE_FRAMES $04   ; Damage flash frames

.endif
