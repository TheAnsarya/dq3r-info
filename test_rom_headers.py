#!/usr/bin/env python3
"""
Test multiple ROM files to find correct header format
"""

import struct

def test_rom_header(rom_path):
    """Test ROM header at different locations."""
    try:
        with open(rom_path, 'rb') as f:
            rom_data = f.read()
    except FileNotFoundError:
        print(f"File not found: {rom_path}")
        return

    print(f"\n=== Testing {rom_path} ===")
    print(f"Size: {len(rom_data):,} bytes")

    # Check for SMC header
    header_offset = 512 if len(rom_data) % 1024 == 512 else 0
    if header_offset:
        print("SMC header detected")
        rom_data = rom_data[header_offset:]

    # Test different header locations
    locations = [
        (0x7FC0, "LoROM"),
        (0xFFC0, "HiROM"),
        (0x40FFC0, "HiROM High")
    ]

    for pos, rom_type in locations:
        if pos + 32 > len(rom_data):
            continue

        print(f"\n{rom_type} header at 0x{pos:06X}:")

        # Title
        title_data = rom_data[pos:pos+21]
        title = title_data.decode('ascii', errors='replace').rstrip('\x00 ')
        print(f"  Title: '{title}'")

        # ROM makeup
        makeup = rom_data[pos + 21]
        print(f"  Makeup: 0x{makeup:02X}")

        # ROM size
        size_code = rom_data[pos + 22]
        print(f"  Size code: 0x{size_code:02X}")

        # Region
        region = rom_data[pos + 23]
        print(f"  Region: 0x{region:02X}")

        # Check if this looks like a valid header
        if makeup < 0x10 and size_code <= 13 and region < 0x20:
            print(f"  *** VALID HEADER CANDIDATE ***")

            # Show interrupt vectors
            vector_pos = pos + 0x20  # Vectors are 0x20 bytes after header start
            if vector_pos + 32 <= len(rom_data):
                vectors = struct.unpack('<16H', rom_data[vector_pos:vector_pos + 32])
                print(f"    Reset Vector: 0x{vectors[15]:04X}")
                print(f"    NMI Vector:   0x{vectors[13]:04X}")
                print(f"    IRQ Vector:   0x{vectors[14]:04X}")

# Test all ROM files
roms = [
    'static/Dragon Quest III - Soshite Densetsu he... (J).smc',
    'static/Dragon Quest III - english.smc',
    'static/Dragon Quest III - english (patched).smc'
]

for rom in roms:
    test_rom_header(rom)
