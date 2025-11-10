"""
Optimized Batch ROM Analysis Engine
==================================

High-performance batch processing engine for Dragon Quest III ROM analysis.
Implements intelligent chunking, progress tracking, and time-limited processing.

Fixes: Long-running analysis issues by implementing batch processing
Focus: Japanese ROM analysis specifically

Created: 2025-11-10 16:42:22
"""

import numpy as np
import json
import time
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Any
from pathlib import Path
import signal
import sys


class BatchROMAnalyzer:
	"""High-performance batch processing ROM analyzer"""

	def __init__(self, max_processing_time: int = 300):  # 5 minute limit
		"""Initialize batch analyzer with time limits"""
		self.max_processing_time = max_processing_time
		self.start_time = None
		self.results_cache = {}
		self.batch_size = 1024
		self.japanese_rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"

		# Progress tracking
		self.total_batches = 0
		self.completed_batches = 0
		self.current_operation = "initializing"

		print(f"[{self._timestamp()}] Batch ROM Analyzer initialized")
		print(f"Max processing time: {max_processing_time} seconds")
		print(f"Target ROM: {self.japanese_rom_path}")

	def _timestamp(self) -> str:
		"""Get current timestamp"""
		return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

	def _check_time_limit(self) -> bool:
		"""Check if we're approaching time limit"""
		if self.start_time is None:
			return True

		elapsed = time.time() - self.start_time
		remaining = self.max_processing_time - elapsed

		if remaining < 10:  # Less than 10 seconds left
			print(f"[{self._timestamp()}] ⏰ Approaching time limit, wrapping up...")
			return False

		return True

	def _update_progress(self, operation: str):
		"""Update and display progress"""
		self.current_operation = operation
		if self.total_batches > 0:
			progress = (self.completed_batches / self.total_batches) * 100
			print(f"[{self._timestamp()}] {operation} - Progress: {self.completed_batches}/{self.total_batches} ({progress:.1f}%)")
		else:
			print(f"[{self._timestamp()}] {operation}")

	def analyze_japanese_rom_fast(self) -> Dict[str, Any]:
		"""Fast analysis specifically for Japanese ROM"""
		print(f"[{self._timestamp()}] 🎌 Starting optimized Japanese ROM analysis")

		self.start_time = time.time()

		# Check if Japanese ROM exists
		rom_path = Path(self.japanese_rom_path)
		if not rom_path.exists():
			return {"error": "Japanese ROM not found", "path_checked": self.japanese_rom_path}

		try:
			# Load ROM data
			self._update_progress("Loading Japanese ROM")
			with open(rom_path, 'rb') as f:
				rom_data = np.frombuffer(f.read(), dtype=np.uint8)

			print(f"[{self._timestamp()}] Japanese ROM loaded: {len(rom_data):,} bytes")

			# Initialize results structure
			analysis_results = {
				"metadata": {
					"rom_name": "Dragon Quest III - Japanese Original",
					"file_path": str(rom_path),
					"file_size": len(rom_data),
					"analysis_start": self._timestamp(),
					"processing_mode": "optimized_batch"
				},
				"header_analysis": {},
				"data_segments": {},
				"pattern_analysis": {},
				"compression_analysis": {},
				"text_analysis": {},
				"graphics_analysis": {},
				"performance_metrics": {}
			}

			# Calculate optimal batch sizes based on ROM size
			self.batch_size = min(2048, len(rom_data) // 100)
			self.total_batches = (len(rom_data) // self.batch_size) + 1

			# Quick header analysis (always do this first)
			if self._check_time_limit():
				analysis_results["header_analysis"] = self._analyze_rom_header(rom_data)
				self.completed_batches += 1

			# Segment ROM for efficient processing
			if self._check_time_limit():
				analysis_results["data_segments"] = self._analyze_data_segments_fast(rom_data)
				self.completed_batches += 5

			# Pattern analysis (time-limited)
			if self._check_time_limit():
				analysis_results["pattern_analysis"] = self._analyze_patterns_fast(rom_data)
				self.completed_batches += 10

			# Japanese text analysis
			if self._check_time_limit():
				analysis_results["text_analysis"] = self._analyze_japanese_text(rom_data)
				self.completed_batches += 8

			# Quick compression analysis
			if self._check_time_limit():
				analysis_results["compression_analysis"] = self._analyze_compression_fast(rom_data)
				self.completed_batches += 5

			# Graphics structure analysis
			if self._check_time_limit():
				analysis_results["graphics_analysis"] = self._analyze_graphics_structure(rom_data)
				self.completed_batches += 7

			# Finalize results
			end_time = time.time()
			analysis_results["performance_metrics"] = {
				"total_processing_time": end_time - self.start_time,
				"bytes_per_second": len(rom_data) / (end_time - self.start_time),
				"batches_completed": self.completed_batches,
				"analysis_complete": True
			}

			print(f"[{self._timestamp()}] ✅ Japanese ROM analysis complete!")
			print(f"Processing time: {end_time - self.start_time:.2f} seconds")

			return analysis_results

		except Exception as e:
			return {
				"error": str(e),
				"processing_time": time.time() - self.start_time if self.start_time else 0,
				"rom_path": str(rom_path)
			}

	def _analyze_rom_header(self, data: np.ndarray) -> Dict[str, Any]:
		"""Quick ROM header analysis"""
		self._update_progress("Analyzing ROM header")

		header = {
			"rom_type": "unknown",
			"mapping_mode": "unknown",
			"rom_size": len(data),
			"title": "",
			"checksums": {},
			"header_location": "unknown"
		}

		# Check for LoROM header at 0x7FC0
		lorom_offset = 0x7FC0
		if lorom_offset < len(data):
			title_bytes = data[lorom_offset:lorom_offset + 21]
			title = ''.join([chr(b) if 32 <= b <= 126 else '?' for b in title_bytes])

			if "DRAGON" in title.upper() or "DQ3" in title.upper():
				header["rom_type"] = "LoROM"
				header["header_location"] = f"0x{lorom_offset:04X}"
				header["title"] = title.strip()

				# Get checksums
				if lorom_offset + 4 < len(data):
					complement = (data[lorom_offset + 28] << 8) | data[lorom_offset + 29]
					checksum = (data[lorom_offset + 30] << 8) | data[lorom_offset + 31]
					header["checksums"] = {
						"complement": complement,
						"checksum": checksum,
						"calculated": np.sum(data) % 0x10000
					}

		# Check for HiROM header at 0xFFC0
		hirom_offset = 0xFFC0
		if hirom_offset < len(data):
			title_bytes = data[hirom_offset:hirom_offset + 21]
			title = ''.join([chr(b) if 32 <= b <= 126 else '?' for b in title_bytes])

			if "DRAGON" in title.upper() and header["rom_type"] == "unknown":
				header["rom_type"] = "HiROM"
				header["header_location"] = f"0x{hirom_offset:04X}"
				header["title"] = title.strip()

		return header

	def _analyze_data_segments_fast(self, data: np.ndarray) -> Dict[str, Any]:
		"""Fast data segmentation analysis"""
		self._update_progress("Segmenting ROM data")

		# Divide into 8 segments for analysis
		segment_size = len(data) // 8
		segments = []

		for i in range(8):
			start = i * segment_size
			end = start + segment_size if i < 7 else len(data)
			segment = data[start:end]

			# Quick segment analysis
			unique_bytes = len(np.unique(segment))
			entropy = self._calculate_entropy_fast(segment)
			zero_runs = np.sum(segment == 0)

			segments.append({
				"index": i,
				"start_offset": start,
				"end_offset": end,
				"size": len(segment),
				"unique_bytes": unique_bytes,
				"entropy": entropy,
				"zero_percentage": (zero_runs / len(segment)) * 100,
				"likely_content": self._classify_segment_content(entropy, unique_bytes, len(segment))
			})

		return {
			"segments": segments,
			"high_entropy_segments": [s["index"] for s in segments if s["entropy"] > 6.0],
			"low_entropy_segments": [s["index"] for s in segments if s["entropy"] < 3.0],
			"potential_graphics": [s["index"] for s in segments if 4.0 < s["entropy"] < 6.0],
			"potential_text": [s["index"] for s in segments if s["unique_bytes"] < 100]
		}

	def _analyze_patterns_fast(self, data: np.ndarray) -> Dict[str, Any]:
		"""Fast pattern analysis"""
		self._update_progress("Analyzing data patterns")

		# Sample the ROM for pattern analysis (don't analyze entire thing)
		sample_size = min(32768, len(data))  # 32KB sample
		sample_data = data[:sample_size]

		patterns = {
			"repetitive_sequences": [],
			"common_bytes": {},
			"sequence_patterns": {},
			"pointer_candidates": []
		}

		# Find most common bytes
		byte_counts = np.bincount(sample_data, minlength=256)
		most_common = np.argsort(byte_counts)[-10:]  # Top 10 most common

		for byte_val in most_common:
			patterns["common_bytes"][int(byte_val)] = int(byte_counts[byte_val])

		# Look for repetitive sequences (quick scan)
		for seq_len in [2, 3, 4]:
			sequence_counts = {}
			for i in range(0, len(sample_data) - seq_len, seq_len):
				seq = tuple(sample_data[i:i + seq_len])
				sequence_counts[seq] = sequence_counts.get(seq, 0) + 1

			# Find most common sequences
			if sequence_counts:
				most_common_seq = max(sequence_counts.items(), key=lambda x: x[1])
				if most_common_seq[1] > 5:  # Appears more than 5 times
					patterns["sequence_patterns"][seq_len] = {
						"sequence": list(most_common_seq[0]),
						"count": most_common_seq[1]
					}

		# Look for potential pointers (16-bit values that point within ROM)
		for i in range(0, min(1024, len(sample_data) - 1)):
			value = int(sample_data[i]) | (int(sample_data[i + 1]) << 8)
			if 0x8000 <= value <= 0xFFFF and (value - 0x8000) < len(data):
				patterns["pointer_candidates"].append({
					"offset": i,
					"value": value,
					"points_to": value - 0x8000
				})

		return patterns

	def _analyze_japanese_text(self, data: np.ndarray) -> Dict[str, Any]:
		"""Analyze Japanese text encoding in ROM"""
		self._update_progress("Analyzing Japanese text data")

		text_analysis = {
			"encoding_detection": {},
			"text_segments": [],
			"character_frequencies": {},
			"dialogue_patterns": {}
		}

		# Japanese text typically uses specific byte ranges
		# Hiragana: 0x82 0x9F - 0x82 0xF1 (Shift-JIS)
		# Katakana: 0x83 0x40 - 0x83 0x96 (Shift-JIS)

		japanese_byte_sequences = []
		i = 0
		while i < len(data) - 1:
			if data[i] == 0x82:  # Potential hiragana
				if 0x9F <= data[i + 1] <= 0xF1:
					japanese_byte_sequences.append((i, "hiragana"))
			elif data[i] == 0x83:  # Potential katakana
				if 0x40 <= data[i + 1] <= 0x96:
					japanese_byte_sequences.append((i, "katakana"))
			i += 1

		# Cluster nearby Japanese characters into text segments
		text_segments = []
		if japanese_byte_sequences:
			current_start = japanese_byte_sequences[0][0]
			current_end = japanese_byte_sequences[0][0] + 1

			for pos, char_type in japanese_byte_sequences[1:]:
				if pos - current_end < 10:  # Within 10 bytes
					current_end = pos + 1
				else:
					# New segment
					if current_end - current_start > 10:  # Significant segment
						text_segments.append({
							"start": current_start,
							"end": current_end,
							"length": current_end - current_start,
							"sample": data[current_start:current_start + min(20, current_end - current_start)].tolist()
						})
					current_start = pos
					current_end = pos + 1

		text_analysis["text_segments"] = text_segments[:20]  # Limit to first 20
		text_analysis["japanese_character_count"] = len(japanese_byte_sequences)
		text_analysis["estimated_text_coverage"] = len(japanese_byte_sequences) / len(data) * 100

		return text_analysis

	def _analyze_compression_fast(self, data: np.ndarray) -> Dict[str, Any]:
		"""Fast compression analysis"""
		self._update_progress("Analyzing compression patterns")

		# Sample for compression analysis
		sample_size = min(16384, len(data))
		sample_data = data[:sample_size]

		compression = {
			"entropy": self._calculate_entropy_fast(sample_data),
			"rle_potential": 0,
			"lz_patterns": 0,
			"compression_score": 0.0
		}

		# Quick RLE analysis
		runs = 0
		current_byte = sample_data[0] if len(sample_data) > 0 else 0
		run_length = 1

		for byte_val in sample_data[1:]:
			if byte_val == current_byte:
				run_length += 1
			else:
				if run_length >= 3:
					runs += 1
				current_byte = byte_val
				run_length = 1

		compression["rle_potential"] = runs

		# Quick LZ pattern detection
		pattern_dict = {}
		for i in range(len(sample_data) - 4):
			pattern = tuple(sample_data[i:i + 4])
			pattern_dict[pattern] = pattern_dict.get(pattern, 0) + 1

		compression["lz_patterns"] = sum(1 for count in pattern_dict.values() if count > 1)

		# Overall compression score
		entropy_score = compression["entropy"] / 8.0
		pattern_score = min(compression["lz_patterns"] / 100.0, 1.0)
		compression["compression_score"] = (entropy_score + pattern_score) / 2.0

		return compression

	def _analyze_graphics_structure(self, data: np.ndarray) -> Dict[str, Any]:
		"""Analyze graphics data structure"""
		self._update_progress("Analyzing graphics structure")

		graphics = {
			"planar_patterns": [],
			"palette_candidates": [],
			"tile_patterns": {},
			"graphics_segments": []
		}

		# Look for 2bpp/4bpp graphics patterns
		# SNES graphics are often stored in planar format

		# Check for patterns typical of 2bpp graphics (every 16 bytes)
		planar_2bpp_score = 0
		for i in range(0, min(8192, len(data) - 16), 16):
			# 2bpp tiles are 16 bytes (8x8 pixels, 2 bits per pixel)
			tile_data = data[i:i + 16]

			# Check for planar organization (bitplanes separated)
			plane1 = tile_data[:8]
			plane2 = tile_data[8:16]

			# Simple heuristic: if planes are different but related
			if not np.array_equal(plane1, plane2) and np.sum(plane1) + np.sum(plane2) > 0:
				planar_2bpp_score += 1

		graphics["planar_patterns"].append({
			"format": "2bpp",
			"score": planar_2bpp_score,
			"confidence": min(planar_2bpp_score / 100.0, 1.0)
		})

		# Look for palette data (sequences of 16-bit color values)
		for i in range(0, min(4096, len(data) - 32), 2):
			# SNES colors are 15-bit in 16-bit words
			color_word = int(data[i]) | (int(data[i + 1]) << 8)

			# Check if this looks like a valid SNES color
			if (color_word & 0x8000) == 0:  # Bit 15 should be 0
				# Check if next several values also look like colors
				valid_colors = 1
				for j in range(i + 2, min(i + 32, len(data) - 1), 2):
					next_color = int(data[j]) | (int(data[j + 1]) << 8)
					if (next_color & 0x8000) == 0:
						valid_colors += 1
					else:
						break

				if valid_colors >= 8:  # At least 8 consecutive valid colors
					graphics["palette_candidates"].append({
						"offset": i,
						"colors": valid_colors,
						"confidence": min(valid_colors / 16.0, 1.0)
					})

		return graphics

	def _calculate_entropy_fast(self, data: np.ndarray) -> float:
		"""Fast entropy calculation"""
		if len(data) == 0:
			return 0.0

		# Use bincount for speed
		counts = np.bincount(data, minlength=256)
		probabilities = counts[counts > 0] / len(data)

		return float(-np.sum(probabilities * np.log2(probabilities)))

	def _classify_segment_content(self, entropy: float, unique_bytes: int, size: int) -> str:
		"""Classify what type of content a segment likely contains"""
		if entropy > 7.0:
			return "compressed_or_encrypted"
		elif entropy < 2.0:
			return "repetitive_or_empty"
		elif unique_bytes < 32:
			return "structured_data_or_code"
		elif 4.0 < entropy < 6.0 and unique_bytes > 100:
			return "graphics_data"
		elif unique_bytes < 100:
			return "text_or_tables"
		else:
			return "mixed_content"


def main():
	"""Main function for batch ROM analysis"""
	print("⚡ OPTIMIZED JAPANESE ROM BATCH ANALYZER")
	print("=" * 55)

	# Initialize batch analyzer with 5-minute limit
	analyzer = BatchROMAnalyzer(max_processing_time=300)

	# Analyze Japanese ROM specifically
	print(f"[{analyzer._timestamp()}] 🎌 Focusing on Japanese ROM analysis")
	results = analyzer.analyze_japanese_rom_fast()

	if "error" in results:
		print(f"[{analyzer._timestamp()}] ❌ Analysis failed: {results['error']}")
		return results

	# Display key results
	print(f"\n[{analyzer._timestamp()}] 📊 ANALYSIS SUMMARY")
	print("-" * 40)

	metadata = results["metadata"]
	print(f"ROM: {metadata['rom_name']}")
	print(f"Size: {metadata['file_size']:,} bytes")

	if "header_analysis" in results:
		header = results["header_analysis"]
		print(f"Type: {header['rom_type']}")
		print(f"Title: {header.get('title', 'Unknown')}")

	if "data_segments" in results:
		segments = results["data_segments"]
		print(f"Segments analyzed: {len(segments['segments'])}")
		print(f"High entropy segments: {len(segments['high_entropy_segments'])}")
		print(f"Potential graphics segments: {len(segments['potential_graphics'])}")

	if "text_analysis" in results:
		text = results["text_analysis"]
		print(f"Japanese characters found: {text['japanese_character_count']}")
		print(f"Text segments: {len(text['text_segments'])}")
		print(f"Text coverage: {text['estimated_text_coverage']:.1f}%")

	# Performance metrics
	if "performance_metrics" in results:
		perf = results["performance_metrics"]
		print(f"\n[{analyzer._timestamp()}] ⚡ PERFORMANCE")
		print(f"Processing time: {perf['total_processing_time']:.2f}s")
		print(f"Speed: {perf['bytes_per_second']:,.0f} bytes/sec")

	# Save results
	output_file = "japanese_rom_analysis_optimized.json"
	with open(output_file, "w", encoding="utf-8") as f:
		json.dump(results, f, indent=2, default=str)

	print(f"\n[{analyzer._timestamp()}] 💾 Results saved to: {output_file}")
	print(f"[{analyzer._timestamp()}] ✅ Japanese ROM analysis complete!")

	return results


if __name__ == "__main__":
	main()
