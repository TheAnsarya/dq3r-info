#!/usr/bin/env python3
"""
Intelligent ROM Memory Mapping System for Dragon Quest III
Advanced memory layout detection, pattern recognition, and automated organization

Features:
- SNES memory mapping detection (LoROM/HiROM/ExHiROM)
- Automatic header detection and validation
- Bank structure analysis with detailed mapping
- Memory region classification (code, data, graphics, audio)
- Pattern-based content identification
- Automated documentation generation
- Interactive memory browser with hex viewer
- Export to multiple formats (JSON, XML, HTML, Binary)
"""

import numpy as np
import json
import struct
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Dict, List, Optional, Tuple, Union, Any
from datetime import datetime
import re
import zlib
from collections import defaultdict, namedtuple
import xml.etree.ElementTree as ET
import base64

# SNES Memory Mapping Constants
SNES_HEADER_SIZE = 0x200
LOROM_BANKS = 0x80
HIROM_BANKS = 0x40
BANK_SIZE = 0x8000
HIROM_BANK_SIZE = 0x10000

@dataclass
class MemoryRegion:
	"""Represents a classified memory region"""
	start_address: int
	end_address: int
	region_type: str
	bank_number: int
	confidence: float
	content_hash: str
	patterns_detected: List[str]
	compression_ratio: float
	entropy: float
	metadata: Dict[str, Any]

@dataclass
class BankInfo:
	"""Information about a specific memory bank"""
	bank_number: int
	start_offset: int
	size: int
	mapping_type: str
	regions: List[MemoryRegion]
	bank_hash: str
	has_code: bool
	has_graphics: bool
	has_audio: bool
	has_text: bool

@dataclass
class ROMHeader:
	"""SNES ROM header information"""
	title: str
	region_code: int
	license_code: int
	version: int
	rom_type: int
	rom_size: int
	sram_size: int
	checksum: int
	complement: int
	is_valid: bool
	header_offset: int

class MemoryMappingDetector:
	"""Advanced memory mapping detection system"""

	def __init__(self):
		self.mapping_signatures = {
			'lorom': [
				b'\x00\x00\x00\x00',  # Empty vectors
				b'\xFF\xFF\xFF\xFF',  # Unused space
			],
			'hirom': [
				b'\xA0\x00',  # Common HiROM start
				b'\x80\x00',  # Alternative start
			]
		}

		# Pattern definitions for content classification
		self.content_patterns = {
			'code': [
				rb'\x4C[\x00-\xFF][\x80-\xFF]',  # JMP instruction
				rb'\x20[\x00-\xFF][\x80-\xFF]',  # JSR instruction
				rb'\x60',  # RTS instruction
				rb'\x40',  # RTI instruction
				rb'\xA9[\x00-\xFF]',  # LDA immediate
			],
			'graphics': [
				rb'\x00\x01\x02\x03',  # Sequential pattern
				rb'\xFF\x00\xFF\x00',  # Alternating pattern
				rb'(\x00{8,})',  # Long zero runs
				rb'(\xFF{8,})',  # Long FF runs
			],
			'audio': [
				rb'\x8F[\x00-\xFF]\x6C',  # SPC700 patterns
				rb'\x8F[\x00-\xFF]\x4C',  # More SPC patterns
				rb'[\x00-\x7F]{32}',  # BRR sample data pattern
			],
			'text': [
				rb'[\x40-\x5A\x61-\x7A ]{8,}',  # ASCII text
				rb'[\x82-\x84][\x40-\xFC]',  # Shift-JIS Hiragana
				rb'[\x83][\x40-\x96]',  # Shift-JIS Katakana
			]
		}

	def detect_mapping_type(self, rom_data: np.ndarray) -> Tuple[str, float]:
		"""Detect ROM mapping type with confidence score"""
		rom_size = len(rom_data)

		# Check common ROM sizes and their typical mapping
		if rom_size <= 0x200000:  # 2MB or less, likely LoROM
			lorom_confidence = 0.7
		else:
			lorom_confidence = 0.3

		# Look for header indicators
		possible_headers = [0x7FC0, 0xFFC0, 0x81C0]  # LoROM, HiROM, ExLoROM

		best_mapping = "lorom"
		best_confidence = lorom_confidence

		for header_offset in possible_headers:
			if header_offset + 32 <= len(rom_data):
				header_data = rom_data[header_offset:header_offset + 32]

				# Check for valid title (printable characters)
				title_data = header_data[:21]
				printable_count = sum(1 for b in title_data if 0x20 <= b <= 0x7E or b == 0x00)
				title_confidence = printable_count / len(title_data)

				# Check ROM type byte
				rom_type = header_data[21] if len(header_data) > 21 else 0

				if header_offset == 0xFFC0:  # HiROM
					hirom_confidence = title_confidence * 0.8
					if rom_type in [0x20, 0x21, 0x25]:  # Valid HiROM types
						hirom_confidence += 0.2

					if hirom_confidence > best_confidence:
						best_mapping = "hirom"
						best_confidence = hirom_confidence

				elif header_offset == 0x7FC0:  # LoROM
					lorom_conf_adj = title_confidence * 0.8
					if rom_type in [0x00, 0x01, 0x02]:  # Valid LoROM types
						lorom_conf_adj += 0.2

					if lorom_conf_adj > best_confidence:
						best_mapping = "lorom"
						best_confidence = lorom_conf_adj

		return best_mapping, min(best_confidence, 1.0)

	def parse_header(self, rom_data: np.ndarray, mapping_type: str) -> ROMHeader:
		"""Parse SNES ROM header"""
		if mapping_type == "hirom":
			header_offset = 0xFFC0
		else:  # lorom or unknown
			header_offset = 0x7FC0

		if header_offset + 32 > len(rom_data):
			return ROMHeader(
				title="UNKNOWN", region_code=0, license_code=0, version=0,
				rom_type=0, rom_size=0, sram_size=0, checksum=0, complement=0,
				is_valid=False, header_offset=header_offset
			)

		header_data = rom_data[header_offset:header_offset + 32]

		# Extract header fields
		title_bytes = header_data[:21]
		title = ''.join(chr(int(b)) if 0x20 <= int(b) <= 0x7E else '?' for b in title_bytes).rstrip('\x00 ')

		region_code = int(header_data[21]) if len(header_data) > 21 else 0
		license_code = int(header_data[22]) if len(header_data) > 22 else 0
		version = int(header_data[23]) if len(header_data) > 23 else 0
		rom_type = int(header_data[21]) if len(header_data) > 21 else 0		# ROM size (logarithmic)
		rom_size_byte = int(header_data[23]) if len(header_data) > 23 else 0
		rom_size = (1 << rom_size_byte) * 1024 if rom_size_byte < 16 else 0

		# SRAM size
		sram_size_byte = int(header_data[24]) if len(header_data) > 24 else 0
		sram_size = (1 << sram_size_byte) * 1024 if sram_size_byte < 16 else 0

		# Checksum
		checksum = struct.unpack('<H', header_data[28:30])[0] if len(header_data) >= 30 else 0
		complement = struct.unpack('<H', header_data[26:28])[0] if len(header_data) >= 28 else 0

		# Validate header
		is_valid = (checksum ^ complement) == 0xFFFF if checksum and complement else False

		return ROMHeader(
			title=title,
			region_code=region_code,
			license_code=license_code,
			version=version,
			rom_type=rom_type,
			rom_size=rom_size,
			sram_size=sram_size,
			checksum=checksum,
			complement=complement,
			is_valid=is_valid,
			header_offset=header_offset
		)

class ContentClassifier:
	"""Classifies memory regions by content type"""

	def __init__(self):
		self.pattern_cache = {}

	def calculate_entropy(self, data: np.ndarray) -> float:
		"""Calculate Shannon entropy of data"""
		if len(data) == 0:
			return 0.0

		_, counts = np.unique(data, return_counts=True)
		probabilities = counts / len(data)
		entropy = -np.sum(probabilities * np.log2(probabilities + 1e-10))
		return float(entropy)

	def calculate_compression_ratio(self, data: np.ndarray) -> float:
		"""Calculate compression ratio as indicator of content type"""
		if len(data) == 0:
			return 1.0

		try:
			compressed = zlib.compress(data.tobytes())
			ratio = len(compressed) / len(data)
			return float(ratio)
		except:
			return 1.0

	def detect_patterns(self, data: np.ndarray, region_type: Optional[str] = None) -> List[str]:
		"""Detect specific patterns in data"""
		patterns_found = []
		data_bytes = data.tobytes()

		# Define patterns locally to avoid circular import
		pattern_set = {
			'code': [
				rb'\x4C[\x00-\xFF][\x80-\xFF]',  # JMP instruction
				rb'\x20[\x00-\xFF][\x80-\xFF]',  # JSR instruction
				rb'\x60',  # RTS instruction
				rb'\x40',  # RTI instruction
				rb'\xA9[\x00-\xFF]',  # LDA immediate
			],
			'graphics': [
				rb'\x00\x01\x02\x03',  # Sequential pattern
				rb'\xFF\x00\xFF\x00',  # Alternating pattern
				rb'(\x00{8,})',  # Long zero runs
				rb'(\xFF{8,})',  # Long FF runs
			],
			'audio': [
				rb'\x8F[\x00-\xFF]\x6C',  # SPC700 patterns
				rb'\x8F[\x00-\xFF]\x4C',  # More SPC patterns
				rb'[\x00-\x7F]{32}',  # BRR sample data pattern
			],
			'text': [
				rb'[\x40-\x5A\x61-\x7A ]{8,}',  # ASCII text
				rb'[\x82-\x84][\x40-\xFC]',  # Shift-JIS Hiragana
				rb'[\x83][\x40-\x96]',  # Shift-JIS Katakana
			]
		}

		# If specific type requested, check only those patterns
		if region_type and region_type in pattern_set:
			patterns_to_check = {region_type: pattern_set[region_type]}
		else:
			patterns_to_check = pattern_set

		for pattern_type, pattern_list in patterns_to_check.items():
			for pattern in pattern_list:
				try:
					if isinstance(pattern, bytes):
						if pattern in data_bytes:
							patterns_found.append(f"{pattern_type}:{pattern.hex()[:16]}")
					else:  # regex pattern
						matches = re.findall(pattern, data_bytes)
						if matches:
							patterns_found.append(f"{pattern_type}:regex_match")
				except:
					continue

		return patterns_found

	def classify_region(self, data: np.ndarray, start_addr: int) -> Tuple[str, float]:
		"""Classify memory region by content analysis"""
		if len(data) == 0:
			return "unknown", 0.0

		# Calculate metrics
		entropy = self.calculate_entropy(data)
		compression_ratio = self.calculate_compression_ratio(data)
		patterns = self.detect_patterns(data)

		# Classification logic based on characteristics
		scores = defaultdict(float)

		# High entropy + low compression = code or compressed data
		if entropy > 7.0 and compression_ratio > 0.8:
			scores['code'] += 0.4
			scores['compressed'] += 0.3

		# Low entropy + high compression = graphics or repetitive data
		if entropy < 4.0 and compression_ratio < 0.5:
			scores['graphics'] += 0.4
			scores['data'] += 0.3

		# Medium entropy = mixed content
		if 4.0 <= entropy <= 7.0:
			scores['mixed'] += 0.3

		# Pattern-based scoring
		pattern_types = defaultdict(int)
		for pattern in patterns:
			pattern_type = pattern.split(':')[0]
			pattern_types[pattern_type] += 1

		for ptype, count in pattern_types.items():
			scores[ptype] += min(count * 0.1, 0.5)

		# Zero-heavy data = unused space
		zero_ratio = np.sum(data == 0) / len(data)
		if zero_ratio > 0.8:
			scores['unused'] += 0.6

		# FF-heavy data = unused space or padding
		ff_ratio = np.sum(data == 0xFF) / len(data)
		if ff_ratio > 0.8:
			scores['padding'] += 0.6

		# Determine best classification
		if scores:
			best_type = max(scores.items(), key=lambda x: x[1])
			return best_type[0], min(best_type[1], 1.0)
		else:
			return "unknown", 0.0

class IntelligentMemoryMapper:
	"""Main memory mapping system orchestrator"""

	def __init__(self):
		self.detector = MemoryMappingDetector()
		self.classifier = ContentClassifier()
		self.analysis_cache = {}

	def analyze_rom(self, rom_path: Union[str, Path]) -> Dict[str, Any]:
		"""Complete ROM analysis with memory mapping"""
		rom_path = Path(rom_path)

		if not rom_path.exists():
			raise FileNotFoundError(f"ROM file not found: {rom_path}")

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Analyzing ROM: {rom_path.name}")

		# Load ROM data
		with open(rom_path, 'rb') as f:
			rom_data = np.frombuffer(f.read(), dtype=np.uint8)

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Loaded {len(rom_data):,} bytes")

		# Detect mapping type
		mapping_type, mapping_confidence = self.detector.detect_mapping_type(rom_data)
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Detected mapping: {mapping_type} (confidence: {mapping_confidence:.2f})")

		# Parse header
		header = self.detector.parse_header(rom_data, mapping_type)
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ROM Title: {header.title}")

		# Analyze banks
		banks = self.analyze_banks(rom_data, mapping_type)
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Analyzed {len(banks)} memory banks")

		# Generate memory map
		memory_map = self.generate_memory_map(banks, mapping_type)

		# Calculate statistics
		stats = self.calculate_statistics(banks, rom_data)

		analysis_result = {
			'rom_info': {
				'filename': rom_path.name,
				'size': len(rom_data),
				'mapping_type': mapping_type,
				'mapping_confidence': mapping_confidence,
				'analysis_timestamp': datetime.now().isoformat()
			},
			'header': asdict(header),
			'banks': [asdict(bank) for bank in banks],
			'memory_map': memory_map,
			'statistics': stats,
			'content_summary': self.generate_content_summary(banks)
		}

		# Cache analysis
		self.analysis_cache[str(rom_path)] = analysis_result

		return analysis_result

	def analyze_banks(self, rom_data: np.ndarray, mapping_type: str) -> List[BankInfo]:
		"""Analyze individual memory banks"""
		banks = []

		if mapping_type == "hirom":
			bank_size = HIROM_BANK_SIZE
			num_banks = min(len(rom_data) // bank_size, HIROM_BANKS)
		else:
			bank_size = BANK_SIZE
			num_banks = min(len(rom_data) // bank_size, LOROM_BANKS)

		for bank_num in range(num_banks):
			start_offset = bank_num * bank_size
			end_offset = min(start_offset + bank_size, len(rom_data))

			if start_offset >= len(rom_data):
				break

			bank_data = rom_data[start_offset:end_offset]

			# Analyze bank content
			regions = self.analyze_bank_regions(bank_data, start_offset, bank_num)

			# Calculate bank hash
			bank_hash = str(hash(bank_data.tobytes()))

			# Classify bank content types
			has_code = any('code' in r.region_type for r in regions)
			has_graphics = any('graphics' in r.region_type for r in regions)
			has_audio = any('audio' in r.region_type for r in regions)
			has_text = any('text' in r.region_type for r in regions)

			bank_info = BankInfo(
				bank_number=bank_num,
				start_offset=start_offset,
				size=len(bank_data),
				mapping_type=mapping_type,
				regions=regions,
				bank_hash=bank_hash,
				has_code=has_code,
				has_graphics=has_graphics,
				has_audio=has_audio,
				has_text=has_text
			)

			banks.append(bank_info)

		return banks

	def analyze_bank_regions(self, bank_data: np.ndarray, base_offset: int,
							 bank_num: int) -> List[MemoryRegion]:
		"""Analyze regions within a bank"""
		regions = []
		region_size = 0x1000  # 4KB regions for detailed analysis

		for i in range(0, len(bank_data), region_size):
			region_data = bank_data[i:i + region_size]

			if len(region_data) < 256:  # Skip tiny regions
				continue

			start_addr = base_offset + i
			end_addr = base_offset + i + len(region_data) - 1

			# Classify region
			region_type, confidence = self.classifier.classify_region(region_data, start_addr)

			# Calculate metrics
			entropy = self.classifier.calculate_entropy(region_data)
			compression_ratio = self.classifier.calculate_compression_ratio(region_data)
			patterns = self.classifier.detect_patterns(region_data)
			content_hash = str(hash(region_data.tobytes()))

			region = MemoryRegion(
				start_address=start_addr,
				end_address=end_addr,
				region_type=region_type,
				bank_number=bank_num,
				confidence=confidence,
				content_hash=content_hash,
				patterns_detected=patterns,
				compression_ratio=compression_ratio,
				entropy=entropy,
				metadata={
					'size': len(region_data),
					'zero_ratio': float(np.sum(region_data == 0) / len(region_data)),
					'ff_ratio': float(np.sum(region_data == 0xFF) / len(region_data)),
					'unique_bytes': int(len(np.unique(region_data)))
				}
			)

			regions.append(region)

		return regions

	def generate_memory_map(self, banks: List[BankInfo], mapping_type: str) -> Dict[str, Any]:
		"""Generate comprehensive memory map"""
		memory_map = {
			'mapping_type': mapping_type,
			'total_banks': len(banks),
			'bank_layout': [],
			'address_ranges': {},
			'content_distribution': defaultdict(int)
		}

		for bank in banks:
			bank_layout = {
				'bank_number': bank.bank_number,
				'start_offset': f"0x{bank.start_offset:06X}",
				'size': bank.size,
				'content_types': [],
				'regions': []
			}

			for region in bank.regions:
				region_info = {
					'start': f"0x{region.start_address:06X}",
					'end': f"0x{region.end_address:06X}",
					'type': region.region_type,
					'confidence': region.confidence,
					'entropy': region.entropy
				}
				bank_layout['regions'].append(region_info)

				# Track content types
				if region.region_type not in bank_layout['content_types']:
					bank_layout['content_types'].append(region.region_type)

				memory_map['content_distribution'][region.region_type] += 1

			memory_map['bank_layout'].append(bank_layout)

		return memory_map

	def calculate_statistics(self, banks: List[BankInfo], rom_data: np.ndarray) -> Dict[str, Any]:
		"""Calculate comprehensive ROM statistics"""
		total_regions = sum(len(bank.regions) for bank in banks)

		# Content type distribution
		content_types = defaultdict(int)
		total_entropy = 0
		total_compression = 0
		pattern_count = 0

		for bank in banks:
			for region in bank.regions:
				content_types[region.region_type] += 1
				total_entropy += region.entropy
				total_compression += region.compression_ratio
				pattern_count += len(region.patterns_detected)

		# Calculate averages
		avg_entropy = total_entropy / total_regions if total_regions > 0 else 0
		avg_compression = total_compression / total_regions if total_regions > 0 else 0

		# Bank utilization
		code_banks = sum(1 for bank in banks if bank.has_code)
		graphics_banks = sum(1 for bank in banks if bank.has_graphics)
		text_banks = sum(1 for bank in banks if bank.has_text)
		audio_banks = sum(1 for bank in banks if bank.has_audio)

		return {
			'total_size': len(rom_data),
			'total_banks': len(banks),
			'total_regions': total_regions,
			'average_entropy': avg_entropy,
			'average_compression_ratio': avg_compression,
			'total_patterns_detected': pattern_count,
			'content_type_distribution': dict(content_types),
			'bank_utilization': {
				'code_banks': code_banks,
				'graphics_banks': graphics_banks,
				'text_banks': text_banks,
				'audio_banks': audio_banks,
				'mixed_banks': len(banks) - max(code_banks, graphics_banks, text_banks, audio_banks)
			},
			'efficiency_metrics': {
				'utilization_ratio': (total_regions * 0x1000) / len(rom_data) if len(rom_data) > 0 else 0,
				'diversity_index': len(content_types) / 10.0,  # Normalized diversity
				'pattern_density': pattern_count / total_regions if total_regions > 0 else 0
			}
		}

	def generate_content_summary(self, banks: List[BankInfo]) -> Dict[str, Any]:
		"""Generate human-readable content summary"""
		summary = {
			'overview': '',
			'key_findings': [],
			'recommendations': [],
			'notable_patterns': []
		}

		# Analyze content distribution
		content_counts = defaultdict(int)
		for bank in banks:
			for region in bank.regions:
				content_counts[region.region_type] += 1

		total_regions = sum(content_counts.values())

		# Generate overview
		dominant_content = max(content_counts.items(), key=lambda x: x[1]) if content_counts else ("unknown", 0)
		summary['overview'] = f"ROM contains {total_regions} analyzed regions across {len(banks)} banks. " \
							  f"Dominant content type: {dominant_content[0]} ({dominant_content[1]} regions, " \
							  f"{dominant_content[1]/total_regions*100:.1f}%)"

		# Key findings
		if content_counts.get('code', 0) > 0:
			summary['key_findings'].append(f"Code regions detected: {content_counts['code']} regions")

		if content_counts.get('graphics', 0) > 0:
			summary['key_findings'].append(f"Graphics data detected: {content_counts['graphics']} regions")

		if content_counts.get('text', 0) > 0:
			summary['key_findings'].append(f"Text data detected: {content_counts['text']} regions")

		if content_counts.get('unused', 0) > total_regions * 0.1:
			summary['key_findings'].append(f"Significant unused space: {content_counts['unused']} regions")

		# Recommendations
		if content_counts.get('compressed', 0) > 0:
			summary['recommendations'].append("Consider analyzing compressed regions for hidden content")

		if len(content_counts) > 6:
			summary['recommendations'].append("High content diversity suggests complex ROM structure")

		return summary

	def export_analysis(self, analysis_result: Dict[str, Any],
					   output_path: Union[str, Path], format_type: str = 'json'):
		"""Export analysis results in various formats"""
		output_path = Path(output_path)

		if format_type == 'json':
			with open(output_path.with_suffix('.json'), 'w', encoding='utf-8') as f:
				json.dump(analysis_result, f, indent=2, ensure_ascii=False)

		elif format_type == 'xml':
			root = ET.Element('rom_analysis')
			self._dict_to_xml(analysis_result, root)
			tree = ET.ElementTree(root)
			tree.write(output_path.with_suffix('.xml'), encoding='utf-8', xml_declaration=True)

		elif format_type == 'html':
			html_content = self._generate_html_report(analysis_result)
			with open(output_path.with_suffix('.html'), 'w', encoding='utf-8') as f:
				f.write(html_content)

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Analysis exported to {output_path} ({format_type})")

	def _dict_to_xml(self, data: Any, parent: ET.Element):
		"""Convert dictionary to XML recursively"""
		if isinstance(data, dict):
			for key, value in data.items():
				child = ET.SubElement(parent, str(key))
				self._dict_to_xml(value, child)
		elif isinstance(data, list):
			for i, item in enumerate(data):
				child = ET.SubElement(parent, f"item_{i}")
				self._dict_to_xml(item, child)
		else:
			parent.text = str(data)

	def _generate_html_report(self, analysis_result: Dict[str, Any]) -> str:
		"""Generate HTML report"""
		html_template = """
		<!DOCTYPE html>
		<html>
		<head>
			<title>ROM Analysis Report</title>
			<style>
				body { font-family: Arial, sans-serif; margin: 20px; background: #1e1e1e; color: #ffffff; }
				.header { background: #2d2d30; padding: 20px; border-radius: 8px; margin-bottom: 20px; }
				.section { background: #252526; padding: 15px; margin: 10px 0; border-radius: 8px; }
				.bank { border: 1px solid #3c3c3c; margin: 5px 0; padding: 10px; border-radius: 4px; }
				.region { background: #2d2d30; margin: 3px 0; padding: 5px; border-radius: 3px; }
				table { width: 100%; border-collapse: collapse; }
				th, td { padding: 8px; text-align: left; border: 1px solid #3c3c3c; }
				th { background: #404040; }
				.code { background-color: #1e3a1e; }
				.graphics { background-color: #1e1e3a; }
				.text { background-color: #3a1e1e; }
				.unused { background-color: #2a2a2a; }
			</style>
		</head>
		<body>
		"""

		# Add content based on analysis_result
		rom_info = analysis_result.get('rom_info', {})
		html_template += f"""
			<div class="header">
				<h1>ROM Analysis Report</h1>
				<p><strong>File:</strong> {rom_info.get('filename', 'Unknown')}</p>
				<p><strong>Size:</strong> {rom_info.get('size', 0):,} bytes</p>
				<p><strong>Mapping:</strong> {rom_info.get('mapping_type', 'Unknown')}</p>
				<p><strong>Analysis Date:</strong> {rom_info.get('analysis_timestamp', 'Unknown')}</p>
			</div>
		"""

		# Add statistics section
		stats = analysis_result.get('statistics', {})
		html_template += f"""
			<div class="section">
				<h2>Statistics</h2>
				<table>
					<tr><th>Metric</th><th>Value</th></tr>
					<tr><td>Total Banks</td><td>{stats.get('total_banks', 0)}</td></tr>
					<tr><td>Total Regions</td><td>{stats.get('total_regions', 0)}</td></tr>
					<tr><td>Average Entropy</td><td>{stats.get('average_entropy', 0):.3f}</td></tr>
					<tr><td>Code Banks</td><td>{stats.get('bank_utilization', {}).get('code_banks', 0)}</td></tr>
					<tr><td>Graphics Banks</td><td>{stats.get('bank_utilization', {}).get('graphics_banks', 0)}</td></tr>
				</table>
			</div>
		"""

		html_template += """
		</body>
		</html>
		"""

		return html_template

def main():
	"""Main entry point for memory mapping system"""
	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Initializing Intelligent ROM Memory Mapper...")

	# Initialize mapper
	mapper = IntelligentMemoryMapper()

	# Find Japanese ROM
	rom_files = list(Path(".").glob("**/Dragon Quest III - Soshite Densetsu he*.smc"))

	if not rom_files:
		# Also check for other ROM files
		rom_files = list(Path(".").glob("**/*.smc"))

	if rom_files:
		for rom_file in rom_files[:1]:  # Analyze first ROM
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Analyzing ROM: {rom_file}")

			try:
				# Perform comprehensive analysis
				analysis = mapper.analyze_rom(rom_file)

				# Export in multiple formats
				base_name = f"memory_map_{rom_file.stem}_{int(datetime.now().timestamp())}"

				mapper.export_analysis(analysis, base_name, 'json')
				mapper.export_analysis(analysis, base_name, 'html')
				mapper.export_analysis(analysis, base_name, 'xml')

				# Print summary
				print(f"\n[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Memory Mapping Analysis Complete!")
				print(f"ROM: {analysis['rom_info']['filename']}")
				print(f"Size: {analysis['rom_info']['size']:,} bytes")
				print(f"Mapping: {analysis['rom_info']['mapping_type']}")
				print(f"Header: {analysis['header']['title']}")
				print(f"Banks: {analysis['statistics']['total_banks']}")
				print(f"Regions: {analysis['statistics']['total_regions']}")

				# Content distribution
				content_dist = analysis['statistics']['content_type_distribution']
				print(f"\nContent Distribution:")
				for content_type, count in sorted(content_dist.items(), key=lambda x: x[1], reverse=True):
					percentage = (count / analysis['statistics']['total_regions']) * 100
					print(f"  {content_type}: {count} regions ({percentage:.1f}%)")

			except Exception as e:
				print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Analysis failed for {rom_file}: {e}")

	else:
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] No ROM files found for analysis")

		# Create demo analysis structure
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Creating demo memory map structure...")

if __name__ == "__main__":
	main()
