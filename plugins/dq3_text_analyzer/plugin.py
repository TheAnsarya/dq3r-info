"""
DQ3 Text Analyzer Plugin
========================

Advanced text analysis plugin for Dragon Quest III ROM.

Created: 2025-11-09
"""

from plugins.base_plugin import AnalyzerPlugin, PluginStatus
from typing import Dict, Any, List

class DQ3TextAnalyzerPlugin(AnalyzerPlugin):
	"""Implementation of DQ3 Text Analyzer plugin"""

	def initialize(self, config: Dict[str, Any]) -> bool:
		"""Initialize the plugin"""
		try:
			self.config = config
			self.text_encoding = config.get('text_encoding', 'shift_jis')
			self.min_string_length = config.get('min_string_length', 3)
			self.search_ranges = config.get('search_ranges', [])

			self.set_status(PluginStatus.ENABLED)
			self.log_info("DQ3 Text Analyzer initialized successfully")
			return True
		except Exception as e:
			self.log_error(f"Failed to initialize: {e}")
			self.set_status(PluginStatus.ERROR, str(e))
			return False

	def process_rom(self, rom_path: str, output_dir: str) -> Dict[str, Any]:
		"""Process the ROM file"""
		try:
			self.load_rom(rom_path)
			self._output_dir = output_dir

			# Find Japanese text strings
			text_strings = self.find_japanese_strings()

			# Analyze dialogue structure
			dialogue_analysis = self.analyze_dialogue_structure()

			# Extract character names
			character_names = self.extract_character_names()

			results = {
				"plugin": "DQ3 Text Analyzer",
				"version": "1.0.0",
				"rom_size": self.get_rom_size(),
				"text_strings_found": len(text_strings),
				"dialogue_blocks": len(dialogue_analysis),
				"character_names": character_names,
				"text_strings": text_strings[:100],	# First 100 strings
				"processed": True
			}

			# Save detailed results
			self.write_output_file("text_strings.json", text_strings, format='json')
			self.write_output_file("dialogue_analysis.json", dialogue_analysis, format='json')
			self.write_output_file("character_names.json", character_names, format='json')
			self.write_output_file("text_analysis_summary.json", results, format='json')

			return results

		except Exception as e:
			self.log_error(f"ROM processing failed: {e}")
			return {"error": str(e), "processed": False}

	def find_japanese_strings(self) -> List[Dict[str, Any]]:
		"""Find Japanese text strings in ROM"""
		strings = []

		# Search for common Japanese characters
		for offset in range(0, self.get_rom_size() - 10, 1):
			try:
				# Read a chunk of bytes
				chunk = self.read_rom_bytes(offset, 20)

				# Try to decode as Japanese text
				try:
					text = chunk.decode(self.text_encoding, errors='ignore')
					if len(text) >= self.min_string_length and self.is_likely_japanese(text):
						strings.append({
							"offset": hex(offset),
							"length": len(text),
							"text": text,
							"bytes": chunk.hex()
						})
				except:
					continue

			except:
				continue

		return strings[:1000]	# Limit to 1000 strings

	def is_likely_japanese(self, text: str) -> bool:
		"""Check if text is likely Japanese"""
		# Simple heuristic - check for hiragana, katakana, or kanji
		japanese_chars = 0
		for char in text:
			code = ord(char)
			# Hiragana: 3040-309F, Katakana: 30A0-30FF, Kanji: 4E00-9FAF
			if (0x3040 <= code <= 0x309F) or (0x30A0 <= code <= 0x30FF) or (0x4E00 <= code <= 0x9FAF):
				japanese_chars += 1

		return japanese_chars > len(text) * 0.3	# At least 30% Japanese characters

	def analyze_dialogue_structure(self) -> List[Dict[str, Any]]:
		"""Analyze dialogue data structure"""
		dialogue_blocks = []

		# Look for dialogue patterns (this is a simplified example)
		for offset in range(0, self.get_rom_size() - 100, 100):
			try:
				chunk = self.read_rom_bytes(offset, 100)

				# Look for patterns that might indicate dialogue
				if self.is_dialogue_block(chunk):
					dialogue_blocks.append({
						"offset": hex(offset),
						"size": len(chunk),
						"pattern": "dialogue_block"
					})
			except:
				continue

		return dialogue_blocks

	def is_dialogue_block(self, data: bytes) -> bool:
		"""Simple heuristic to identify dialogue blocks"""
		# Look for common patterns in Dragon Quest III dialogue
		# This is a simplified example
		return len(data) > 20 and data[0] != 0x00 and data[1] != 0x00

	def extract_character_names(self) -> List[str]:
		"""Extract character names from ROM"""
		# This would contain the actual character names from DQ3
		# For now, return example names
		return [
			"勇者", "戦士", "僧侶", "魔法使い", "商人", "遊び人",
			"盗賊", "賢者", "アリアハン", "ラダトーム"
		]

	def analyze_section(self, offset: int, length: int) -> Dict[str, Any]:
		"""Analyze specific ROM section"""
		try:
			data = self.read_rom_bytes(offset, length)

			# Find text in this section
			text_count = 0
			for i in range(0, len(data) - 10, 1):
				chunk = data[i:i+10]
				try:
					text = chunk.decode(self.text_encoding, errors='ignore')
					if self.is_likely_japanese(text):
						text_count += 1
				except:
					continue

			return {
				"offset": hex(offset),
				"length": length,
				"text_density": text_count / length if length > 0 else 0,
				"likely_text_section": text_count > length * 0.1
			}

		except Exception as e:
			return {"error": str(e)}

	def get_configuration_schema(self) -> Dict[str, Any]:
		"""Get plugin configuration schema"""
		return {
			"type": "object",
			"properties": {
				"text_encoding": {
					"type": "string",
					"default": "shift_jis",
					"description": "Text encoding for Japanese characters"
				},
				"min_string_length": {
					"type": "integer",
					"default": 3,
					"description": "Minimum string length to consider"
				},
				"search_ranges": {
					"type": "array",
					"items": {
						"type": "object",
						"properties": {
							"start": {"type": "integer"},
							"end": {"type": "integer"}
						}
					},
					"description": "Specific ROM ranges to search"
				}
			},
			"required": []
		}

	def validate_configuration(self, config: Dict[str, Any]) -> tuple[bool, List[str]]:
		"""Validate plugin configuration"""
		errors = []

		if 'text_encoding' in config:
			try:
				"test".encode(config['text_encoding'])
			except LookupError:
				errors.append(f"Invalid text encoding: {config['text_encoding']}")

		if 'min_string_length' in config:
			if not isinstance(config['min_string_length'], int) or config['min_string_length'] < 1:
				errors.append("min_string_length must be a positive integer")

		return len(errors) == 0, errors

# Plugin factory function
def create_plugin(metadata):
	"""Factory function to create plugin instance"""
	return DQ3TextAnalyzerPlugin(metadata)
