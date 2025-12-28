#!/usr/bin/env python3
"""
Quick ROM Coverage Analysis
Analyze how much of the ROM we've successfully extracted
"""

import os
import re

def count_extracted_bytes():
    """Count bytes in all extracted assembly files."""
    src_dir = 'src'
    total_instructions = 0
    total_bytes = 0
    files_analyzed = 0

    print("🔍 ANALYZING EXTRACTED CODE")
    print("=" * 50)

    # Find all .asm files
    for root, dirs, files in os.walk(src_dir):
        for file in files:
            if file.endswith('.asm'):
                filepath = os.path.join(root, file)
                instructions, bytes_count = count_file_instructions(filepath)
                if instructions > 0:
                    print(f"{file:<20} {instructions:>5} instructions ({bytes_count:>5} bytes)")
                    total_instructions += instructions
                    total_bytes += bytes_count
                    files_analyzed += 1

    print("-" * 50)
    print(f"{'TOTALS':<20} {total_instructions:>5} instructions ({total_bytes:>5} bytes)")
    print(f"Files analyzed: {files_analyzed}")

    # Calculate ROM coverage
    original_rom_size = 4_194_304  # 4MB
    coverage_percent = (total_bytes / original_rom_size) * 100

    print(f"\n🎯 ROM COVERAGE ANALYSIS")
    print(f"   Original ROM: {original_rom_size:,} bytes")
    print(f"   Extracted:    {total_bytes:,} bytes")
    print(f"   Coverage:     {coverage_percent:.2f}%")

    if coverage_percent > 10:
        print("   🚀 Excellent progress! Significant ROM coverage achieved.")
    elif coverage_percent > 1:
        print("   ✅ Good progress! Solid foundation established.")
    elif coverage_percent > 0.1:
        print("   📈 Making progress! Continue extraction.")
    else:
        print("   🚧 Just getting started...")

    return total_bytes, coverage_percent

def count_file_instructions(filepath):
    """Count instructions and estimate bytes in a file."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
    except:
        return 0, 0

    instruction_count = 0
    byte_count = 0

    for line in lines:
        line = line.strip()
        if line and not line.startswith(';') and not line.startswith('.') and not line.endswith(':'):
            # Look for hex bytes in comments
            if ';' in line:
                comment = line.split(';', 1)[1]
                hex_bytes = re.findall(r'[0-9A-F]{2}', comment)
                if hex_bytes:
                    instruction_count += 1
                    byte_count += len(hex_bytes)

    return instruction_count, byte_count

def analyze_specific_files():
    """Analyze specific important files."""
    important_files = [
        'src/boot/boot.asm',
        'src/engine/engine.asm',
        'src/battle/battle.asm',
        'src/boot_00.asm',
        'src/engine_01.asm',
        'src/battle_02.asm',
        'src/menu_03.asm',
        'src/field_04.asm',
        'src/graphics_06.asm'
    ]

    print(f"\n📋 IMPORTANT FILES ANALYSIS")
    print("-" * 50)

    for file in important_files:
        if os.path.exists(file):
            instructions, bytes_count = count_file_instructions(file)
            status = "✅" if instructions > 100 else "⚠️" if instructions > 10 else "❌"
            print(f"{status} {os.path.basename(file):<20} {instructions:>5} instructions")
        else:
            print(f"❌ {os.path.basename(file):<20}  FILE NOT FOUND")

def estimate_rom_accuracy():
    """Estimate how accurately our extraction matches the original."""

    # Check if we have a built ROM to compare
    if os.path.exists('build/dragonquest3_assembled.smc'):
        built_size = os.path.getsize('build/dragonquest3_assembled.smc')
        print(f"\n🔧 BUILT ROM ANALYSIS")
        print(f"   Built ROM size: {built_size:,} bytes")

        # Try to do a quick comparison if original exists
        if os.path.exists('static/Dragon Quest III - Soshite Densetsu he... (J).smc'):
            original_size = os.path.getsize('static/Dragon Quest III - Soshite Densetsu he... (J).smc')
            size_match = abs(built_size - original_size) < 1000
            print(f"   Original ROM:   {original_size:,} bytes")
            print(f"   Size match:     {'✅' if size_match else '❌'}")

    print(f"\n💡 NEXT STEPS TO INCREASE COVERAGE:")
    print(f"   1. Extract more code from banks 08-0F (engine systems)")
    print(f"   2. Extract graphics data from banks 10-1F")
    print(f"   3. Extract audio data from banks 20-2F")
    print(f"   4. Extract text/dialog from banks 30-3F")
    print(f"   5. Fix address mapping in ROM builder")

def main():
    total_bytes, coverage = count_extracted_bytes()
    analyze_specific_files()
    estimate_rom_accuracy()

    print(f"\n{'🎯 SUMMARY':<50}")
    print(f"{'='*50}")
    print(f"Total extracted: {total_bytes:,} bytes ({coverage:.2f}% coverage)")

    if coverage >= 1.0:
        print("🌟 MILESTONE: 1%+ ROM coverage achieved!")
        print("   Ready for detailed system analysis")
    elif coverage >= 0.5:
        print("🚀 Great progress! Approaching 1% coverage")
        print("   Continue extracting major systems")
    else:
        print("📈 Foundation established, increase extraction")
        print("   Focus on core game systems")

if __name__ == '__main__':
    main()
