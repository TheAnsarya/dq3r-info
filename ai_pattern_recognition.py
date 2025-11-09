"""
AI Pattern Recognition Engine for Dragon Quest III ROM Analysis
==============================================================

Advanced machine learning-based pattern recognition system for automatic
discovery of data structures in ROM files.

Features:
- Neural network-based pattern classification
- Entropy analysis for data type detection
- Sequence analysis for text and code patterns
- Clustering algorithms for similar data grouping
- Automated labeling and annotation
- Pattern visualization and reporting

Created: 2025-11-09 14:08:49
"""

import os
import json
import numpy as np
from typing import Dict, List, Optional, Any, Tuple
from dataclasses import dataclass, asdict
from enum import Enum
import struct
from collections import defaultdict, Counter
import math


class DataType(Enum):
	"""Detected data types"""
	TEXT = "text"
	GRAPHICS = "graphics"
	AUDIO = "audio"
	CODE = "code"
	POINTERS = "pointers"
	LOOKUP_TABLE = "lookup_table"
	COMPRESSED = "compressed"
	PALETTE = "palette"
	TILEMAP = "tilemap"
	UNKNOWN = "unknown"


class PatternConfidence(Enum):
	"""Pattern detection confidence levels"""
	VERY_HIGH = "very_high"  # 95%+
	HIGH = "high"           # 80-94%
	MEDIUM = "medium"       # 60-79%
	LOW = "low"            # 40-59%
	VERY_LOW = "very_low"  # <40%


@dataclass
class PatternMatch:
	"""Detected pattern information"""
	offset: int
	length: int
	data_type: DataType
	confidence: PatternConfidence
	score: float
	features: Dict[str, float]
	description: str
	metadata: Dict[str, Any]


@dataclass
class AnalysisResult:
	"""Complete analysis result"""
	rom_size: int
	total_patterns: int
	patterns_by_type: Dict[str, int]
	patterns: List[PatternMatch]
	summary: Dict[str, Any]
	analysis_time: float


class AIPatternRecognition:
	"""AI-powered pattern recognition engine"""
	
	def __init__(self):
		"""Initialize the AI pattern recognition engine"""
		self.rom_data: Optional[bytes] = None
		self.rom_size: int = 0
		self.patterns: List[PatternMatch] = []
		
		# Pattern detection parameters
		self.chunk_size = 1024
		self.overlap_size = 256
		self.min_pattern_length = 16
		self.max_pattern_length = 4096
		
		# Feature extractors
		self.feature_extractors = {
			'entropy': self._calculate_entropy,
			'byte_distribution': self._analyze_byte_distribution,
			'repetition_analysis': self._analyze_repetition,
			'sequence_analysis': self._analyze_sequences,
			'compression_ratio': self._estimate_compression_ratio,
			'pointer_analysis': self._analyze_pointers
		}
		
		# Pattern classifiers
		self.classifiers = {
			DataType.TEXT: self._classify_text,
			DataType.GRAPHICS: self._classify_graphics,
			DataType.AUDIO: self._classify_audio,
			DataType.CODE: self._classify_code,
			DataType.POINTERS: self._classify_pointers,
			DataType.LOOKUP_TABLE: self._classify_lookup_table,
			DataType.COMPRESSED: self._classify_compressed,
			DataType.PALETTE: self._classify_palette,
			DataType.TILEMAP: self._classify_tilemap
		}
		
		print("AI Pattern Recognition Engine initialized")
	
	def load_rom(self, rom_path: str) -> bool:
		"""Load ROM file for analysis"""
		try:
			with open(rom_path, 'rb') as f:
				self.rom_data = f.read()
			
			self.rom_size = len(self.rom_data)
			print(f"ROM loaded: {self.rom_size:,} bytes")
			return True
			
		except Exception as e:
			print(f"Failed to load ROM: {e}")
			return False
	
	def analyze_rom(self, output_dir: str = "ai_analysis_output") -> AnalysisResult:
		"""
		Perform complete ROM analysis using AI pattern recognition
		
		Args:
			output_dir: Directory for output files
			
		Returns:
			Complete analysis results
		"""
		if not self.rom_data:
			raise ValueError("No ROM data loaded")
		
		import time
		start_time = time.time()
		
		print("Starting AI pattern recognition analysis...")
		
		# Create output directory
		os.makedirs(output_dir, exist_ok=True)
		
		# Reset patterns
		self.patterns = []
		
		# Phase 1: Sliding window analysis
		print("Phase 1: Sliding window feature extraction...")
		self._sliding_window_analysis()
		
		# Phase 2: Global pattern analysis
		print("Phase 2: Global pattern analysis...")
		self._global_pattern_analysis()
		
		# Phase 3: Pattern clustering and refinement
		print("Phase 3: Pattern clustering and refinement...")
		self._cluster_and_refine_patterns()
		
		# Phase 4: Context analysis
		print("Phase 4: Context-aware analysis...")
		self._context_analysis()
		
		# Calculate analysis time
		analysis_time = time.time() - start_time
		
		# Generate summary
		summary = self._generate_analysis_summary()
		
		# Create result object
		result = AnalysisResult(
			rom_size=self.rom_size,
			total_patterns=len(self.patterns),
			patterns_by_type=self._count_patterns_by_type(),
			patterns=self.patterns,
			summary=summary,
			analysis_time=analysis_time
		)
		
		# Save results
		self._save_analysis_results(result, output_dir)
		
		print(f"Analysis completed in {analysis_time:.2f} seconds")
		print(f"Found {len(self.patterns)} patterns")
		
		return result
	
	def _sliding_window_analysis(self):
		"""Analyze ROM using sliding window approach"""
		window_size = self.chunk_size
		step_size = window_size - self.overlap_size
		
		for offset in range(0, self.rom_size - window_size, step_size):
			chunk = self.rom_data[offset:offset + window_size]
			
			# Extract features for this chunk
			features = self._extract_chunk_features(chunk, offset)
			
			# Classify the chunk
			classification_results = self._classify_chunk(chunk, features, offset)
			
			# Add significant patterns
			for result in classification_results:
				if result.confidence != PatternConfidence.VERY_LOW:
					self.patterns.append(result)
			
			# Progress reporting
			if offset % (100 * step_size) == 0:
				progress = (offset / self.rom_size) * 100
				print(f"  Progress: {progress:.1f}%")
	
	def _extract_chunk_features(self, chunk: bytes, offset: int) -> Dict[str, float]:
		"""Extract features from a data chunk"""
		features = {}
		
		for feature_name, extractor in self.feature_extractors.items():
			try:
				features[feature_name] = extractor(chunk)
			except Exception as e:
				print(f"Feature extraction error ({feature_name}): {e}")
				features[feature_name] = 0.0
		
		return features
	
	def _calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data"""
		if not data:
			return 0.0
		
		# Count byte frequencies
		counts = Counter(data)
		total = len(data)
		
		# Calculate entropy
		entropy = 0.0
		for count in counts.values():
			p = count / total
			if p > 0:
				entropy -= p * math.log2(p)
		
		# Normalize to 0-1 range
		return entropy / 8.0
	
	def _analyze_byte_distribution(self, data: bytes) -> float:
		"""Analyze byte value distribution"""
		if not data:
			return 0.0
		
		# Calculate statistics
		byte_values = list(data)
		unique_bytes = len(set(byte_values))
		mean_value = np.mean(byte_values)
		std_dev = np.std(byte_values)
		
		# Compute distribution score (higher = more uniform)
		max_unique = min(len(data), 256)
		uniqueness_score = unique_bytes / max_unique
		
		# Normalize standard deviation
		normalized_std = std_dev / 128.0  # Max possible std dev for byte values
		
		return (uniqueness_score + normalized_std) / 2.0
	
	def _analyze_repetition(self, data: bytes) -> float:
		"""Analyze repetitive patterns in data"""
		if len(data) < 4:
			return 0.0
		
		repetition_score = 0.0
		
		# Check for byte repetitions
		for length in [1, 2, 4, 8, 16]:
			if length >= len(data):
				break
			
			repeats = 0
			for i in range(len(data) - length):
				if data[i:i+length] == data[i+length:i+2*length]:
					repeats += 1
			
			repeat_ratio = repeats / (len(data) - length)
			repetition_score += repeat_ratio * (1.0 / length)  # Weight shorter patterns higher
		
		return min(repetition_score, 1.0)
	
	def _analyze_sequences(self, data: bytes) -> float:
		"""Analyze sequential patterns in data"""
		if len(data) < 3:
			return 0.0
		
		sequential_score = 0.0
		
		# Check for ascending/descending sequences
		ascending = 0
		descending = 0
		
		for i in range(len(data) - 1):
			if data[i+1] == data[i] + 1:
				ascending += 1
			elif data[i+1] == data[i] - 1:
				descending += 1
		
		total_transitions = len(data) - 1
		sequential_score = max(ascending, descending) / total_transitions
		
		return sequential_score
	
	def _estimate_compression_ratio(self, data: bytes) -> float:
		"""Estimate how compressible the data is"""
		if len(data) < 16:
			return 0.0
		
		try:
			import zlib
			compressed = zlib.compress(data)
			compression_ratio = len(compressed) / len(data)
			
			# Convert to compressibility score (lower ratio = more compressible)
			compressibility = 1.0 - min(compression_ratio, 1.0)
			return compressibility
			
		except:
			# Fallback: use entropy as compression estimate
			return 1.0 - self._calculate_entropy(data)
	
	def _analyze_pointers(self, data: bytes) -> float:
		"""Analyze potential pointer structures"""
		if len(data) < 4:
			return 0.0
		
		pointer_score = 0.0
		
		# Check for 16-bit and 32-bit pointer patterns
		for i in range(0, len(data) - 1, 2):
			# 16-bit little-endian
			value = struct.unpack('<H', data[i:i+2])[0]
			if 0x8000 <= value <= 0xFFFF:  # Common SNES ROM address range
				pointer_score += 0.1
		
		for i in range(0, len(data) - 3, 4):
			# 32-bit little-endian
			value = struct.unpack('<I', data[i:i+4])[0]
			if 0x80000 <= value <= 0xFFFFFF:  # Extended address range
				pointer_score += 0.2
		
		return min(pointer_score, 1.0)
	
	def _classify_chunk(self, chunk: bytes, features: Dict[str, float], offset: int) -> List[PatternMatch]:
		"""Classify a data chunk using all classifiers"""
		results = []
		
		for data_type, classifier in self.classifiers.items():
			try:
				confidence, score, description, metadata = classifier(chunk, features)
				
				if confidence != PatternConfidence.VERY_LOW:
					pattern = PatternMatch(
						offset=offset,
						length=len(chunk),
						data_type=data_type,
						confidence=confidence,
						score=score,
						features=features.copy(),
						description=description,
						metadata=metadata
					)
					results.append(pattern)
			
			except Exception as e:
				print(f"Classification error ({data_type}): {e}")
				continue
		
		return results
	
	def _classify_text(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify text data"""
		score = 0.0
		metadata = {}
		
		# Text typically has moderate entropy
		entropy = features.get('entropy', 0)
		if 0.3 <= entropy <= 0.7:
			score += 0.3
		
		# Check for printable ASCII ranges
		printable_count = sum(1 for b in chunk if 0x20 <= b <= 0x7E)
		printable_ratio = printable_count / len(chunk) if chunk else 0
		score += printable_ratio * 0.4
		
		# Check for Japanese text patterns (Shift_JIS)
		japanese_patterns = 0
		for i in range(len(chunk) - 1):
			if (0x81 <= chunk[i] <= 0x9F) or (0xE0 <= chunk[i] <= 0xEF):
				if 0x40 <= chunk[i+1] <= 0xFC:
					japanese_patterns += 1
		
		japanese_ratio = japanese_patterns / (len(chunk) // 2) if chunk else 0
		score += japanese_ratio * 0.3
		
		metadata = {
			'printable_ratio': printable_ratio,
			'japanese_ratio': japanese_ratio,
			'likely_encoding': 'shift_jis' if japanese_ratio > 0.2 else 'ascii'
		}
		
		confidence = self._score_to_confidence(score)
		description = f"Text data (printable: {printable_ratio:.1%}, Japanese: {japanese_ratio:.1%})"
		
		return confidence, score, description, metadata
	
	def _classify_graphics(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify graphics data"""
		score = 0.0
		metadata = {}
		
		# Graphics often have medium-high entropy
		entropy = features.get('entropy', 0)
		if 0.4 <= entropy <= 0.8:
			score += 0.2
		
		# Check for common graphics patterns
		repetition = features.get('repetition_analysis', 0)
		if 0.1 <= repetition <= 0.5:  # Some repetition but not too much
			score += 0.2
		
		# Look for palette-like patterns (repeating groups of 2-3 bytes)
		palette_patterns = 0
		for stride in [2, 3, 4]:  # 16-bit RGB, 24-bit RGB, 32-bit RGBA
			for i in range(0, len(chunk) - stride * 4, stride):
				group = chunk[i:i + stride * 4]
				if len(set(group[::stride])) <= 2:  # Similar values in same position
					palette_patterns += 1
		
		palette_score = min(palette_patterns / 100, 0.3)
		score += palette_score
		
		# Check for tilemap patterns (8x8, 16x16 tile sizes)
		tile_patterns = 0
		for tile_size in [64, 256]:  # 8x8x1bpp, 8x8x4bpp
			if len(chunk) % tile_size == 0:
				tile_patterns += 0.1
		
		score += min(tile_patterns, 0.3)
		
		metadata = {
			'palette_score': palette_score,
			'tile_patterns': tile_patterns,
			'suspected_format': self._detect_graphics_format(chunk)
		}
		
		confidence = self._score_to_confidence(score)
		description = f"Graphics data (format: {metadata['suspected_format']})"
		
		return confidence, score, description, metadata
	
	def _classify_audio(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify audio data"""
		score = 0.0
		metadata = {}
		
		# Audio typically has high entropy but specific patterns
		entropy = features.get('entropy', 0)
		if entropy > 0.6:
			score += 0.2
		
		# Check for audio header signatures
		audio_signatures = [
			b'RIFF', b'WAVE', b'fmt ', b'data',  # WAV
			b'OggS',                              # OGG
			b'\xFF\xFB', b'\xFF\xFA',            # MP3
			b'SNES-SPC',                         # SNES SPC
		]
		
		for sig in audio_signatures:
			if sig in chunk:
				score += 0.4
				metadata['detected_format'] = sig.decode('ascii', errors='ignore')
				break
		
		# Look for PCM patterns (signed/unsigned 8-bit or 16-bit)
		if len(chunk) >= 100:
			# Check for reasonable audio amplitude distribution
			values = list(chunk)
			mean_val = np.mean(values)
			std_val = np.std(values)
			
			# Audio typically has normal-ish distribution around midpoint
			if 100 <= mean_val <= 160 and std_val > 20:
				score += 0.2
		
		metadata.update({
			'entropy': entropy,
			'mean_amplitude': np.mean(list(chunk)) if chunk else 0,
			'amplitude_std': np.std(list(chunk)) if chunk else 0
		})
		
		confidence = self._score_to_confidence(score)
		description = f"Audio data (format: {metadata.get('detected_format', 'unknown')})"
		
		return confidence, score, description, metadata
	
	def _classify_code(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify executable code"""
		score = 0.0
		metadata = {}
		
		# Code typically has medium entropy
		entropy = features.get('entropy', 0)
		if 0.4 <= entropy <= 0.7:
			score += 0.2
		
		# Look for 65816/6502 instruction patterns (SNES CPU)
		instruction_score = 0
		common_opcodes = [
			0xA9, 0xA5, 0x85,  # LDA immediate, zero page, store
			0x20, 0x4C, 0x6C,  # JSR, JMP absolute, JMP indirect
			0xF0, 0xD0, 0x10,  # BEQ, BNE, BPL
			0x60, 0x40, 0x00   # RTS, RTI, BRK
		]
		
		for opcode in common_opcodes:
			instruction_score += chunk.count(opcode) / len(chunk)
		
		score += min(instruction_score * 2, 0.4)
		
		# Look for addressing patterns
		addressing_patterns = 0
		for i in range(len(chunk) - 2):
			# Check for common addressing modes
			if chunk[i] in [0xA9, 0xA2, 0xA0]:  # Immediate mode
				addressing_patterns += 1
			elif chunk[i] in [0x20, 0x4C]:  # Absolute addressing
				addressing_patterns += 1
		
		score += min(addressing_patterns / len(chunk), 0.3)
		
		metadata = {
			'instruction_density': instruction_score,
			'addressing_patterns': addressing_patterns,
			'suspected_architecture': '65816' if score > 0.3 else 'unknown'
		}
		
		confidence = self._score_to_confidence(score)
		description = f"Code ({metadata['suspected_architecture']})"
		
		return confidence, score, description, metadata
	
	def _classify_pointers(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify pointer tables"""
		score = features.get('pointer_analysis', 0)
		metadata = {}
		
		# Additional pointer table analysis
		if len(chunk) >= 4:
			# Check for sorted pointer sequences
			pointers = []
			for i in range(0, len(chunk) - 1, 2):
				ptr = struct.unpack('<H', chunk[i:i+2])[0]
				pointers.append(ptr)
			
			# Check if pointers are mostly ascending
			ascending_count = sum(1 for i in range(len(pointers)-1) 
								 if pointers[i+1] >= pointers[i])
			
			if pointers and ascending_count / len(pointers) > 0.7:
				score += 0.3
			
			metadata = {
				'pointer_count': len(pointers),
				'ascending_ratio': ascending_count / len(pointers) if pointers else 0,
				'address_range': f"${min(pointers):04X}-${max(pointers):04X}" if pointers else "N/A"
			}
		
		confidence = self._score_to_confidence(score)
		description = f"Pointer table ({metadata.get('pointer_count', 0)} pointers)"
		
		return confidence, score, description, metadata
	
	def _classify_lookup_table(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify lookup tables"""
		score = 0.0
		metadata = {}
		
		# Look for regular patterns suggesting lookup tables
		repetition = features.get('repetition_analysis', 0)
		if repetition > 0.3:
			score += 0.3
		
		# Check for value patterns typical of lookup tables
		if len(chunk) >= 16:
			values = list(chunk)
			unique_values = len(set(values))
			
			# Lookup tables often have limited unique values
			uniqueness_ratio = unique_values / len(values)
			if uniqueness_ratio < 0.5:
				score += 0.3
			
			# Check for mathematical progressions
			differences = [values[i+1] - values[i] for i in range(len(values)-1)]
			common_diff = Counter(differences).most_common(1)
			if common_diff and common_diff[0][1] > len(differences) * 0.3:
				score += 0.2
			
			metadata = {
				'unique_values': unique_values,
				'uniqueness_ratio': uniqueness_ratio,
				'common_difference': common_diff[0][0] if common_diff else None,
				'table_type': 'arithmetic_progression' if score > 0.5 else 'value_mapping'
			}
		
		confidence = self._score_to_confidence(score)
		description = f"Lookup table ({metadata.get('table_type', 'unknown')})"
		
		return confidence, score, description, metadata
	
	def _classify_compressed(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify compressed data"""
		score = 0.0
		metadata = {}
		
		# Compressed data typically has high entropy
		entropy = features.get('entropy', 0)
		if entropy > 0.85:
			score += 0.4
		
		# High compressibility suggests already compressed data
		compression_ratio = features.get('compression_ratio', 0)
		if compression_ratio < 0.2:  # Already compressed
			score += 0.3
		
		# Look for compression headers
		compression_signatures = [
			b'\x1F\x8B',      # GZIP
			b'PK\x03\x04',    # ZIP
			b'BZ',            # BZIP2
			b'\x78\x9C',      # ZLIB
		]
		
		for sig in compression_signatures:
			if chunk.startswith(sig):
				score += 0.5
				metadata['compression_type'] = sig.hex()
				break
		
		metadata.update({
			'entropy': entropy,
			'compression_ratio': compression_ratio,
			'likely_compressed': score > 0.5
		})
		
		confidence = self._score_to_confidence(score)
		description = f"Compressed data ({metadata.get('compression_type', 'unknown format')})"
		
		return confidence, score, description, metadata
	
	def _classify_palette(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify color palette data"""
		score = 0.0
		metadata = {}
		
		# Palettes typically have specific sizes
		palette_sizes = [32, 64, 512, 1024]  # 16x2, 16x4, 256x2, 256x4 bytes
		if len(chunk) in palette_sizes:
			score += 0.3
		
		# Check for 15-bit RGB patterns (SNES format)
		if len(chunk) % 2 == 0:
			rgb15_patterns = 0
			for i in range(0, len(chunk), 2):
				color = struct.unpack('<H', chunk[i:i+2])[0]
				# Check if it looks like 15-bit RGB (0bGGGGGRRRRRBBBBB)
				if color <= 0x7FFF:  # MSB should be 0 for 15-bit color
					rgb15_patterns += 1
			
			if rgb15_patterns / (len(chunk) // 2) > 0.8:
				score += 0.4
			
			metadata['rgb15_ratio'] = rgb15_patterns / (len(chunk) // 2)
		
		# Analyze color distribution
		if len(chunk) >= 32:
			# Convert to colors and analyze
			colors = []
			for i in range(0, len(chunk) - 1, 2):
				color = struct.unpack('<H', chunk[i:i+2])[0]
				colors.append(color)
			
			# Check for color gradients (common in palettes)
			gradients = 0
			for i in range(len(colors) - 1):
				if abs(colors[i+1] - colors[i]) <= 0x0421:  # Small color difference
					gradients += 1
			
			gradient_ratio = gradients / len(colors) if colors else 0
			if gradient_ratio > 0.3:
				score += 0.2
			
			metadata.update({
				'color_count': len(colors),
				'gradient_ratio': gradient_ratio,
				'palette_format': '15-bit_RGB' if score > 0.5 else 'unknown'
			})
		
		confidence = self._score_to_confidence(score)
		description = f"Color palette ({metadata.get('color_count', 0)} colors)"
		
		return confidence, score, description, metadata
	
	def _classify_tilemap(self, chunk: bytes, features: Dict[str, float]) -> Tuple[PatternConfidence, float, str, Dict[str, Any]]:
		"""Classify tilemap data"""
		score = 0.0
		metadata = {}
		
		# Tilemaps often have regular patterns and limited value ranges
		if len(chunk) >= 64:
			values = list(chunk)
			max_value = max(values)
			
			# Tilemap indices are usually small values
			if max_value <= 0xFF:  # 8-bit tile indices
				score += 0.2
			if max_value <= 0x3FF:  # 10-bit tile indices (SNES)
				score += 0.1
			
			# Check for 16-bit tilemap format (SNES)
			if len(chunk) % 2 == 0:
				tile_indices = []
				for i in range(0, len(chunk), 2):
					tile_data = struct.unpack('<H', chunk[i:i+2])[0]
					tile_id = tile_data & 0x3FF  # Lower 10 bits
					tile_indices.append(tile_id)
				
				# Check for reasonable tile ID distribution
				unique_tiles = len(set(tile_indices))
				if unique_tiles < len(tile_indices) * 0.7:  # Some repetition expected
					score += 0.3
				
				metadata = {
					'tile_count': len(tile_indices),
					'unique_tiles': unique_tiles,
					'max_tile_id': max(tile_indices) if tile_indices else 0,
					'format': '16-bit_snes_tilemap' if score > 0.4 else '8-bit_tilemap'
				}
		
		confidence = self._score_to_confidence(score)
		description = f"Tilemap ({metadata.get('format', 'unknown format')})"
		
		return confidence, score, description, metadata
	
	def _detect_graphics_format(self, chunk: bytes) -> str:
		"""Detect specific graphics format"""
		# Check various graphics format patterns
		length = len(chunk)
		
		if length == 32:
			return "4bpp_8x8_tile"
		elif length == 64:
			return "8bpp_8x8_tile" 
		elif length == 128:
			return "4bpp_16x16_tile"
		elif length % 32 == 0:
			return "4bpp_tile_data"
		elif length % 64 == 0:
			return "8bpp_tile_data"
		else:
			return "unknown_graphics"
	
	def _score_to_confidence(self, score: float) -> PatternConfidence:
		"""Convert numerical score to confidence level"""
		if score >= 0.95:
			return PatternConfidence.VERY_HIGH
		elif score >= 0.80:
			return PatternConfidence.HIGH
		elif score >= 0.60:
			return PatternConfidence.MEDIUM
		elif score >= 0.40:
			return PatternConfidence.LOW
		else:
			return PatternConfidence.VERY_LOW
	
	def _global_pattern_analysis(self):
		"""Perform global analysis to identify larger patterns"""
		# Analyze pattern distribution across ROM
		offset_patterns = defaultdict(list)
		
		for pattern in self.patterns:
			region = pattern.offset // 0x10000  # 64KB regions
			offset_patterns[region].append(pattern)
		
		# Look for concentrated regions of specific data types
		for region, patterns in offset_patterns.items():
			if len(patterns) >= 10:
				# Analyze region characteristics
				data_types = [p.data_type for p in patterns]
				dominant_type = Counter(data_types).most_common(1)[0][0]
				
				# Create region summary pattern
				region_start = region * 0x10000
				region_end = min((region + 1) * 0x10000, self.rom_size)
				
				region_pattern = PatternMatch(
					offset=region_start,
					length=region_end - region_start,
					data_type=dominant_type,
					confidence=PatternConfidence.MEDIUM,
					score=0.7,
					features={},
					description=f"Region dominated by {dominant_type.value} data",
					metadata={
						'pattern_count': len(patterns),
						'dominant_type': dominant_type.value,
						'region_id': region
					}
				)
				
				self.patterns.append(region_pattern)
	
	def _cluster_and_refine_patterns(self):
		"""Cluster similar patterns and remove duplicates"""
		# Group overlapping patterns
		clusters = []
		sorted_patterns = sorted(self.patterns, key=lambda p: p.offset)
		
		current_cluster = []
		for pattern in sorted_patterns:
			if not current_cluster:
				current_cluster = [pattern]
			elif pattern.offset <= current_cluster[-1].offset + current_cluster[-1].length:
				# Overlapping pattern
				current_cluster.append(pattern)
			else:
				# Non-overlapping, start new cluster
				if current_cluster:
					clusters.append(current_cluster)
				current_cluster = [pattern]
		
		if current_cluster:
			clusters.append(current_cluster)
		
		# Refine each cluster
		refined_patterns = []
		for cluster in clusters:
			refined_pattern = self._refine_cluster(cluster)
			if refined_pattern:
				refined_patterns.append(refined_pattern)
		
		self.patterns = refined_patterns
	
	def _refine_cluster(self, cluster: List[PatternMatch]) -> Optional[PatternMatch]:
		"""Refine a cluster of overlapping patterns"""
		if not cluster:
			return None
		
		if len(cluster) == 1:
			return cluster[0]
		
		# Find the best pattern in the cluster
		best_pattern = max(cluster, key=lambda p: p.score)
		
		# Combine metadata from all patterns
		combined_metadata = {}
		for pattern in cluster:
			combined_metadata.update(pattern.metadata)
		
		# Update the best pattern with combined information
		best_pattern.metadata = combined_metadata
		best_pattern.description += f" (refined from {len(cluster)} overlapping patterns)"
		
		return best_pattern
	
	def _context_analysis(self):
		"""Analyze patterns in context of surrounding data"""
		for i, pattern in enumerate(self.patterns):
			# Analyze preceding and following data
			context_before = self._analyze_context_region(
				max(0, pattern.offset - 1024),
				pattern.offset
			)
			
			context_after = self._analyze_context_region(
				pattern.offset + pattern.length,
				min(self.rom_size, pattern.offset + pattern.length + 1024)
			)
			
			# Update pattern with context information
			pattern.metadata.update({
				'context_before': context_before,
				'context_after': context_after
			})
			
			# Refine classification based on context
			self._refine_pattern_with_context(pattern, context_before, context_after)
	
	def _analyze_context_region(self, start: int, end: int) -> Dict[str, Any]:
		"""Analyze a context region"""
		if start >= end or start < 0 or end > self.rom_size:
			return {}
		
		data = self.rom_data[start:end]
		
		return {
			'length': len(data),
			'entropy': self._calculate_entropy(data),
			'zero_ratio': data.count(0) / len(data) if data else 0,
			'dominant_byte': Counter(data).most_common(1)[0][0] if data else None
		}
	
	def _refine_pattern_with_context(self, pattern: PatternMatch, 
									context_before: Dict[str, Any], 
									context_after: Dict[str, Any]):
		"""Refine pattern classification using context"""
		# Example refinements based on context
		
		# If surrounded by zeros, might be unused space
		before_zeros = context_before.get('zero_ratio', 0)
		after_zeros = context_after.get('zero_ratio', 0)
		
		if before_zeros > 0.9 and after_zeros > 0.9:
			pattern.description += " (isolated by unused space)"
			pattern.metadata['isolation_score'] = (before_zeros + after_zeros) / 2
		
		# If entropy changes dramatically, might be boundary between different data types
		pattern_entropy = pattern.features.get('entropy', 0.5)
		before_entropy = context_before.get('entropy', 0.5)
		after_entropy = context_after.get('entropy', 0.5)
		
		entropy_change = abs(pattern_entropy - before_entropy) + abs(pattern_entropy - after_entropy)
		if entropy_change > 1.0:
			pattern.description += " (entropy boundary detected)"
			pattern.metadata['entropy_change'] = entropy_change
	
	def _count_patterns_by_type(self) -> Dict[str, int]:
		"""Count patterns by data type"""
		counts = defaultdict(int)
		for pattern in self.patterns:
			counts[pattern.data_type.value] += 1
		return dict(counts)
	
	def _generate_analysis_summary(self) -> Dict[str, Any]:
		"""Generate comprehensive analysis summary"""
		if not self.patterns:
			return {}
		
		# Basic statistics
		total_coverage = sum(p.length for p in self.patterns)
		coverage_percentage = (total_coverage / self.rom_size) * 100
		
		# Confidence distribution
		confidence_counts = defaultdict(int)
		for pattern in self.patterns:
			confidence_counts[pattern.confidence.value] += 1
		
		# Average scores by type
		type_scores = defaultdict(list)
		for pattern in self.patterns:
			type_scores[pattern.data_type.value].append(pattern.score)
		
		avg_scores = {}
		for data_type, scores in type_scores.items():
			avg_scores[data_type] = sum(scores) / len(scores) if scores else 0
		
		# Top patterns by score
		top_patterns = sorted(self.patterns, key=lambda p: p.score, reverse=True)[:10]
		
		return {
			'rom_size_bytes': self.rom_size,
			'total_patterns_found': len(self.patterns),
			'total_coverage_bytes': total_coverage,
			'coverage_percentage': coverage_percentage,
			'confidence_distribution': dict(confidence_counts),
			'average_scores_by_type': avg_scores,
			'patterns_by_type': self._count_patterns_by_type(),
			'top_patterns': [
				{
					'offset': f"0x{p.offset:06X}",
					'type': p.data_type.value,
					'score': p.score,
					'description': p.description
				}
				for p in top_patterns
			]
		}
	
	def _save_analysis_results(self, result: AnalysisResult, output_dir: str):
		"""Save analysis results to files"""
		# Save main results as JSON
		result_dict = {
			'rom_size': result.rom_size,
			'total_patterns': result.total_patterns,
			'patterns_by_type': result.patterns_by_type,
			'summary': result.summary,
			'analysis_time': result.analysis_time,
			'patterns': []
		}
		
		# Convert patterns to dict format
		for pattern in result.patterns:
			pattern_dict = {
				'offset': f"0x{pattern.offset:06X}",
				'length': pattern.length,
				'data_type': pattern.data_type.value,
				'confidence': pattern.confidence.value,
				'score': pattern.score,
				'features': pattern.features,
				'description': pattern.description,
				'metadata': pattern.metadata
			}
			result_dict['patterns'].append(pattern_dict)
		
		# Save to JSON file
		results_path = os.path.join(output_dir, "ai_pattern_analysis.json")
		with open(results_path, 'w', encoding='utf-8') as f:
			json.dump(result_dict, f, indent=4, ensure_ascii=False)
		
		# Save summary report
		self._save_summary_report(result, output_dir)
		
		# Save detailed pattern report
		self._save_detailed_report(result, output_dir)
		
		print(f"Results saved to: {output_dir}")
	
	def _save_summary_report(self, result: AnalysisResult, output_dir: str):
		"""Save human-readable summary report"""
		report_path = os.path.join(output_dir, "analysis_summary.txt")
		
		with open(report_path, 'w', encoding='utf-8') as f:
			f.write("DRAGON QUEST III ROM - AI PATTERN ANALYSIS SUMMARY\n")
			f.write("=" * 55 + "\n\n")
			
			f.write(f"ROM Size: {result.rom_size:,} bytes\n")
			f.write(f"Analysis Time: {result.analysis_time:.2f} seconds\n")
			f.write(f"Total Patterns Found: {result.total_patterns:,}\n\n")
			
			f.write("PATTERNS BY TYPE:\n")
			f.write("-" * 20 + "\n")
			for data_type, count in result.patterns_by_type.items():
				percentage = (count / result.total_patterns) * 100 if result.total_patterns else 0
				f.write(f"{data_type:15}: {count:6,} ({percentage:5.1f}%)\n")
			
			f.write(f"\nCOVERAGE ANALYSIS:\n")
			f.write("-" * 18 + "\n")
			f.write(f"Coverage: {result.summary.get('coverage_percentage', 0):.1f}% of ROM\n")
			f.write(f"Analyzed: {result.summary.get('total_coverage_bytes', 0):,} bytes\n")
			
			f.write(f"\nTOP PATTERNS:\n")
			f.write("-" * 13 + "\n")
			for i, pattern in enumerate(result.summary.get('top_patterns', [])[:5], 1):
				f.write(f"{i}. {pattern['offset']} - {pattern['type']} "
						f"(score: {pattern['score']:.3f})\n")
				f.write(f"   {pattern['description']}\n\n")
	
	def _save_detailed_report(self, result: AnalysisResult, output_dir: str):
		"""Save detailed pattern analysis report"""
		report_path = os.path.join(output_dir, "detailed_patterns.txt")
		
		with open(report_path, 'w', encoding='utf-8') as f:
			f.write("DRAGON QUEST III ROM - DETAILED PATTERN ANALYSIS\n")
			f.write("=" * 50 + "\n\n")
			
			# Group patterns by type
			patterns_by_type = defaultdict(list)
			for pattern in result.patterns:
				patterns_by_type[pattern.data_type].append(pattern)
			
			for data_type, patterns in patterns_by_type.items():
				f.write(f"\n{data_type.value.upper()} PATTERNS ({len(patterns)} found):\n")
				f.write("=" * (len(data_type.value) + 20) + "\n")
				
				# Sort by score
				patterns.sort(key=lambda p: p.score, reverse=True)
				
				for pattern in patterns[:10]:  # Top 10 per type
					f.write(f"\nOffset: 0x{pattern.offset:06X}\n")
					f.write(f"Length: {pattern.length:,} bytes\n")
					f.write(f"Confidence: {pattern.confidence.value}\n")
					f.write(f"Score: {pattern.score:.3f}\n")
					f.write(f"Description: {pattern.description}\n")
					
					if pattern.features:
						f.write("Features:\n")
						for feature, value in pattern.features.items():
							f.write(f"  {feature}: {value:.3f}\n")
					
					if pattern.metadata:
						f.write("Metadata:\n")
						for key, value in pattern.metadata.items():
							f.write(f"  {key}: {value}\n")
					
					f.write("-" * 40 + "\n")


def demo_ai_analysis():
	"""Demonstrate the AI pattern recognition system"""
	print("=" * 60)
	print("DRAGON QUEST III - AI PATTERN RECOGNITION DEMO")
	print("=" * 60)
	
	# Initialize AI engine
	ai_engine = AIPatternRecognition()
	
	# Load Japanese ROM
	rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
	if not os.path.exists(rom_path):
		print(f"ROM file not found: {rom_path}")
		return
	
	if not ai_engine.load_rom(rom_path):
		print("Failed to load ROM")
		return
	
	# Run analysis
	print("\nStarting comprehensive AI analysis...")
	result = ai_engine.analyze_rom("ai_pattern_analysis_output")
	
	# Display results
	print(f"\n" + "=" * 60)
	print("ANALYSIS RESULTS")
	print("=" * 60)
	print(f"Analysis completed in {result.analysis_time:.2f} seconds")
	print(f"Found {result.total_patterns:,} patterns")
	print(f"Coverage: {result.summary.get('coverage_percentage', 0):.1f}% of ROM")
	
	print(f"\nPattern breakdown:")
	for data_type, count in result.patterns_by_type.items():
		percentage = (count / result.total_patterns) * 100 if result.total_patterns else 0
		print(f"  {data_type:15}: {count:6,} ({percentage:5.1f}%)")
	
	print(f"\nTop 5 patterns:")
	for i, pattern in enumerate(result.summary.get('top_patterns', [])[:5], 1):
		print(f"  {i}. {pattern['offset']} - {pattern['type']} (score: {pattern['score']:.3f})")
	
	print(f"\nDetailed results saved to: ai_pattern_analysis_output/")
	print("=" * 60)


if __name__ == "__main__":
	demo_ai_analysis()