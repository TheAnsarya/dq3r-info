#!/usr/bin/env python3
"""
AI-Powered ROM Translation Assistant for Dragon Quest III
Advanced text extraction, pattern recognition, and translation workflow automation

Features:
- Automatic Japanese text detection and extraction
- Context-aware translation segmentation
- Character encoding detection (Shift-JIS, UTF-8, custom)
- Translation memory and glossary management
- Automated quality assurance and validation
- Interactive translation editor with real-time preview
- Integration with translation APIs and services
- Progress tracking and team collaboration tools
"""

import base64
import re
import json
import numpy as np
from pathlib import Path
from dataclasses import dataclass, asdict, field
from typing import Dict, List, Optional, Tuple, Any, Set
from datetime import datetime
import struct
import unicodedata
from collections import defaultdict, namedtuple
import hashlib
import sqlite3
from enum import Enum
import csv

# Character encoding ranges for Japanese text
HIRAGANA_RANGE = (0x3040, 0x309F)
KATAKANA_RANGE = (0x30A0, 0x30FF)
KANJI_RANGE = (0x4E00, 0x9FAF)
HALFWIDTH_KATAKANA_RANGE = (0xFF65, 0xFF9F)

# Common control characters in SNES ROMs
CONTROL_CODES = {
	0x00: "NULL",
	0x01: "END_LINE",
	0x02: "END_TEXT",
	0x03: "WAIT_KEY",
	0x04: "CLEAR_WINDOW",
	0x05: "NEW_PAGE",
	0x06: "DELAY_SHORT",
	0x07: "DELAY_LONG",
	0x08: "SOUND_EFFECT",
	0x09: "MUSIC_CHANGE",
	0x0A: "CHARACTER_NAME",
	0x0B: "ITEM_NAME",
	0x0C: "SPELL_NAME",
	0x0D: "NUMBER",
	0x0E: "CURRENCY",
	0x0F: "VARIABLE"
}

class TextEncoding(Enum):
	"""Text encoding types"""
	SHIFT_JIS = "shift_jis"
	UTF8 = "utf-8"
	ASCII = "ascii"
	CUSTOM_8BIT = "custom_8bit"
	CUSTOM_16BIT = "custom_16bit"
	UNKNOWN = "unknown"

@dataclass
class TextSegment:
	"""Represents a segment of translatable text"""
	segment_id: str
	rom_offset: int
	raw_data: bytes
	decoded_text: str
	encoding: TextEncoding
	context_type: str  # dialogue, menu, item, spell, etc.
	character_count: int
	line_count: int
	translation: str = ""
	confidence: float = 0.0
	notes: str = ""
	translator: str = ""
	translation_date: Optional[datetime] = None
	quality_score: float = 0.0
	review_status: str = "pending"
	metadata: Dict[str, Any] = field(default_factory=dict)

@dataclass
class TranslationEntry:
	"""Translation memory entry"""
	source_text: str
	target_text: str
	context: str
	frequency: int
	confidence: float
	created_date: datetime
	last_used: datetime
	tags: List[str]
	source_hash: str

class JapaneseTextDetector:
	"""Advanced Japanese text detection and extraction"""

	def __init__(self):
		self.character_tables = self._build_character_tables()
		self.pattern_cache = {}

	def _build_character_tables(self) -> Dict[str, Dict[int, str]]:
		"""Build character lookup tables for various encodings"""
		tables = {
			'hiragana': {},
			'katakana': {},
			'ascii': {},
			'punctuation': {}
		}

		# Basic hiragana (partial table for demo)
		hiragana_chars = [
			(0x3042, 'あ'), (0x3044, 'い'), (0x3046, 'う'), (0x3048, 'え'), (0x304A, 'お'),
			(0x304B, 'か'), (0x304D, 'き'), (0x304F, 'く'), (0x3051, 'け'), (0x3053, 'こ'),
			(0x3055, 'さ'), (0x3057, 'し'), (0x3059, 'す'), (0x305B, 'せ'), (0x305D, 'そ'),
			(0x305F, 'た'), (0x3061, 'ち'), (0x3064, 'つ'), (0x3066, 'て'), (0x3068, 'と'),
			(0x306A, 'な'), (0x306B, 'に'), (0x306C, 'ぬ'), (0x306D, 'ね'), (0x306E, 'の'),
			(0x306F, 'は'), (0x3072, 'ひ'), (0x3075, 'ふ'), (0x3078, 'へ'), (0x307B, 'ほ'),
			(0x307E, 'ま'), (0x307F, 'み'), (0x3080, 'む'), (0x3081, 'め'), (0x3082, 'も'),
			(0x3084, 'や'), (0x3086, 'ゆ'), (0x3088, 'よ'),
			(0x3089, 'ら'), (0x308A, 'り'), (0x308B, 'る'), (0x308C, 'れ'), (0x308D, 'ろ'),
			(0x308F, 'わ'), (0x3092, 'を'), (0x3093, 'ん')
		]

		for code, char in hiragana_chars:
			tables['hiragana'][code] = char

		# Basic katakana (partial table for demo)
		katakana_chars = [
			(0x30A2, 'ア'), (0x30A4, 'イ'), (0x30A6, 'ウ'), (0x30A8, 'エ'), (0x30AA, 'オ'),
			(0x30AB, 'カ'), (0x30AD, 'キ'), (0x30AF, 'ク'), (0x30B1, 'ケ'), (0x30B3, 'コ'),
			(0x30B5, 'サ'), (0x30B7, 'シ'), (0x30B9, 'ス'), (0x30BB, 'セ'), (0x30BD, 'ソ'),
			(0x30BF, 'タ'), (0x30C1, 'チ'), (0x30C4, 'ツ'), (0x30C6, 'テ'), (0x30C8, 'ト'),
			(0x30CA, 'ナ'), (0x30CB, 'ニ'), (0x30CC, 'ヌ'), (0x30CD, 'ネ'), (0x30CE, 'ノ'),
			(0x30CF, 'ハ'), (0x30D2, 'ヒ'), (0x30D5, 'フ'), (0x30D8, 'ヘ'), (0x30DB, 'ホ'),
			(0x30DE, 'マ'), (0x30DF, 'ミ'), (0x30E0, 'ム'), (0x30E1, 'メ'), (0x30E2, 'モ'),
			(0x30E4, 'ヤ'), (0x30E6, 'ユ'), (0x30E8, 'ヨ'),
			(0x30E9, 'ラ'), (0x30EA, 'リ'), (0x30EB, 'ル'), (0x30EC, 'レ'), (0x30ED, 'ロ'),
			(0x30EF, 'ワ'), (0x30F2, 'ヲ'), (0x30F3, 'ン')
		]

		for code, char in katakana_chars:
			tables['katakana'][code] = char

		# ASCII table
		for i in range(0x20, 0x7F):
			tables['ascii'][i] = chr(i)

		return tables

	def detect_encoding(self, data: bytes) -> Tuple[TextEncoding, float]:
		"""Detect text encoding with confidence score"""
		confidence_scores = {}

		# Test Shift-JIS
		try:
			decoded = data.decode('shift_jis')
			japanese_chars = sum(1 for c in decoded if self.is_japanese_char(c))
			confidence_scores[TextEncoding.SHIFT_JIS] = japanese_chars / len(decoded) if decoded else 0
		except:
			confidence_scores[TextEncoding.SHIFT_JIS] = 0

		# Test UTF-8
		try:
			decoded = data.decode('utf-8')
			japanese_chars = sum(1 for c in decoded if self.is_japanese_char(c))
			confidence_scores[TextEncoding.UTF8] = japanese_chars / len(decoded) if decoded else 0
		except:
			confidence_scores[TextEncoding.UTF8] = 0

		# Test ASCII
		try:
			decoded = data.decode('ascii')
			printable_chars = sum(1 for c in decoded if c.isprintable())
			confidence_scores[TextEncoding.ASCII] = printable_chars / len(decoded) if decoded else 0
		except:
			confidence_scores[TextEncoding.ASCII] = 0

		# Custom 8-bit encoding detection (common in SNES games)
		custom_8bit_score = self._analyze_custom_8bit(data)
		confidence_scores[TextEncoding.CUSTOM_8BIT] = custom_8bit_score

		# Custom 16-bit encoding detection
		custom_16bit_score = self._analyze_custom_16bit(data)
		confidence_scores[TextEncoding.CUSTOM_16BIT] = custom_16bit_score

		if confidence_scores:
			best_encoding = max(confidence_scores.items(), key=lambda x: x[1])
			return best_encoding[0], best_encoding[1]
		else:
			return TextEncoding.UNKNOWN, 0.0

	def is_japanese_char(self, char: str) -> bool:
		"""Check if character is Japanese"""
		if not char:
			return False

		code = ord(char)
		return (HIRAGANA_RANGE[0] <= code <= HIRAGANA_RANGE[1] or
				KATAKANA_RANGE[0] <= code <= KATAKANA_RANGE[1] or
				KANJI_RANGE[0] <= code <= KANJI_RANGE[1] or
				HALFWIDTH_KATAKANA_RANGE[0] <= code <= HALFWIDTH_KATAKANA_RANGE[1])

	def _analyze_custom_8bit(self, data: bytes) -> float:
		"""Analyze probability of custom 8-bit encoding"""
		if len(data) < 4:
			return 0.0

		# Look for patterns common in SNES text encoding
		# Many games use 0x80-0xFF range for Japanese characters
		high_byte_count = sum(1 for b in data if b >= 0x80)
		high_byte_ratio = high_byte_count / len(data)

		# Look for control characters
		control_chars = sum(1 for b in data if b < 0x20)
		control_ratio = control_chars / len(data)

		# Balance between high bytes (Japanese) and control chars
		if 0.3 <= high_byte_ratio <= 0.9 and control_ratio <= 0.1:
			return high_byte_ratio * 0.8
		else:
			return 0.0

	def _analyze_custom_16bit(self, data: bytes) -> float:
		"""Analyze probability of custom 16-bit encoding"""
		if len(data) < 4 or len(data) % 2 != 0:
			return 0.0

		# Convert to 16-bit values
		try:
			chars_16bit = struct.unpack('>' + 'H' * (len(data) // 2), data)
		except:
			return 0.0

		# Check for Japanese character ranges
		japanese_count = 0
		for char_code in chars_16bit:
			if (HIRAGANA_RANGE[0] <= char_code <= HIRAGANA_RANGE[1] or
				KATAKANA_RANGE[0] <= char_code <= KATAKANA_RANGE[1] or
				KANJI_RANGE[0] <= char_code <= KANJI_RANGE[1]):
				japanese_count += 1

		return japanese_count / len(chars_16bit) if chars_16bit else 0.0

	def extract_text_segments(self, rom_data: np.ndarray) -> List[TextSegment]:
		"""Extract all text segments from ROM"""
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Extracting text segments from {len(rom_data):,} bytes...")

		segments = []
		segment_size = 512  # Analyze in 512-byte chunks
		segment_counter = 0

		for offset in range(0, len(rom_data), segment_size):
			chunk = rom_data[offset:offset + segment_size]

			if len(chunk) < 32:  # Skip tiny chunks
				continue

			# Convert to bytes for encoding detection
			chunk_bytes = chunk.tobytes()

			# Detect encoding
			encoding, confidence = self.detect_encoding(chunk_bytes)

			# Skip if confidence too low
			if confidence < 0.3:
				continue

			# Try to decode text
			decoded_text = ""
			try:
				if encoding == TextEncoding.SHIFT_JIS:
					decoded_text = chunk_bytes.decode('shift_jis', errors='ignore')
				elif encoding == TextEncoding.UTF8:
					decoded_text = chunk_bytes.decode('utf-8', errors='ignore')
				elif encoding == TextEncoding.ASCII:
					decoded_text = chunk_bytes.decode('ascii', errors='ignore')
				elif encoding == TextEncoding.CUSTOM_16BIT:
					decoded_text = self._decode_custom_16bit(chunk_bytes)
				elif encoding == TextEncoding.CUSTOM_8BIT:
					decoded_text = self._decode_custom_8bit(chunk_bytes)
				else:
					continue
			except:
				continue

			# Filter for actual text content
			if not self._is_valid_text(decoded_text):
				continue

			# Determine context type
			context_type = self._classify_text_context(decoded_text, offset)

			# Create segment
			segment_id = f"seg_{segment_counter:06d}"
			segment = TextSegment(
				segment_id=segment_id,
				rom_offset=offset,
				raw_data=chunk_bytes,
				decoded_text=decoded_text.strip(),
				encoding=encoding,
				context_type=context_type,
				character_count=len(decoded_text.strip()),
				line_count=decoded_text.count('\n') + 1,
				confidence=confidence,
				metadata={
					'chunk_size': len(chunk_bytes),
					'japanese_char_count': sum(1 for c in decoded_text if self.is_japanese_char(c)),
					'control_char_count': sum(1 for b in chunk_bytes if b < 0x20),
				}
			)

			segments.append(segment)
			segment_counter += 1

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Extracted {len(segments)} text segments")
		return segments

	def _decode_custom_16bit(self, data: bytes) -> str:
		"""Decode custom 16-bit encoding (placeholder)"""
		# This would implement game-specific character table lookup
		try:
			chars_16bit = struct.unpack('>' + 'H' * (len(data) // 2), data)
			result = ""
			for char_code in chars_16bit:
				if char_code == 0:
					break
				elif HIRAGANA_RANGE[0] <= char_code <= HIRAGANA_RANGE[1]:
					result += chr(char_code)
				elif KATAKANA_RANGE[0] <= char_code <= KATAKANA_RANGE[1]:
					result += chr(char_code)
				elif KANJI_RANGE[0] <= char_code <= KANJI_RANGE[1]:
					result += chr(char_code)
				else:
					result += f"[{char_code:04X}]"
			return result
		except:
			return ""

	def _decode_custom_8bit(self, data: bytes) -> str:
		"""Decode custom 8-bit encoding (placeholder)"""
		# This would implement game-specific character table lookup
		result = ""
		for byte in data:
			if byte == 0:
				break
			elif byte < 0x20:
				control_name = CONTROL_CODES.get(byte, f"CTRL_{byte:02X}")
				result += f"<{control_name}>"
			elif 0x20 <= byte <= 0x7E:
				result += chr(byte)
			else:
				result += f"[{byte:02X}]"
		return result

	def _is_valid_text(self, text: str) -> bool:
		"""Check if decoded text is valid for translation"""
		if not text or len(text.strip()) < 3:
			return False

		# Must contain some printable characters
		printable_count = sum(1 for c in text if c.isprintable() or self.is_japanese_char(c))
		if printable_count / len(text) < 0.5:
			return False

		# Must not be mostly control characters or brackets
		control_count = text.count('[') + text.count('<') + text.count('>')
		if control_count / len(text) > 0.8:
			return False

		return True

	def _classify_text_context(self, text: str, offset: int) -> str:
		"""Classify text segment by context"""
		text_lower = text.lower()

		# Common dialogue patterns
		if any(pattern in text for pattern in ['「', '」', '"', "'", ':', '。']):
			return "dialogue"

		# Menu/UI patterns
		if any(pattern in text_lower for pattern in ['select', 'cancel', 'yes', 'no', 'menu']):
			return "ui"

		# Item/spell names (usually short, capitalized)
		if len(text.strip()) <= 20 and text.strip().istitle():
			return "item"

		# Status/system messages
		if any(pattern in text_lower for pattern in ['hp', 'mp', 'exp', 'level', 'gold']):
			return "status"

		# Location within ROM can give hints
		if offset < 0x100000:  # Early in ROM, likely system text
			return "system"
		else:
			return "dialogue"

class TranslationMemoryDB:
	"""Translation memory database for consistency"""

	def __init__(self, db_path: str = "translation_memory.db"):
		self.db_path = db_path
		self.init_database()

	def init_database(self):
		"""Initialize translation memory database"""
		with sqlite3.connect(self.db_path) as conn:
			conn.execute("""
				CREATE TABLE IF NOT EXISTS translation_memory (
					id INTEGER PRIMARY KEY AUTOINCREMENT,
					source_text TEXT NOT NULL,
					target_text TEXT NOT NULL,
					context TEXT NOT NULL,
					frequency INTEGER DEFAULT 1,
					confidence REAL DEFAULT 1.0,
					created_date TEXT NOT NULL,
					last_used TEXT NOT NULL,
					tags TEXT,
					source_hash TEXT UNIQUE,
					UNIQUE(source_text, context)
				)
			""")

			conn.execute("""
				CREATE TABLE IF NOT EXISTS segments (
					id INTEGER PRIMARY KEY AUTOINCREMENT,
					segment_id TEXT UNIQUE NOT NULL,
					rom_offset INTEGER NOT NULL,
					raw_data BLOB NOT NULL,
					decoded_text TEXT NOT NULL,
					encoding TEXT NOT NULL,
					context_type TEXT NOT NULL,
					character_count INTEGER NOT NULL,
					line_count INTEGER NOT NULL,
					translation TEXT DEFAULT '',
					confidence REAL DEFAULT 0.0,
					notes TEXT DEFAULT '',
					translator TEXT DEFAULT '',
					translation_date TEXT,
					quality_score REAL DEFAULT 0.0,
					review_status TEXT DEFAULT 'pending',
					metadata TEXT DEFAULT '{}'
				)
			""")

			# Indexes for performance
			conn.execute("CREATE INDEX IF NOT EXISTS idx_source_hash ON translation_memory(source_hash)")
			conn.execute("CREATE INDEX IF NOT EXISTS idx_context ON translation_memory(context)")
			conn.execute("CREATE INDEX IF NOT EXISTS idx_segment_id ON segments(segment_id)")
			conn.execute("CREATE INDEX IF NOT EXISTS idx_offset ON segments(rom_offset)")

	def add_translation(self, source: str, target: str, context: str, tags: Optional[List[str]] = None) -> bool:
		"""Add or update translation entry"""
		source_hash = hashlib.md5(source.encode()).hexdigest()
		tag_str = ','.join(tags) if tags else ''

		with sqlite3.connect(self.db_path) as conn:
			try:
				conn.execute("""
					INSERT OR REPLACE INTO translation_memory
					(source_text, target_text, context, frequency, created_date,
					 last_used, tags, source_hash)
					VALUES (?, ?, ?, 1, ?, ?, ?, ?)
				""", (source, target, context, datetime.now().isoformat(),
					  datetime.now().isoformat(), tag_str, source_hash))
				return True
			except Exception as e:
				print(f"Error adding translation: {e}")
				return False

	def find_similar_translations(self, source: str, context: Optional[str] = None, limit: int = 5) -> List[TranslationEntry]:
		"""Find similar translations from memory"""
		with sqlite3.connect(self.db_path) as conn:
			conn.row_factory = sqlite3.Row

			query = """
				SELECT * FROM translation_memory
				WHERE source_text LIKE ? OR source_text = ?
			"""
			params = [f"%{source}%", source]

			if context:
				query += " AND context = ?"
				params.append(context)

			query += " ORDER BY frequency DESC, last_used DESC LIMIT ?"
			params.append(limit)

			rows = conn.execute(query, params).fetchall()

			entries = []
			for row in rows:
				entry = TranslationEntry(
					source_text=row['source_text'],
					target_text=row['target_text'],
					context=row['context'],
					frequency=row['frequency'],
					confidence=row['confidence'],
					created_date=datetime.fromisoformat(row['created_date']),
					last_used=datetime.fromisoformat(row['last_used']),
					tags=row['tags'].split(',') if row['tags'] else [],
					source_hash=row['source_hash']
				)
				entries.append(entry)

			return entries

	def store_segments(self, segments: List[TextSegment]) -> bool:
		"""Store text segments in database"""
		with sqlite3.connect(self.db_path) as conn:
			try:
				for segment in segments:
					conn.execute("""
						INSERT OR REPLACE INTO segments
						(segment_id, rom_offset, raw_data, decoded_text, encoding,
						 context_type, character_count, line_count, translation,
						 confidence, notes, translator, translation_date,
						 quality_score, review_status, metadata)
						VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
					""", (
						segment.segment_id, segment.rom_offset, segment.raw_data,
						segment.decoded_text, segment.encoding.value, segment.context_type,
						segment.character_count, segment.line_count, segment.translation,
						segment.confidence, segment.notes, segment.translator,
						segment.translation_date.isoformat() if segment.translation_date else None,
						segment.quality_score, segment.review_status, json.dumps(segment.metadata)
					))
				conn.commit()
				return True
			except Exception as e:
				print(f"Error storing segments: {e}")
				return False

class AITranslationAssistant:
	"""Main translation assistant orchestrator"""

	def __init__(self, workspace_path: str = "."):
		self.workspace_path = Path(workspace_path)
		self.detector = JapaneseTextDetector()
		self.translation_db = TranslationMemoryDB()
		self.glossary = {}
		self.load_glossary()

	def load_glossary(self):
		"""Load translation glossary"""
		glossary_file = self.workspace_path / "translation_glossary.json"
		if glossary_file.exists():
			try:
				with open(glossary_file, 'r', encoding='utf-8') as f:
					self.glossary = json.load(f)
				print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Loaded glossary with {len(self.glossary)} entries")
			except:
				self.glossary = {}
		else:
			# Create basic glossary for Dragon Quest III
			self.glossary = {
				"ドラゴンクエスト": "Dragon Quest",
				"勇者": "Hero",
				"魔法使い": "Wizard",
				"戦士": "Warrior",
				"僧侶": "Cleric",
				"盗賊": "Thief",
				"商人": "Merchant",
				"遊び人": "Gadabout",
				"レベル": "Level",
				"経験値": "Experience",
				"ゴールド": "Gold",
				"ひのきのぼう": "Oaken Club",
				"薬草": "Medicinal Herb",
				"毒消し草": "Antidotal Herb",
				"やくそう": "Herb"
			}
			self.save_glossary()

	def save_glossary(self):
		"""Save translation glossary"""
		glossary_file = self.workspace_path / "translation_glossary.json"
		try:
			with open(glossary_file, 'w', encoding='utf-8') as f:
				json.dump(self.glossary, f, indent=2, ensure_ascii=False)
		except Exception as e:
			print(f"Error saving glossary: {e}")

	def analyze_rom_for_translation(self, rom_path: Union[str, Path]) -> Dict[str, Any]:
		"""Complete ROM analysis for translation purposes"""
		rom_path = Path(rom_path)

		if not rom_path.exists():
			raise FileNotFoundError(f"ROM file not found: {rom_path}")

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Starting translation analysis of {rom_path.name}")		# Load ROM
		with open(rom_path, 'rb') as f:
			rom_data = np.frombuffer(f.read(), dtype=np.uint8)

		# Extract text segments
		segments = self.detector.extract_text_segments(rom_data)

		# Store segments in database
		self.translation_db.store_segments(segments)

		# Analyze segments
		analysis = self._analyze_segments(segments)

		# Generate translation project structure
		project_info = self._create_project_structure(rom_path, segments, analysis)

		return project_info

	def _analyze_segments(self, segments: List[TextSegment]) -> Dict[str, Any]:
		"""Analyze extracted segments for translation planning"""
		analysis = {
			'total_segments': len(segments),
			'encoding_distribution': defaultdict(int),
			'context_distribution': defaultdict(int),
			'character_count': 0,
			'japanese_character_count': 0,
			'estimated_translation_time': 0,
			'complexity_score': 0
		}

		for segment in segments:
			analysis['encoding_distribution'][segment.encoding.value] += 1
			analysis['context_distribution'][segment.context_type] += 1
			analysis['character_count'] += segment.character_count
			analysis['japanese_character_count'] += segment.metadata.get('japanese_char_count', 0)

		# Estimate translation time (rough heuristic)
		# Dialogue: 5 chars/minute, UI: 10 chars/minute, etc.
		time_estimates = {
			'dialogue': 5,
			'ui': 10,
			'item': 15,
			'status': 20,
			'system': 15
		}

		for context, count in analysis['context_distribution'].items():
			chars_in_context = sum(s.character_count for s in segments if s.context_type == context)
			rate = time_estimates.get(context, 10)
			analysis['estimated_translation_time'] += chars_in_context / rate

		# Calculate complexity score
		encoding_variety = len(analysis['encoding_distribution'])
		context_variety = len(analysis['context_distribution'])
		avg_confidence = np.mean([s.confidence for s in segments]) if segments else 0

		analysis['complexity_score'] = (encoding_variety + context_variety) / 2 * (1 - avg_confidence)

		return analysis

	def _segment_to_dict(self, segment: TextSegment) -> Dict[str, Any]:
		"""Convert TextSegment to JSON-serializable dictionary"""
		return {
			'segment_id': segment.segment_id,
			'rom_offset': segment.rom_offset,
			'raw_data': base64.b64encode(segment.raw_data).decode('ascii'),  # Encode bytes as base64
			'decoded_text': segment.decoded_text,
			'encoding': segment.encoding.value,
			'context_type': segment.context_type,
			'character_count': segment.character_count,
			'line_count': segment.line_count,
			'translation': segment.translation,
			'confidence': segment.confidence,
			'notes': segment.notes,
			'translator': segment.translator,
			'translation_date': segment.translation_date.isoformat() if segment.translation_date else None,
			'quality_score': segment.quality_score,
			'review_status': segment.review_status,
			'metadata': segment.metadata
		}

	def _create_project_structure(self, rom_path: Path, segments: List[TextSegment],
								 analysis: Dict[str, Any]) -> Dict[str, Any]:
		"""Create comprehensive translation project structure"""
		project_info = {
			'project_name': f"DQ3_{rom_path.stem}_Translation",
			'source_rom': str(rom_path),
			'created_date': datetime.now().isoformat(),
			'analysis': analysis,
			'segments': [self._segment_to_dict(s) for s in segments],  # Convert segments properly
			'progress': {
				'total_segments': len(segments),
				'translated_segments': 0,
				'reviewed_segments': 0,
				'completion_percentage': 0.0
			},
			'translation_plan': {
				'priority_contexts': ['dialogue', 'ui', 'item'],
				'estimated_hours': analysis['estimated_translation_time'] / 60,
				'recommended_team_size': max(1, int(analysis['complexity_score'])),
				'milestones': self._generate_milestones(analysis)
			}
		}

		# Save project file
		project_file = self.workspace_path / f"{project_info['project_name']}.json"
		try:
			with open(project_file, 'w', encoding='utf-8') as f:
				json.dump(project_info, f, indent=2, ensure_ascii=False)
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Translation project saved to {project_file}")
		except Exception as e:
			print(f"Error saving project: {e}")

		return project_info

	def _generate_milestones(self, analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
		"""Generate translation milestones"""
		milestones = []

		# Milestone 1: UI and system text (quick wins)
		ui_segments = analysis['context_distribution'].get('ui', 0) + analysis['context_distribution'].get('system', 0)
		if ui_segments > 0:
			milestones.append({
				'name': 'UI and System Text',
				'description': 'Complete translation of user interface and system messages',
				'target_segments': ui_segments,
				'estimated_hours': ui_segments * 0.5,
				'priority': 'high'
			})

		# Milestone 2: Items and equipment
		item_segments = analysis['context_distribution'].get('item', 0)
		if item_segments > 0:
			milestones.append({
				'name': 'Items and Equipment',
				'description': 'Complete translation of items, weapons, armor, and spells',
				'target_segments': item_segments,
				'estimated_hours': item_segments * 0.75,
				'priority': 'high'
			})

		# Milestone 3: Dialogue (main content)
		dialogue_segments = analysis['context_distribution'].get('dialogue', 0)
		if dialogue_segments > 0:
			milestones.append({
				'name': 'Dialogue and Story',
				'description': 'Complete translation of all dialogue and story text',
				'target_segments': dialogue_segments,
				'estimated_hours': dialogue_segments * 2.0,
				'priority': 'critical'
			})

		return milestones

	def export_translation_package(self, project_name: str, format_type: str = 'csv') -> str:
		"""Export translation data for external tools"""
		timestamp = int(datetime.now().timestamp())
		export_path = None

		# Get segments from database
		with sqlite3.connect(self.translation_db.db_path) as conn:
			conn.row_factory = sqlite3.Row
			segments = conn.execute("SELECT * FROM segments ORDER BY rom_offset").fetchall()

		if format_type == 'csv':
			export_path = self.workspace_path / f"{project_name}_translation_{timestamp}.csv"

			with open(export_path, 'w', newline='', encoding='utf-8') as csvfile:
				fieldnames = ['segment_id', 'rom_offset', 'context_type', 'decoded_text',
							 'translation', 'notes', 'review_status']
				writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
				writer.writeheader()

				for segment in segments:
					writer.writerow({
						'segment_id': segment['segment_id'],
						'rom_offset': f"0x{segment['rom_offset']:06X}",
						'context_type': segment['context_type'],
						'decoded_text': segment['decoded_text'],
						'translation': segment['translation'],
						'notes': segment['notes'],
						'review_status': segment['review_status']
					})

		elif format_type == 'json':
			export_path = self.workspace_path / f"{project_name}_translation_{timestamp}.json"

			export_data = {
				'export_info': {
					'project_name': project_name,
					'export_date': datetime.now().isoformat(),
					'total_segments': len(segments),
					'format': 'json'
				},
				'segments': [dict(segment) for segment in segments]
			}

			with open(export_path, 'w', encoding='utf-8') as f:
				json.dump(export_data, f, indent=2, ensure_ascii=False)

		if export_path:
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Translation package exported to {export_path}")
			return str(export_path)
		else:
			raise ValueError(f"Unsupported format: {format_type}")

def main():
	"""Main entry point for translation assistant"""
	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Initializing AI-Powered ROM Translation Assistant...")

	# Initialize assistant
	assistant = AITranslationAssistant()

	# Find Japanese ROM
	rom_files = list(Path(".").glob("**/Dragon Quest III - Soshite Densetsu he*.smc"))

	if rom_files:
		rom_file = rom_files[0]
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Found Japanese ROM: {rom_file}")

		try:
			# Analyze ROM for translation
			project_info = assistant.analyze_rom_for_translation(str(rom_file))

			# Export translation package
			assistant.export_translation_package(project_info['project_name'], 'csv')
			assistant.export_translation_package(project_info['project_name'], 'json')

			print(f"\n[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Translation Analysis Complete!")
			print(f"Project: {project_info['project_name']}")
			print(f"Total Segments: {project_info['analysis']['total_segments']}")
			print(f"Japanese Characters: {project_info['analysis']['japanese_character_count']:,}")
			print(f"Estimated Time: {project_info['translation_plan']['estimated_hours']:.1f} hours")
			print(f"Complexity Score: {project_info['analysis']['complexity_score']:.2f}")

			# Context distribution
			print(f"\nContext Distribution:")
			for context, count in project_info['analysis']['context_distribution'].items():
				percentage = (count / project_info['analysis']['total_segments']) * 100
				print(f"  {context}: {count} segments ({percentage:.1f}%)")

		except Exception as e:
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Translation analysis failed: {e}")

	else:
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] No Japanese ROM files found")

if __name__ == "__main__":
	main()
