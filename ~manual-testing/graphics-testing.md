# Graphics Testing Guide

Testing graphics extraction and verification for DQ3r.

## Extraction Test

### Extract All Graphics

```powershell
python extract_complete.py --graphics
```

### View Extracted Tiles

Use Tile Molester or YY-CHR to view:
- `extracted_assets/graphics/`

## Graphics Format

DQ3r uses 4bpp SNES format:
- 8x8 pixel tiles
- 16 colors per palette
- Compressed with proprietary algorithm

## Verification Checklist

### Character Sprites
- [ ] Hero sprites complete
- [ ] Party member sprites
- [ ] NPC sprites
- [ ] Monster battle sprites

### Map Tiles
- [ ] Overworld tiles
- [ ] Town tiles
- [ ] Dungeon tiles
- [ ] Cave tiles

### UI Graphics
- [ ] Menu frames
- [ ] Font characters
- [ ] Battle UI elements
- [ ] Status icons

## In-Emulator Verification

1. Load ROM in Mesen-S
2. Open Debug → Tile Viewer
3. Compare extracted graphics with VRAM contents

## Related Documentation

- [GameInfo Graphics Testing](https://github.com/TheAnsarya/GameInfo/tree/main/~manual-testing/game-specific/dq3r-snes/graphics-editor-testing.md)
