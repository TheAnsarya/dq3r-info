;==============================================================================
; Dragon Quest III - Comprehensive Hardware Definitions
; Complete SNES hardware register and memory layout definitions
;==============================================================================

.ifndef HARDWARE_INC
.define HARDWARE_INC

; CPU Control
.define CPU_65816    1

;==============================================================================
; PPU (Picture Processing Unit) Registers
;==============================================================================
.define PPU_BRIGHTNESS      $2100    ; Screen brightness control (0-15)
.define PPU_OAM_SIZE        $2101    ; OAM object size configuration
.define PPU_OAM_ADDR_LO     $2102    ; OAM address low byte
.define PPU_OAM_ADDR_HI     $2103    ; OAM address high byte
.define PPU_OAM_DATA        $2104    ; OAM data write
.define PPU_BG_MODE         $2105    ; Background mode configuration
.define PPU_MOSAIC          $2106    ; Mosaic effect control
.define PPU_BG1_TILEMAP     $2107    ; BG1 tilemap configuration
.define PPU_BG2_TILEMAP     $2108    ; BG2 tilemap configuration
.define PPU_BG3_TILEMAP     $2109    ; BG3 tilemap configuration
.define PPU_BG4_TILEMAP     $210A    ; BG4 tilemap configuration
.define PPU_BG12_CHR        $210B    ; BG1/BG2 character data location
.define PPU_BG34_CHR        $210C    ; BG3/BG4 character data location
.define PPU_BG1_SCROLL_X    $210D    ; BG1 horizontal scroll
.define PPU_BG1_SCROLL_Y    $210E    ; BG1 vertical scroll
.define PPU_BG2_SCROLL_X    $210F    ; BG2 horizontal scroll
.define PPU_BG2_SCROLL_Y    $2110    ; BG2 vertical scroll
.define PPU_BG3_SCROLL_X    $2111    ; BG3 horizontal scroll
.define PPU_BG3_SCROLL_Y    $2112    ; BG3 vertical scroll
.define PPU_BG4_SCROLL_X    $2113    ; BG4 horizontal scroll
.define PPU_BG4_SCROLL_Y    $2114    ; BG4 vertical scroll
.define PPU_VRAM_INC        $2115    ; VRAM increment configuration
.define PPU_VRAM_ADDR_LO    $2116    ; VRAM address low byte
.define PPU_VRAM_ADDR_HI    $2117    ; VRAM address high byte
.define PPU_VRAM_DATA_LO    $2118    ; VRAM data write low byte
.define PPU_VRAM_DATA_HI    $2119    ; VRAM data write high byte
.define PPU_MODE7_A         $211B    ; Mode 7 matrix parameter A
.define PPU_MODE7_B         $211C    ; Mode 7 matrix parameter B
.define PPU_MODE7_C         $211D    ; Mode 7 matrix parameter C
.define PPU_MODE7_D         $211E    ; Mode 7 matrix parameter D
.define PPU_MODE7_X         $211F    ; Mode 7 center X coordinate
.define PPU_MODE7_Y         $2120    ; Mode 7 center Y coordinate
.define PPU_CGRAM_ADDR      $2121    ; Color palette address
.define PPU_CGRAM_DATA      $2122    ; Color palette data
.define PPU_WINDOW_1_LEFT   $2126    ; Window 1 left boundary
.define PPU_WINDOW_1_RIGHT  $2127    ; Window 1 right boundary
.define PPU_WINDOW_2_LEFT   $2128    ; Window 2 left boundary
.define PPU_WINDOW_2_RIGHT  $2129    ; Window 2 right boundary
.define PPU_WINDOW_BG       $212A    ; Window background configuration
.define PPU_WINDOW_OBJ      $212B    ; Window object configuration
.define PPU_MAIN_SCREEN     $212C    ; Main screen layer enable
.define PPU_SUB_SCREEN      $212D    ; Sub screen layer enable
.define PPU_WINDOW_MAIN     $212E    ; Main screen window configuration
.define PPU_WINDOW_SUB      $212F    ; Sub screen window configuration
.define PPU_COLOR_MATH      $2130    ; Color math configuration
.define PPU_COLOR_MATH_SUB  $2131    ; Color math sub screen
.define PPU_COLOR_DATA      $2132    ; Fixed color data
.define PPU_SCREEN_MODE     $2133    ; Screen mode configuration

;==============================================================================
; APU (Audio Processing Unit) Interface
;==============================================================================
.define APU_PORT_0          $2140    ; APU communication port 0
.define APU_PORT_1          $2141    ; APU communication port 1
.define APU_PORT_2          $2142    ; APU communication port 2
.define APU_PORT_3          $2143    ; APU communication port 3

;==============================================================================
; CPU Hardware Registers
;==============================================================================
.define NMI_ENABLE          $4200    ; NMI/IRQ enable
.define IO_PORT_WRITE       $4201    ; I/O port write
.define MULTIPLY_A          $4202    ; Multiply operand A
.define MULTIPLY_B          $4203    ; Multiply operand B
.define DIVIDE_DIVIDEND_LO  $4204    ; Divide dividend low byte
.define DIVIDE_DIVIDEND_HI  $4205    ; Divide dividend high byte
.define DIVIDE_DIVISOR      $4206    ; Divide divisor
.define H_COUNT_LO          $4207    ; H-timer low byte
.define H_COUNT_HI          $4208    ; H-timer high byte
.define V_COUNT_LO          $4209    ; V-timer low byte
.define V_COUNT_HI          $420A    ; V-timer high byte
.define DMA_ENABLE          $420B    ; DMA enable
.define HDMA_ENABLE         $420C    ; H-DMA enable
.define ROM_SPEED           $420D    ; ROM access speed
.define NMI_STATUS          $4210    ; NMI flag and version
.define IRQ_STATUS          $4211    ; IRQ flag
.define PPU_STATUS          $4212    ; PPU status
.define IO_PORT_READ        $4213    ; I/O port read
.define DIVIDE_RESULT_LO    $4214    ; Divide result low byte
.define DIVIDE_RESULT_HI    $4215    ; Divide result high byte
.define MULTIPLY_RESULT_LO  $4216    ; Multiply result low byte
.define MULTIPLY_RESULT_HI  $4217    ; Multiply result high byte
.define JOYPAD1_LO          $4218    ; Joypad 1 data low byte
.define JOYPAD1_HI          $4219    ; Joypad 1 data high byte
.define JOYPAD2_LO          $421A    ; Joypad 2 data low byte
.define JOYPAD2_HI          $421B    ; Joypad 2 data high byte
.define JOYPAD3_LO          $421C    ; Joypad 3 data low byte
.define JOYPAD3_HI          $421D    ; Joypad 3 data high byte
.define JOYPAD4_LO          $421E    ; Joypad 4 data low byte
.define JOYPAD4_HI          $421F    ; Joypad 4 data high byte

;==============================================================================
; Dragon Quest III Custom Hardware Registers
; (Game-specific memory-mapped registers)
;==============================================================================
.define CUSTOM_CONTROL_1    $4100    ; Game-specific control register 1
.define CUSTOM_CONTROL_2    $4101    ; Game-specific control register 2
.define CUSTOM_STATUS_1     $4190    ; Game-specific status register 1
.define CUSTOM_REG_1        $4054    ; Custom register 1
.define CUSTOM_REG_2        $4056    ; Custom register 2

;==============================================================================
; Game State Memory Map (0xE000-0xE0FF)
;==============================================================================
.define TEMP_X_COORD        $E086    ; Temporary X coordinate storage
.define TEMP_Y_COORD        $E088    ; Temporary Y coordinate storage
.define TEMP_CALC_RESULT    $E08A    ; Temporary calculation result
.define GAME_STATE_FLAGS    $E096    ; General game state flags
.define CURRENT_MENU_INDEX  $E09A    ; Current menu selection index
.define PLAYER_INPUT_STATE  $E09C    ; Current player input state
.define BATTLE_STATE_FLAGS  $E09E    ; Battle system state flags
.define FIELD_STATE_FLAGS   $E0A0    ; Field/overworld state flags
.define SYSTEM_STATUS       $E0B0    ; System status flags
.define DMA_TRANSFER_CTRL   $E0B6    ; DMA transfer control
.define DMA_TRANSFER_STATUS $E0B8    ; DMA transfer status

;==============================================================================
; Dragon Quest III Function Addresses
;==============================================================================
.define CALCULATE_ROM_POINTER    $C01098  ; Calculate ROM pointer from bank/offset
.define DECOMPRESS_GAME_DATA     $C08FD7  ; Decompress graphics/text data
.define HANDLE_SYSTEM_ERROR      $C09052  ; System error handler
.define CALCULATE_DATA_POINTER   $C05F21  ; Alternative data pointer calculation
.define PROCESS_DATA_POINTER     $C0601F  ; Process data pointer
.define PROCESS_DATA_STREAM      $C067FD  ; Process data stream
.define EXECUTE_ENGINE_COMMAND   $C90572  ; Main engine command processor
.define PROCESS_ENGINE_FUNCTION  $C903EE  ; Engine subsystem processor

; Memory Map Base Addresses
WRAM_BASE    = $000000  ; Work RAM (128KB)
HWREG_BASE   = $002000  ; Hardware registers
CART_RAM     = $006000  ; Cartridge RAM
ROM_BASE     = $008000  ; ROM start (HiROM)

;==============================================================================
; PPU (Picture Processing Unit) Registers
;==============================================================================

; Screen Display
INIDISP      = $002100  ; Screen Display Register
OBSEL        = $002101  ; Object Size and Character Address
OAMADDL      = $002102  ; OAM Address Low
OAMADDH      = $002103  ; OAM Address High
OAMDATA      = $002104  ; OAM Data Write

; Background Control
BGMODE       = $002105  ; Background Mode
MOSAIC       = $002106  ; Mosaic Size and Background Enable
BG1SC        = $002107  ; Background 1 Screen Address
BG2SC        = $002108  ; Background 2 Screen Address
BG3SC        = $002109  ; Background 3 Screen Address
BG4SC        = $00210A  ; Background 4 Screen Address

; Background Character Addresses
BG12NBA      = $00210B  ; Background 1&2 Character Address
BG34NBA      = $00210C  ; Background 3&4 Character Address

; Background Scroll
BG1HOFS      = $00210D  ; Background 1 Horizontal Scroll
BG1VOFS      = $00210E  ; Background 1 Vertical Scroll
BG2HOFS      = $00210F  ; Background 2 Horizontal Scroll
BG2VOFS      = $002110  ; Background 2 Vertical Scroll
BG3HOFS      = $002111  ; Background 3 Horizontal Scroll
BG3VOFS      = $002112  ; Background 3 Vertical Scroll
BG4HOFS      = $002113  ; Background 4 Horizontal Scroll
BG4VOFS      = $002114  ; Background 4 Vertical Scroll

; VRAM Access
VMAIN        = $002115  ; VRAM Address Increment Mode
VMADDL       = $002116  ; VRAM Address Low
VMADDH       = $002117  ; VRAM Address High
VMDATAL      = $002118  ; VRAM Data Write Low
VMDATAH      = $002119  ; VRAM Data Write High

; Color Palette
CGADD        = $002121  ; Color Palette Address
CGDATA       = $002122  ; Color Palette Data

;==============================================================================
; DMA (Direct Memory Access) Registers
;==============================================================================

; DMA Channel 0
DMAP0        = $004300  ; DMA Control
BBAD0        = $004301  ; DMA Destination
A1T0L        = $004302  ; DMA Source Address Low
A1T0H        = $004303  ; DMA Source Address High
A1B0         = $004304  ; DMA Source Bank
DAS0L        = $004305  ; DMA Transfer Size Low
DAS0H        = $004306  ; DMA Transfer Size High

; DMA Trigger
MDMAEN       = $00420B  ; DMA Enable
HDMAEN       = $00420C  ; HDMA Enable

;==============================================================================
; CPU and System Registers
;==============================================================================

; Interrupt Control
NMITIMEN     = $004200  ; Interrupt Enable
TIMEUP       = $004201  ; I/O Port Write
APUIO0       = $004210  ; APU Communication Port 0
APUIO1       = $004211  ; APU Communication Port 1
APUIO2       = $004212  ; APU Communication Port 2
APUIO3       = $004213  ; APU Communication Port 3

; Status Registers
RDNMI        = $004210  ; NMI Flag
TIMEUP       = $004211  ; IRQ Flag
HVBJOY       = $004212  ; H/V-Blank and Joypad Status
RDIO         = $004213  ; I/O Port Read

;==============================================================================
; Dragon Quest III Specific Memory Layout
;==============================================================================

; Game RAM Usage
DQ3_GAME_STATE     = $00E000  ; Main game state variables
DQ3_MENU_STATE     = $00E100  ; Menu system state
DQ3_BATTLE_STATE   = $00E200  ; Battle system state
DQ3_PARTY_DATA     = $00E300  ; Party member data
DQ3_INVENTORY      = $00E400  ; Inventory and items
DQ3_SAVE_DATA      = $00E500  ; Save game data

; Hardware registers used by DQ3 (from boot analysis)
DQ3_HW_REG1        = $00E0B2  ; Hardware register 1
DQ3_HW_REG2        = $00E0B4  ; Hardware register 2
DQ3_HW_REG3        = $00E0B6  ; Hardware register 3

; ROM Bank Definitions
DQ3_BOOT_BANK      = $00     ; Boot and initialization code
DQ3_ENGINE_BANK    = $01     ; Main engine code
DQ3_BATTLE_BANK    = $02     ; Battle system code
DQ3_MENU_BANK      = $03     ; Menu system code
DQ3_GRAPHICS_BANK  = $10     ; Graphics data start
DQ3_AUDIO_BANK     = $20     ; Audio data start
DQ3_TEXT_BANK      = $30     ; Text and dialog data

;==============================================================================
; Useful Macros
;==============================================================================

; Set 16-bit accumulator and index registers
.macro SetA16
    rep #$20
.endmacro

; Set 8-bit accumulator, 16-bit index registers
.macro SetA8
    sep #$20
.endmacro

; Set 8-bit accumulator and index registers
.macro SetA8I8
    sep #$30
.endmacro

; Set 16-bit accumulator and index registers
.macro SetA16I16
    rep #$30
.endmacro

; Wait for VBlank
.macro WaitVBlank
:   bit RDNMI
    bpl :-
.endmacro

; DMA transfer macro
.macro DMA_Transfer channel, mode, dest, source, size
    lda #mode
    sta DMAP0 + (channel * $10)
    lda #dest
    sta BBAD0 + (channel * $10)
    lda #<source
    sta A1T0L + (channel * $10)
    lda #>source
    sta A1T0H + (channel * $10)
    lda #^source
    sta A1B0 + (channel * $10)
    lda #<size
    sta DAS0L + (channel * $10)
    lda #>size
    sta DAS0H + (channel * $10)
    lda #(1 << channel)
    sta MDMAEN
.endmacro

.endif  ; HARDWARE_INC
