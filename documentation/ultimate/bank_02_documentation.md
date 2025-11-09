# bank_02.asm
**Project**: Dragon Quest III ROM Analysis
**Type**: 65816 Assembly Language
**Size**: 80,211 bytes
**Last Modified**: 2025-11-09 02:52:22
**Git Status**: 🔄 M src/bank_02.asm

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 80,211 bytes
- **Line Count**: 1440
- **Character Encoding**: UTF-8 (auto-detected)
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```nasm
; Dragon Quest III - Bank $02
; Regions: 1

.BANK 2
.ORG $0000

; Region $010000-$010800
; SNES address: $02:$8000
region_010000:
    db $d5           ; D5          ; $010000 [02:$8000]
    AND #$00f9       ; 29 F9 00    ; $010001 [02:$8001]
    BRK #$00         ; 00 00       ; $010004 [02:$8004]
    BRK #$00         ; 00 00       ; $010006 [02:$8006]
    JMP $f7c7        ; 4C C7 F7    ; $010008 [02:$8008]
    ASL A            ; 0A          ; $01000b [02:$800b]
    ASL A            ; 0A          ; $01000c [02:$800c]
    BIT $0126        ; 2C 26 01    ; $01000d [02:$800d]
    DEC $f7c7,X      ; DE C7 F7    ; $010010 [02:$8010]
    BPL $8026        ; 10 11       ; $010013 [02:$8013]
    db $1f           ; 1F          ; $010015 [02:$8015]
    db $1e           ; 1E          ; $010016 [02:$8016]
    db $01           ; 01          ; $010017 [02:$8017]
    db $37           ; 37          ; $010018 [02:$8018]
    INY              ; C8          ; $010019 [02:$8019]
    db $f7           ; F7          ; $01001a [02:$801a]
    db $01           ; 01          ; $01001b [02:$801b]
    ASL A            ; 0A          ; $01001c [02:$801c]
    db $1e           ; 1E          ; $01001d [02:$801d]
    BPL $8021        ; 10 01       ; $01001e [02:$801e]
    ROR A            ; 6A          ; $010020 [02:$8020]
    INY              ; C8          ; $010021 [02:$8021]
    db $f7           ; F7          ; $010022 [02:$8022]
    ASL A            ; 0A          ; $010023 [02:$8023]
    PLP              ; 28          ; $010024 [02:$8024]
    ASL $0118        ; 0E 18 01    ; $010025 [02:$8025]
    db $a3           ; A3          ; $010028 [02:$8028]
    INY              ; C8          ; $010029 [02:$8029]
    db $f7           ; F7          ; $01002a [02:$802a]
    BRK #$02         ; 00 02       ; $01002b [02:$802b]
    JSR $011a        ; 20 1A 01    ; $01002d [02:$802d]
    CPX #$f7c8       ; E0 C8 F7    ; $010030 [02:$8030]
    BRK #$0b         ; 00 0B       ; $010033 [02:$8033]
    RTS              ; 60          ; $010035 [02:$8035]
    PHP              ; 08          ; $010036 [02:$8036]
    db $01           ; 01          ; $010037 [02:$8037]
    db $19           ; 19          ; $010038 [02:$8038]
    CMP #$17f7       ; C9 F7 17    ; $010039 [02:$8039]
    db $34           ; 34          ; $01003c [02:$803c]
    db $37           ; 37          ; $01003d [02:$803d]
    db $46           ; 46          ; $01003e [02:$803e]
...
```

**Lines shown**: 50 of 1440 total

