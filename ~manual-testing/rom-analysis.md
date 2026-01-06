# ROM Analysis Guide

Manual ROM analysis procedures for DQ3r SNES.

## HiROM Structure

DQ3r uses HiROM mapping:

| Bank Range | Address Range | Content |
|------------|---------------|---------|
| $C0-$FF | $0000-$FFFF | ROM |
| $00-$3F | $8000-$FFFF | ROM (mirror) |
| $7E-$7F | $0000-$FFFF | RAM |

## Bank Analysis

### Analyze Specific Bank

```powershell
python analyze_bank40.py --bank 40
```

### Coverage Analysis

```powershell
python analyze_coverage.py
```

## Key ROM Regions

| Bank | Content |
|------|---------|
| $C0-$C7 | Game code |
| $C8-$CF | Battle system |
| $D0-$D7 | Map data |
| $D8-$DF | Monster data |
| $E0-$E7 | Graphics (compressed) |
| $E8-$EF | Text/Dialog |
| $F0-$FF | Audio/Music |

## Breakpoint Analysis

### Set Breakpoints in Mesen-S

1. Open Debug → Debugger
2. Add breakpoint at target address
3. Set condition (read/write/execute)
4. Run until hit

### Common Breakpoints

| Purpose | Address | Type |
|---------|---------|------|
| Battle init | $C08000 | Execute |
| Text display | $C10000 | Execute |
| DMA transfer | $4300 | Write |

## Related Documentation

- [Breakpoint Guides](https://github.com/TheAnsarya/GameInfo/tree/main/~manual-testing/breakpoint-guides)
