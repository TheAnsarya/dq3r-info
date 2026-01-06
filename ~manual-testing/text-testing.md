# Text Testing Guide

Testing text extraction for DQ3r Japanese ROM.

## Extraction

### Extract All Text

```powershell
python tools/text_extractor.py
```

### Output Format

Text exported to:
- `extracted_assets/text/`

## Japanese Encoding

DQ3r uses custom encoding:
- 2-byte characters (Shift-JIS variant)
- Custom control codes
- Compressed text blocks

## Test Cases

### TC-1: Extract Dialog

```powershell
python tools/extract_dialog.py --block 0
```

**Expected:** First dialog block extracted.

### TC-2: Character Names

Verify character name extraction:
- Hero name
- Party member names
- Monster names
- Item names

### TC-3: Control Codes

| Code | Function |
|------|----------|
| `$FF` | End of string |
| `$FE` | New line |
| `$FD` | Wait for input |

## Translation Workflow

1. Extract Japanese text
2. Create translation table
3. Insert translated text
4. Verify in emulator

## Related Documentation

- [Translation Assistant](../ai_translation_assistant.py)
- [Translation Memory](../translation_memory.db)
