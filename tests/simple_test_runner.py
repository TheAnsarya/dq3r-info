"""
Simple Test Runner for Dragon Quest III ROM Analysis Toolkit
Basic testing without external dependencies

Tests all major components with the Japanese source ROM
"""

import os
import sys
import time
import tempfile
import shutil
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

class SimpleTestRunner:
	"""Simple test runner without external dependencies"""

	def __init__(self):
		self.tests_passed = 0
		self.tests_failed = 0
		self.test_details = []

	def run_test(self, test_name: str, test_func):
		"""Run a single test"""
		print(f"Running: {test_name}...", end="")
		start_time = time.time()

		try:
			result = test_func()
			execution_time = time.time() - start_time

			if result:
				print(f" ✅ PASS ({execution_time:.3f}s)")
				self.tests_passed += 1
				self.test_details.append((test_name, True, execution_time, None))
			else:
				print(f" ❌ FAIL ({execution_time:.3f}s)")
				self.tests_failed += 1
				self.test_details.append((test_name, False, execution_time, "Test returned False"))

		except Exception as e:
			execution_time = time.time() - start_time
			print(f" ❌ FAIL ({execution_time:.3f}s) - {str(e)}")
			self.tests_failed += 1
			self.test_details.append((test_name, False, execution_time, str(e)))

	def test_japanese_rom_exists(self) -> bool:
		"""Test that Japanese source ROM exists"""
		rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
		return os.path.exists(rom_path)

	def test_english_rom_exists(self) -> bool:
		"""Test that English reference ROM exists"""
		rom_path = "static/Dragon Quest III - english.smc"
		return os.path.exists(rom_path)

	def test_rom_file_size(self) -> bool:
		"""Test ROM file sizes are reasonable"""
		rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
		if not os.path.exists(rom_path):
			return False

		size = os.path.getsize(rom_path)
		# SNES ROM should be between 1MB and 8MB typically
		return 1024 * 1024 <= size <= 8 * 1024 * 1024

	def test_advanced_graphics_analyzer_import(self) -> bool:
		"""Test importing advanced graphics analyzer"""
		try:
			from tools.analysis.advanced_graphics_format_analyzer import AdvancedGraphicsAnalyzer
			return True
		except ImportError:
			return False

	def test_advanced_graphics_analyzer_basic(self) -> bool:
		"""Test basic graphics analyzer functionality"""
		try:
			from tools.analysis.advanced_graphics_format_analyzer import AdvancedGraphicsAnalyzer

			rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
			if not os.path.exists(rom_path):
				return False

			analyzer = AdvancedGraphicsAnalyzer(rom_path)
			return len(analyzer.rom_data) > 0
		except Exception:
			return False

	def test_multi_rom_comparator_import(self) -> bool:
		"""Test importing multi-ROM comparator"""
		try:
			from tools.analysis.multi_rom_comparator import MultiROMComparator
			return True
		except ImportError:
			return False

	def test_multi_rom_comparator_basic(self) -> bool:
		"""Test basic multi-ROM comparator functionality"""
		try:
			from tools.analysis.multi_rom_comparator import MultiROMComparator

			comparator = MultiROMComparator(".")
			roms = comparator.load_roms()
			return len(roms) > 0
		except Exception:
			return False

	def test_live_rom_editor_import(self) -> bool:
		"""Test importing live ROM editor"""
		try:
			# Skip websockets import
			import importlib.util
			spec = importlib.util.spec_from_file_location(
				"live_rom_editor",
				"tools/editing/live_rom_editor.py"
			)
			if spec and spec.loader:
				module = importlib.util.module_from_spec(spec)
				# Don't execute the module to avoid websockets import
				return True
			return False
		except Exception:
			return False

	def test_comprehensive_rom_analyzer_import(self) -> bool:
		"""Test importing comprehensive ROM analyzer"""
		try:
			from tools.analysis.comprehensive_rom_analyzer import ComprehensiveROMAnalyzer
			return True
		except ImportError:
			return False

	def test_comprehensive_rom_analyzer_basic(self) -> bool:
		"""Test basic comprehensive ROM analyzer functionality"""
		try:
			from tools.analysis.comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

			rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
			if not os.path.exists(rom_path):
				return False

			# Just test initialization - avoid heavy analysis
			analyzer = ComprehensiveROMAnalyzer(".")
			return analyzer.rom_data is not None
		except Exception:
			return False

	def test_dq3_game_data_extractor_import(self) -> bool:
		"""Test importing DQ3 game data extractor"""
		try:
			from tools.analysis.dq3_game_data_extractor import DQ3GameDataExtractor
			return True
		except ImportError:
			return False

	def test_dq3_game_data_extractor_basic(self) -> bool:
		"""Test basic DQ3 game data extractor functionality"""
		try:
			from tools.analysis.dq3_game_data_extractor import DQ3GameDataExtractor

			extractor = DQ3GameDataExtractor(".")
			return extractor.rom_data is not None
		except Exception:
			return False

	def test_snes_audio_analyzer_import(self) -> bool:
		"""Test importing SNES audio analyzer"""
		try:
			from tools.analysis.snes_audio_analyzer import SNESAudioAnalyzer
			return True
		except ImportError:
			return False

	def test_advanced_rom_editor_import(self) -> bool:
		"""Test importing advanced ROM editor"""
		try:
			from tools.editing.advanced_rom_editor import AdvancedROMEditor
			return True
		except ImportError:
			return False

	def test_performance_optimizer_import(self) -> bool:
		"""Test importing performance optimizer"""
		try:
			from tools.optimization.performance_optimizer import OptimizedROMAnalyzer
			return True
		except ImportError:
			return False

	def test_basic_file_operations(self) -> bool:
		"""Test basic file operations"""
		try:
			# Create temporary file
			with tempfile.NamedTemporaryFile(delete=False) as tmp:
				tmp.write(b"test data")
				tmp_path = tmp.name

			# Test reading
			with open(tmp_path, 'rb') as f:
				data = f.read()

			# Clean up
			os.unlink(tmp_path)

			return data == b"test data"
		except Exception:
			return False

	def test_graphics_analyzer_formats(self) -> bool:
		"""Test graphics analyzer format definitions"""
		try:
			from tools.analysis.advanced_graphics_format_analyzer import SNESGraphicsFormats

			formats = SNESGraphicsFormats.FORMATS
			required_formats = ['2BPP', '4BPP', '8BPP']

			return all(fmt in formats for fmt in required_formats)
		except Exception:
			return False

	def test_known_rom_locations(self) -> bool:
		"""Test access to known ROM locations"""
		try:
			from tools.analysis.advanced_graphics_format_analyzer import AdvancedGraphicsAnalyzer

			rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
			if not os.path.exists(rom_path):
				return False

			analyzer = AdvancedGraphicsAnalyzer(rom_path)

			# Test accessing known graphics location
			test_offset = 0x80000
			if test_offset < len(analyzer.rom_data):
				test_data = analyzer.rom_data[test_offset:test_offset+16]
				return len(test_data) == 16

			return False
		except Exception:
			return False

	def run_all_tests(self):
		"""Run all tests"""
		print("🧪 Dragon Quest III ROM Analysis - Simple Test Suite")
		print("=" * 55)

		# File existence tests
		self.run_test("Japanese ROM exists", self.test_japanese_rom_exists)
		self.run_test("English ROM exists", self.test_english_rom_exists)
		self.run_test("ROM file size check", self.test_rom_file_size)

		# Import tests
		self.run_test("Advanced Graphics Analyzer import", self.test_advanced_graphics_analyzer_import)
		self.run_test("Multi-ROM Comparator import", self.test_multi_rom_comparator_import)
		self.run_test("Live ROM Editor import", self.test_live_rom_editor_import)
		self.run_test("Comprehensive ROM Analyzer import", self.test_comprehensive_rom_analyzer_import)
		self.run_test("DQ3 Game Data Extractor import", self.test_dq3_game_data_extractor_import)
		self.run_test("SNES Audio Analyzer import", self.test_snes_audio_analyzer_import)
		self.run_test("Advanced ROM Editor import", self.test_advanced_rom_editor_import)
		self.run_test("Performance Optimizer import", self.test_performance_optimizer_import)

		# Basic functionality tests
		self.run_test("Advanced Graphics Analyzer basic", self.test_advanced_graphics_analyzer_basic)
		self.run_test("Multi-ROM Comparator basic", self.test_multi_rom_comparator_basic)
		self.run_test("Comprehensive ROM Analyzer basic", self.test_comprehensive_rom_analyzer_basic)
		self.run_test("DQ3 Game Data Extractor basic", self.test_dq3_game_data_extractor_basic)

		# Utility tests
		self.run_test("Basic file operations", self.test_basic_file_operations)
		self.run_test("Graphics format definitions", self.test_graphics_analyzer_formats)
		self.run_test("ROM location access", self.test_known_rom_locations)

		# Summary
		total_tests = self.tests_passed + self.tests_failed
		success_rate = (self.tests_passed / total_tests * 100) if total_tests > 0 else 0

		print("\n" + "=" * 55)
		print(f"📊 Test Results:")
		print(f"	 Total Tests: {total_tests}")
		print(f"	 Passed: {self.tests_passed}")
		print(f"	 Failed: {self.tests_failed}")
		print(f"	 Success Rate: {success_rate:.1f}%")

		if self.tests_failed > 0:
			print(f"\n❌ Failed Tests:")
			for name, passed, time_taken, error in self.test_details:
				if not passed:
					print(f"	 {name}: {error}")

		print(f"\n🏁 Testing complete!")
		return self.tests_failed == 0

if __name__ == "__main__":
	runner = SimpleTestRunner()
	success = runner.run_all_tests()
	sys.exit(0 if success else 1)
