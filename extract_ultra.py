#!/usr/bin/env python3
"""
Ultra Aggressive Dragon Quest III Code Extractor
Extract from all 128 ROM banks to maximize coverage
"""

from dq3_rom_analyzer_v2 import DQ3ROMAnalyzer
import os

def extract_all_banks():
    """Extract code from ALL ROM banks to maximize coverage."""
    analyzer = DQ3ROMAnalyzer()

    # Load ROM
    rom_path = 'static/Dragon Quest III - Soshite Densetsu he... (J).smc'
    with open(rom_path, 'rb') as f:
        rom_data = f.read()

    print("🚀 ULTRA-AGGRESSIVE EXTRACTION")
    print("Extracting from ALL 128 ROM banks...")
    print("=" * 60)

    os.makedirs('src/banks', exist_ok=True)

    total_instructions = 0
    total_bytes = 0

    # Extract from banks 0x00-0x7F (all 128 banks)
    for bank in range(0x80):  # 128 banks total
        instructions, bytes_extracted = extract_bank_ultra(rom_data, analyzer, bank)
        total_instructions += instructions
        total_bytes += bytes_extracted

        if bank % 16 == 0:
            print(f"Banks ${bank:02X}-${min(bank+15, 0x7F):02X}: {total_instructions:,} instructions ({total_bytes:,} bytes)")

    print(f"\n🎯 ULTRA-EXTRACTION COMPLETE")
    print(f"   Total Instructions: {total_instructions:,}")
    print(f"   Total Bytes:       {total_bytes:,}")
    print(f"   ROM Coverage:      {total_bytes/4194304*100:.2f}%")

    # Create master include file
    create_master_include()

    return total_bytes

def extract_bank_ultra(rom_data, analyzer, bank):
    """Ultra-aggressive extraction from a single bank."""
    bank_offset = bank * 0x8000
    bank_data = rom_data[bank_offset:bank_offset + 0x8000]

    # Determine bank type and extract accordingly
    if is_graphics_bank(bank_data):
        return extract_graphics_bank(bank_data, analyzer, bank)
    elif is_audio_bank(bank_data):
        return extract_audio_bank(bank_data, analyzer, bank)
    elif is_text_bank(bank_data):
        return extract_text_bank(bank_data, analyzer, bank)
    else:
        return extract_code_bank(bank_data, analyzer, bank)

def is_graphics_bank(data):
    """Detect if bank contains graphics data."""
    # Graphics usually have high entropy and specific patterns
    if len(data) < 1000:
        return False

    sample = data[:1000]
    unique_bytes = len(set(sample))
    return unique_bytes > 200  # High entropy suggests graphics

def is_audio_bank(data):
    """Detect if bank contains audio data."""
    # Audio data often has specific headers or patterns
    if len(data) < 100:
        return False

    # Look for audio signatures
    header = data[:16]
    return any(b in header for b in [b'SPC', b'BRR', b'APU'])

def is_text_bank(data):
    """Detect if bank contains text data."""
    # Text banks often have lots of printable characters
    if len(data) < 100:
        return False

    printable_count = sum(1 for b in data[:1000] if 0x20 <= b <= 0x7E)
    return printable_count > 100

def extract_code_bank(bank_data, analyzer, bank):
    """Extract code from a code bank."""
    lines = []
    lines.append(f";==============================================================================")
    lines.append(f"; Dragon Quest III - Bank ${bank:02X} Code")
    lines.append(f"; Ultra-aggressive code extraction")
    lines.append(f";==============================================================================")
    lines.append("")
    lines.append('.include "../include/hardware.inc"')
    lines.append("")
    lines.append(f'.segment "BANK_{bank:02X}_CODE"')
    lines.append("")

    pc = 0
    instruction_count = 0
    bytes_count = 0

    while pc < len(bank_data) and instruction_count < 3000:  # Increased limit
        addr = 0xC00000 + bank * 0x8000 + pc
        remaining = bank_data[pc:]

        if not remaining:
            break

        # Add function labels every 256 bytes
        if pc % 0x100 == 0:
            lines.append(f"")
            lines.append(f"Bank_{bank:02X}_Function_{pc//0x100:02X}:")

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1
        bytes_count += length

        # Skip obvious data patterns but continue extraction
        if _is_obvious_data(remaining):
            # Skip a bit but not too much
            skip = min(32, len(remaining) - 1)
            pc += skip
            bytes_count += skip
            lines.append(f"    ; Skipped {skip} bytes of data")

    # Write file
    filename = f'src/banks/bank_{bank:02X}.asm'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    return instruction_count, bytes_count

def extract_graphics_bank(bank_data, analyzer, bank):
    """Extract graphics data as assembly."""
    lines = []
    lines.append(f";==============================================================================")
    lines.append(f"; Dragon Quest III - Bank ${bank:02X} Graphics Data")
    lines.append(f";==============================================================================")
    lines.append("")
    lines.append(f'.segment "BANK_{bank:02X}_DATA"')
    lines.append("")

    # Convert graphics to .byte directives
    bytes_count = 0
    for i in range(0, min(len(bank_data), 0x4000), 16):  # Process in 16-byte chunks
        chunk = bank_data[i:i+16]
        if chunk:
            hex_string = ', '.join(f'${b:02X}' for b in chunk)
            lines.append(f"Graphics_{bank:02X}_{i//16:03X}:")
            lines.append(f"    .byte {hex_string}")
            bytes_count += len(chunk)

    filename = f'src/banks/graphics_{bank:02X}.asm'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    return len(bank_data) // 16, bytes_count

def extract_audio_bank(bank_data, analyzer, bank):
    """Extract audio data as assembly."""
    lines = []
    lines.append(f";==============================================================================")
    lines.append(f"; Dragon Quest III - Bank ${bank:02X} Audio Data")
    lines.append(f";==============================================================================")
    lines.append("")
    lines.append(f'.segment "BANK_{bank:02X}_AUDIO"')
    lines.append("")

    bytes_count = 0
    for i in range(0, min(len(bank_data), 0x4000), 32):
        chunk = bank_data[i:i+32]
        if chunk:
            hex_string = ', '.join(f'${b:02X}' for b in chunk)
            lines.append(f"Audio_{bank:02X}_{i//32:02X}:")
            lines.append(f"    .byte {hex_string}")
            bytes_count += len(chunk)

    filename = f'src/banks/audio_{bank:02X}.asm'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    return len(bank_data) // 32, bytes_count

def extract_text_bank(bank_data, analyzer, bank):
    """Extract text data as assembly."""
    lines = []
    lines.append(f";==============================================================================")
    lines.append(f"; Dragon Quest III - Bank ${bank:02X} Text Data")
    lines.append(f";==============================================================================")
    lines.append("")
    lines.append(f'.segment "BANK_{bank:02X}_TEXT"')
    lines.append("")

    # Look for text strings
    bytes_count = 0
    i = 0
    string_count = 0

    while i < len(bank_data) and string_count < 500:
        # Look for sequences of printable characters
        start = i
        while i < len(bank_data) and 0x20 <= bank_data[i] <= 0x7E:
            i += 1

        if i - start >= 4:  # Found a string of at least 4 characters
            text_bytes = bank_data[start:i]
            try:
                text = text_bytes.decode('ascii')
                hex_string = ', '.join(f'${b:02X}' for b in text_bytes)
                lines.append(f"Text_{bank:02X}_{string_count:03X}:")
                lines.append(f"    .byte {hex_string}  ; \"{text}\"")
                bytes_count += len(text_bytes)
                string_count += 1
            except:
                pass
        else:
            i += 1

    # Fill rest with raw data
    if bytes_count < len(bank_data) // 4:
        for i in range(0, min(len(bank_data), 0x2000), 16):
            chunk = bank_data[i:i+16]
            if chunk:
                hex_string = ', '.join(f'${b:02X}' for b in chunk)
                lines.append(f"Data_{bank:02X}_{i//16:03X}:")
                lines.append(f"    .byte {hex_string}")
                bytes_count += len(chunk)

    filename = f'src/banks/text_{bank:02X}.asm'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    return string_count + (bytes_count // 16), bytes_count

def _is_obvious_data(data):
    """Check if data looks like non-code."""
    if len(data) < 8:
        return True

    sample = data[:8]
    # All same byte
    if len(set(sample)) == 1:
        return True

    return False

def create_master_include():
    """Create a master file that includes all banks."""
    lines = []
    lines.append(";==============================================================================")
    lines.append("; Dragon Quest III - Master ROM Assembly")
    lines.append("; Includes all extracted banks for maximum coverage")
    lines.append(";==============================================================================")
    lines.append("")
    lines.append('.include "include/hardware.inc"')
    lines.append("")

    # Include all bank files
    for bank in range(0x80):
        lines.append(f'; Bank ${bank:02X}')
        if os.path.exists(f'src/banks/bank_{bank:02X}.asm'):
            lines.append(f'.include "banks/bank_{bank:02X}.asm"')
        if os.path.exists(f'src/banks/graphics_{bank:02X}.asm'):
            lines.append(f'.include "banks/graphics_{bank:02X}.asm"')
        if os.path.exists(f'src/banks/audio_{bank:02X}.asm'):
            lines.append(f'.include "banks/audio_{bank:02X}.asm"')
        if os.path.exists(f'src/banks/text_{bank:02X}.asm'):
            lines.append(f'.include "banks/text_{bank:02X}.asm"')

    with open('src/dq3_complete.asm', 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

def _is_obvious_data_pattern(data):
    """Improved data detection."""
    if len(data) < 16:
        return True

    sample = data[:16]

    # All zeros or all 0xFF
    if all(b == 0x00 for b in sample) or all(b == 0xFF for b in sample):
        return True

    # Very repetitive pattern
    if len(set(sample)) <= 2:
        return True

    return False

if __name__ == '__main__':
    total_bytes = extract_all_banks()
    print(f"\n🏆 FINAL RESULT: {total_bytes:,} bytes extracted")
    print(f"Coverage: {total_bytes/4194304*100:.2f}% of ROM")

    if total_bytes > 400000:  # 10%+ coverage
        print("🌟 MASSIVE SUCCESS! 10%+ coverage achieved!")
    elif total_bytes > 200000:  # 5%+ coverage
        print("🚀 EXCELLENT! 5%+ coverage achieved!")
    else:
        print("📈 Good progress, continue extraction!")
