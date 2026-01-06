# DQ3r Manual Testing Documentation

Manual testing procedures, debugging guides, and verification workflows for Dragon Quest III (SNES).

## 📁 Contents

| Document | Description |
|----------|-------------|
| [ROM Analysis](rom-analysis.md) | Manual ROM analysis procedures |
| [Graphics Testing](graphics-testing.md) | Graphics extraction verification |
| [Text Testing](text-testing.md) | Text extraction and translation testing |

## 🎯 Purpose

These guides document **manual procedures** for:

- **ROM Analysis** - HiROM structure verification
- **Graphics Testing** - Verifying graphics extraction
- **Text Testing** - Japanese text extraction and encoding
- **Breakpoint Analysis** - Debugging with Mesen-S

## 🔧 Prerequisites

### Required Software

| Tool | Purpose |
|------|---------|
| **Mesen-S** | SNES emulator with debugger |
| **bsnes-plus** | Alternative debugger |
| **Tile Molester** | Graphics viewer |
| **YY-CHR** | CHR tile editor |

### ROM Files

Place original ROM in `roms/` folder:
- `Dragon Quest III - Soshite Densetsu he... (J).sfc`

## 📚 Related Documentation

- [GameInfo Manual Testing](https://github.com/TheAnsarya/GameInfo/tree/main/~manual-testing)
- [DQ3r Testing Docs](https://github.com/TheAnsarya/GameInfo/tree/main/~manual-testing/game-specific/dq3r-snes)
- [Main README](../README.md)

## 🔬 ROM Info

| Property | Value |
|----------|-------|
| **Platform** | Super Nintendo (SNES) |
| **Region** | Japan |
| **ROM Type** | HiROM |
| **Size** | 4 MB (32 Mbit) |
| **SRAM** | 64 KB |
