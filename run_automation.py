#!/usr/bin/env python3
"""
Simple Build System Runner
Runs all development automation without complex imports
"""

import subprocess
import sys
import time
from pathlib import Path


def run_command(cmd: list, description: str) -> bool:
	"""Run a command and return success status"""
	print(f"🔄 {description}...")
	try:
		result = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
		if result.returncode == 0:
			print(f"✅ {description} - Success")
			if result.stdout.strip():
				print(result.stdout[:500])	# Show first 500 chars
			return True
		else:
			print(f"❌ {description} - Failed")
			if result.stderr.strip():
				print(f"Error: {result.stderr[:300]}")
			return False
	except subprocess.TimeoutExpired:
		print(f"⏰ {description} - Timed out")
		return False
	except Exception as e:
		print(f"💥 {description} - Error: {e}")
		return False


def main():
	"""Run comprehensive development automation"""
	start_time = time.time()
	project_root = Path(__file__).parent

	print("🚀 Starting DQ3R Comprehensive Development Automation")
	print("=" * 60)

	results = []

	# 1. Update session logs
	cmd = [sys.executable, "tools/session/session_logger.py", "--update"]
	success = run_command(cmd, "Session logging update")
	results.append(("Session Logs", success))

	# 2. Run automated formatting
	cmd = [sys.executable, "tools/formatting/auto_formatter.py"]
	success = run_command(cmd, "Automated code formatting")
	results.append(("Code Formatting", success))

	# 3. Setup SNES toolchain
	cmd = [sys.executable, "tools/snes_toolchain.py", "--setup"]
	success = run_command(cmd, "SNES toolchain setup")
	results.append(("SNES Toolchain", success))

	# 4. Test compression algorithms
	cmd = [sys.executable, "tools/compression/compression_engine.py"]
	success = run_command(cmd, "Compression algorithm testing")
	results.append(("Compression Tests", success))

	# 5. Analyze ROM structure if ROM files exist
	rom_files = list(project_root.rglob("*.smc"))
	if rom_files:
		cmd = [sys.executable, "tools/snes_toolchain.py", "--analyze"]
		success = run_command(cmd, f"ROM analysis ({len(rom_files)} files found)")
		results.append(("ROM Analysis", success))
	else:
		print("ℹ️	No ROM files found - skipping ROM analysis")
		results.append(("ROM Analysis", "Skipped"))

	# 6. Run additional tooling
	cmd = [sys.executable, "tools/analysis/analyze_rom.py", "--help"]
	success = run_command(cmd, "ROM analyzer tool validation")
	results.append(("ROM Analyzer", success))

	# Summary
	elapsed = time.time() - start_time
	print("\n" + "=" * 60)
	print("📊 AUTOMATION SUMMARY")
	print("=" * 60)

	total_tasks = len([r for r in results if r[1] != "Skipped"])
	successful_tasks = len([r for r in results if r[1] is True])

	for task, status in results:
		if status is True:
			icon = "✅"
		elif status == "Skipped":
			icon = "⏭️"
		else:
			icon = "❌"
		print(f"{icon} {task}")

	print(f"\n⏱️	Total execution time: {elapsed:.2f} seconds")
	print(f"📈 Success rate: {successful_tasks}/{total_tasks} tasks completed")

	if successful_tasks == total_tasks:
		print("🎉 All automation tasks completed successfully!")
		return 0
	else:
		print("⚠️	Some automation tasks failed - check logs above")
		return 1


if __name__ == "__main__":
	try:
		exit_code = main()
		sys.exit(exit_code)
	except KeyboardInterrupt:
		print("\n🛑 Automation interrupted by user")
		sys.exit(130)
	except Exception as e:
		print(f"💥 Automation system error: {e}")
		sys.exit(1)
