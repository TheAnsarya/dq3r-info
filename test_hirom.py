#!/usr/bin/env python3
"""Quick test of HiROM address translation fix"""

import sys
import os
sys.path.insert(0, os.path.join('.', 'tools', 'utils'))

from snes_address_translation import SNESAddressTranslator

def test_hirom_translation():
    translator = SNESAddressTranslator()

    print("🔧 Testing HiROM Address Translation Correction:")
    print("=" * 50)

    # Test known HiROM addresses
    test_addresses = [
        '$C0:0000',  # Should be ROM $000000
        '$C1:0000',  # Should be ROM $010000
        '$C2:0000',  # Should be ROM $020000
        '$FF:FFFF',  # Should be ROM $3FFFFF
        '$40:0000',  # Should be ROM $000000
        '$7F:FFFF',  # Should be ROM $3FFFFF
    ]

    for addr_str in test_addresses:
        try:
            offset = translator.snes_to_rom_offset(addr_str)
            print(f"  {addr_str} -> ROM ${offset:06X}")
        except Exception as e:
            print(f"  {addr_str} -> ERROR: {e}")

    print("\n✅ HiROM translation test complete!")

if __name__ == "__main__":
    test_hirom_translation()
