#!/usr/bin/env python3
"""
DQ3R ROM Analysis Tool
Performs initial analysis of Dragon Quest III ROM files
Based on FFMQ-Info project structure
"""

import os
import sys
import argparse
import struct
import json
import math
from pathlib import Path
from typing import Dict, List, Any, Optional

class ROMAnalyzer:
	"""Analyzes SNES ROM files for Dragon Quest III"""

	def __init__(self, rom_path: str):
		"""Initialize analyzer with ROM file path"""
		self.rom_path = Path(rom_path)
		self.rom_data: Optional[bytes] = None
		self.rom_size: int = 0
		self.analysis: Dict[str, Any] = {}

	def load_rom(self) -> bool:
		"""Load ROM file into memory"""
		try:
			if not self.rom_path.exists():
				print(f"❌ ROM file not found: {self.rom_path}")
				return False

			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()

			self.rom_size = len(self.rom_data)
			print(f"✅ Loaded ROM: {self.rom_path.name}")
			print(f"   Size: {self.rom_size:,} bytes ({self.rom_size / 1024:.1f} KB)")

			return True

		except Exception as e:
			print(f"❌ Failed to load ROM: {e}")
			return False

	def detect_rom_type(self) -> Dict[str, Any]:
		"""Detect ROM header and configuration"""
		if not self.rom_data:
			return {}

		# Check for SNES header at common locations
		header_locations = [0x7FC0, 0xFFC0, 0x81C0, 0x101C0]  # LoROM/HiROM variants

		best_header = None
		best_score = 0

		for offset in header_locations:
			if offset + 32 > len(self.rom_data):
				continue

			# Read potential header
			header_data = self.rom_data[offset:offset + 32]
			score = self.validate_snes_header(header_data)

			if score > best_score:
				best_score = score
				best_header = {
					'offset': offset,
					'data': header_data,
					'score': score
				}

		if best_header:
			return self.parse_snes_header(best_header)
		else:
			return {'type': 'unknown', 'confidence': 0}

	def validate_snes_header(self, header_data: bytes) -> int:
		"""Validate SNES header and return confidence score"""
		if len(header_data) < 32:
			return 0

		score = 0

		# Check game title (bytes 0-20) - should be printable ASCII/Shift-JIS
		title = header_data[0:21]
		printable_chars = sum(1 for b in title if 0x20 <= b <= 0x7E or b == 0x00)
		if printable_chars >= 15:  # Most characters should be printable
			score += 30

		# Check map mode (byte 21) - common values
		map_mode = header_data[21]
		if map_mode in [0x20, 0x21, 0x23, 0x30, 0x31]:  # Common SNES map modes
			score += 20

		# Check cart type (byte 22)
		cart_type = header_data[22]
		if cart_type in [0x00, 0x01, 0x02, 0x03, 0x05, 0x1A]:  # Common cart types
			score += 15

		# Check ROM size (byte 23) - should be reasonable
		rom_size = header_data[23]
		if 0x07 <= rom_size <= 0x0D:  # 128KB to 8MB range
			score += 15

		# Check RAM size (byte 24)
		ram_size = header_data[24]
		if ram_size in [0x00, 0x01, 0x02, 0x03, 0x05]:  # Common RAM sizes
			score += 10

		# Check country code (byte 25)
		country = header_data[25]
		if country in [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09]:
			score += 5

		# Check version (byte 27) - usually 0x00 or low values
		version = header_data[27]
		if version <= 0x03:
			score += 5

		return score

	def parse_snes_header(self, header_info: Dict) -> Dict[str, Any]:
		"""Parse SNES header information"""
		data = header_info['data']
		offset = header_info['offset']

		# Determine ROM mapping
		rom_type = "LoROM" if offset in [0x7FC0, 0x81C0] else "HiROM"

		# Parse header fields
		title_bytes = data[0:21]
		title = title_bytes.decode('ascii', errors='ignore').rstrip('\x00 ')

		map_mode = data[21]
		cart_type = data[22]
		rom_size_code = data[23]
		ram_size_code = data[24]
		country_code = data[25]
		license_code = data[26]
		version = data[27]

		# Calculate checksums
		checksum_complement = struct.unpack('<H', data[28:30])[0]
		checksum = struct.unpack('<H', data[30:32])[0]

		# Calculate actual ROM size
		if rom_size_code <= 0x0D:
			actual_rom_size = 1024 << rom_size_code  # 2^(rom_size_code + 10)
		else:
			actual_rom_size = self.rom_size

		return {
			'type': 'SNES',
			'mapping': rom_type,
			'header_offset': f"0x{offset:06X}",
			'title': title,
			'map_mode': f"0x{map_mode:02X}",
			'cart_type': f"0x{cart_type:02X}",
			'rom_size_code': f"0x{rom_size_code:02X}",
			'calculated_size': actual_rom_size,
			'ram_size_code': f"0x{ram_size_code:02X}",
			'country_code': f"0x{country_code:02X}",
			'license_code': f"0x{license_code:02X}",
			'version': version,
			'checksum_complement': f"0x{checksum_complement:04X}",
			'checksum': f"0x{checksum:04X}",
			'confidence': header_info['score']
		}

	def find_text_patterns(self) -> List[Dict[str, Any]]:
		"""Find potential text strings in ROM"""
		if not self.rom_data:
			return []

		# Look for Shift-JIS text patterns (common in Japanese games)
		# Also look for ASCII text
		text_regions = []

		# Simple heuristic: find sequences of printable characters
		min_length = 8
		current_text = bytearray()
		start_offset = 0

		for i, byte in enumerate(self.rom_data):
			# Check if byte could be part of text
			if (0x20 <= byte <= 0x7E or  # ASCII printable
				0x81 <= byte <= 0x9F or  # Shift-JIS first byte range 1
				0xE0 <= byte <= 0xFC or  # Shift-JIS first byte range 2
				byte in [0x0A, 0x0D, 0x00]):  # Control characters

				if not current_text:
					start_offset = i
				current_text.append(byte)
			else:
				# End of potential text sequence
				if len(current_text) >= min_length:
					# Filter out sequences that are mostly null bytes
					non_null = sum(1 for b in current_text if b != 0x00)
					if non_null >= len(current_text) * 0.5:
						text_regions.append({
							'offset': f"0x{start_offset:06X}",
							'length': len(current_text),
							'data': bytes(current_text),
							'preview': self.safe_decode(bytes(current_text[:32]))
						})
				current_text = bytearray()

		# Sort by length (largest first) and take top candidates
		text_regions.sort(key=lambda x: x['length'], reverse=True)
		return text_regions[:50]  # Return top 50 text candidates

	def safe_decode(self, data: bytes) -> str:
		"""Safely decode bytes to string for preview"""
		try:
			# Try ASCII first
			return data.decode('ascii', errors='ignore').strip('\x00\n\r ')
		except:
			# Fallback to showing hex
			return ' '.join(f"{b:02X}" for b in data[:16]) + "..."

	def find_graphics_patterns(self) -> List[Dict[str, Any]]:
		"""Find potential graphics data patterns"""
		if not self.rom_data:
			return []

		graphics_regions = []

		# Look for patterns typical of SNES graphics
		# SNES uses 2bpp, 4bpp, 8bpp formats

		# Simple heuristic: find regions with balanced bit patterns
		chunk_size = 128  # Analyze in 128-byte chunks

		for offset in range(0, len(self.rom_data) - chunk_size, chunk_size):
			chunk = self.rom_data[offset:offset + chunk_size]

			# Calculate entropy (rough measure of randomness)
			byte_counts = [0] * 256
			for byte in chunk:
				byte_counts[byte] += 1

			# Calculate simple entropy measure
			entropy = 0
			for count in byte_counts:
				if count > 0:
					prob = count / len(chunk)
					entropy -= prob * math.log2(prob)

			# Graphics typically have medium entropy (not all zeros, not random)
			if 4.0 <= entropy <= 7.0:
				graphics_regions.append({
					'offset': f"0x{offset:06X}",
					'length': chunk_size,
					'entropy': entropy,
					'pattern_type': 'potential_graphics'
				})

		# Sort by entropy (medium values first)
		graphics_regions.sort(key=lambda x: abs(x['entropy'] - 5.5))
		return graphics_regions[:20]  # Return top 20 candidates

	def analyze(self) -> Dict[str, Any]:
		"""Perform complete ROM analysis"""
		if not self.load_rom():
			return {}

		print("\n🔍 Analyzing ROM structure...")

		# Basic ROM information
		self.analysis = {
			'file_info': {
				'filename': self.rom_path.name,
				'size_bytes': self.rom_size,
				'size_kb': round(self.rom_size / 1024, 1),
				'size_mb': round(self.rom_size / (1024 * 1024), 2)
			}
		}

		# ROM type detection
		print("   Detecting ROM type...")
		self.analysis['rom_type'] = self.detect_rom_type()

		# Text analysis
		print("   Searching for text patterns...")
		self.analysis['text_regions'] = self.find_text_patterns()
		print(f"   Found {len(self.analysis['text_regions'])} potential text regions")

		# Graphics analysis
		print("   Searching for graphics patterns...")
		self.analysis['graphics_regions'] = self.find_graphics_patterns()
		print(f"   Found {len(self.analysis['graphics_regions'])} potential graphics regions")

		print("✅ Analysis complete!")
		return self.analysis

	def save_analysis(self, output_path: str) -> bool:
		"""Save analysis results to JSON file"""
		try:
			# Convert bytes to hex strings for JSON serialization
			analysis_copy = self.analysis.copy()

			# Convert text data to hex strings
			for region in analysis_copy.get('text_regions', []):
				if 'data' in region:
					region['data_hex'] = region['data'].hex()
					del region['data']

			with open(output_path, 'w', encoding='utf-8') as f:
				json.dump(analysis_copy, f, indent=2, ensure_ascii=False)

			print(f"💾 Analysis saved to: {output_path}")
			return True

		except Exception as e:
			print(f"❌ Failed to save analysis: {e}")
			return False

def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description='Analyze Dragon Quest III ROM files',
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  python analyze_rom.py static/dq3.smc
  python analyze_rom.py static/dq3.smc -o analysis/dq3_analysis.json
  python analyze_rom.py static/dq3.smc --verbose
		"""
	)

	parser.add_argument('rom_file',
		help='Path to ROM file to analyze')
	parser.add_argument('-o', '--output',
		help='Output file for analysis results (JSON format)')
	parser.add_argument('--verbose', '-v', action='store_true',
		help='Show verbose analysis output')

	args = parser.parse_args()

	# Check if ROM file exists
	rom_path = Path(args.rom_file)
	if not rom_path.exists():
		print(f"❌ ROM file not found: {rom_path}")
		sys.exit(1)

	# Perform analysis
	analyzer = ROMAnalyzer(str(rom_path))
	results = analyzer.analyze()

	if not results:
		print("❌ Analysis failed")
		sys.exit(1)

	# Display results
	print(f"\n📊 Analysis Results for {results['file_info']['filename']}")
	print("=" * 60)

	# File information
	info = results['file_info']
	print(f"📁 File Size: {info['size_bytes']:,} bytes ({info['size_kb']} KB)")

	# ROM type information
	rom_info = results['rom_type']
	if rom_info.get('type') == 'SNES':
		print(f"🎮 ROM Type: {rom_info['mapping']} SNES")
		print(f"📛 Title: {rom_info['title']}")
		print(f"🔧 Header: {rom_info['header_offset']}")
		if args.verbose:
			print(f"   Map Mode: {rom_info['map_mode']}")
			print(f"   Cart Type: {rom_info['cart_type']}")
			print(f"   Version: {rom_info['version']}")
			print(f"   Checksum: {rom_info['checksum']}")
	else:
		print(f"❓ ROM Type: {rom_info.get('type', 'Unknown')}")

	# Text regions
	text_regions = results['text_regions']
	print(f"\n💬 Text Regions: {len(text_regions)} found")
	if text_regions and args.verbose:
		for i, region in enumerate(text_regions[:5]):  # Show top 5
			print(f"   {i+1}. {region['offset']}: {region['preview']}")

	# Graphics regions
	graphics_regions = results['graphics_regions']
	print(f"🎨 Graphics Regions: {len(graphics_regions)} potential areas found")

	# Save analysis if requested
	if args.output:
		analyzer.save_analysis(args.output)
	elif not args.verbose:
		# Suggest saving for detailed analysis
		suggested_name = f"analysis/{rom_path.stem}_analysis.json"
		print(f"\n💡 Tip: Save detailed analysis with -o {suggested_name}")

	print(f"\n🎯 Next Steps:")
	print(f"   • Review text regions for dialog extraction")
	print(f"   • Analyze graphics patterns for tile extraction")
	print(f"   • Use Diztinguish for detailed disassembly")
	print(f"   • Extract game data tables and structures")

if __name__ == '__main__':
	main()
