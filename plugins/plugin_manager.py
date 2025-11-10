"""
Plugin Manager for Dragon Quest III ROM Analysis
===============================================

This module provides high-level plugin management functionality
for the Dragon Quest III ROM analysis system.

Created: 2025-11-09 14:08:32
"""

import os
import json
import asyncio
try:
	import websockets
except ImportError:
	websockets = None
from typing import Dict, List, Optional, Any, Callable
from concurrent.futures import ThreadPoolExecutor, as_completed
from .plugin_registry import PluginRegistry
from .base_plugin import BasePlugin, PluginType, PluginStatus, create_plugin_template


class PluginManager:
	"""High-level plugin management system"""

	def __init__(self, plugin_directory: str = "plugins", max_workers: int = 4):
		"""
		Initialize plugin manager

		Args:
			plugin_directory: Directory containing plugins
			max_workers: Maximum number of worker threads
		"""
		self.plugin_directory = plugin_directory
		self.max_workers = max_workers
		self.registry = PluginRegistry(plugin_directory)
		self.executor = ThreadPoolExecutor(max_workers=max_workers)

		# WebSocket server for live updates
		self.websocket_server = None
		self.connected_clients = set()

		# Plugin execution history
		self.execution_history: List[Dict[str, Any]] = []

		# Plugin performance metrics
		self.performance_metrics: Dict[str, Dict[str, Any]] = {}

		print(f"PluginManager initialized with {len(self.registry.registered_plugins)} plugins")

	async def start_websocket_server(self, host: str = "localhost", port: int = 8765):
		"""Start WebSocket server for live updates"""
		if websockets is None:
			print("WebSockets not available - install with: pip install websockets")
			return

		async def handle_client(websocket, path):
			self.connected_clients.add(websocket)
			try:
				await websocket.wait_closed()
			finally:
				self.connected_clients.discard(websocket)

		self.websocket_server = await websockets.serve(handle_client, host, port)
		print(f"WebSocket server started on {host}:{port}")

	async def broadcast_update(self, message: Dict[str, Any]):
		"""Broadcast update to all connected WebSocket clients"""
		if websockets is not None and self.connected_clients:
			websockets.broadcast(self.connected_clients, json.dumps(message))

	def create_new_plugin(self, name: str, plugin_type: PluginType, description: str = "") -> str:
		"""
		Create a new plugin from template

		Args:
			name: Plugin name
			plugin_type: Plugin type
			description: Plugin description

		Returns:
			Path to created plugin directory
		"""
		plugin_dir = create_plugin_template(name, plugin_type, self.plugin_directory)

		# Update description if provided
		if description:
			metadata_path = os.path.join(plugin_dir, "metadata.json")
			with open(metadata_path, 'r', encoding='utf-8') as f:
				metadata = json.load(f)
			metadata['description'] = description
			with open(metadata_path, 'w', encoding='utf-8') as f:
				json.dump(metadata, f, indent=4, ensure_ascii=False)

		# Rediscover plugins to include new one
		self.registry.discover_plugins()

		print(f"Created new plugin: {name} at {plugin_dir}")
		return plugin_dir

	def install_plugin(self, plugin_path: str) -> bool:
		"""
		Install a plugin from external directory

		Args:
			plugin_path: Path to plugin directory or archive

		Returns:
			True if installation successful
		"""
		# TODO: Implement plugin installation from external sources
		# This would include:
		# - Extracting archives
		# - Validating plugin structure
		# - Copying to plugin directory
		# - Dependency resolution

		print(f"Plugin installation not yet implemented: {plugin_path}")
		return False

	def uninstall_plugin(self, plugin_name: str) -> bool:
		"""
		Uninstall a plugin completely

		Args:
			plugin_name: Name of plugin to uninstall

		Returns:
			True if uninstallation successful
		"""
		if plugin_name not in self.registry.registered_plugins:
			print(f"Plugin {plugin_name} not found")
			return False

		# Unload if loaded
		self.registry.unload_plugin(plugin_name)

		# Remove plugin directory
		plugin_info = self.registry.registered_plugins[plugin_name]
		plugin_path = plugin_info['path']

		try:
			import shutil
			shutil.rmtree(plugin_path)

			# Remove from registry
			del self.registry.registered_plugins[plugin_name]
			if plugin_name in self.registry.plugin_metadata:
				del self.registry.plugin_metadata[plugin_name]

			print(f"Uninstalled plugin: {plugin_name}")
			return True

		except Exception as e:
			print(f"Failed to uninstall plugin {plugin_name}: {e}")
			return False

	def run_plugin_pipeline(self, rom_path: str, output_dir: str,
							 plugin_names: Optional[List[str]] = None,
							 parallel: bool = False) -> Dict[str, Any]:
		"""
		Run multiple plugins in sequence or parallel

		Args:
			rom_path: Path to ROM file
			output_dir: Output directory
			plugin_names: List of plugins to run (all if None)
			parallel: Whether to run plugins in parallel

		Returns:
			Combined results from all plugins
		"""
		if plugin_names is None:
			plugin_names = list(self.registry.loaded_plugins.keys())

		if not plugin_names:
			return {"error": "No plugins to run"}

		# Create output directory
		os.makedirs(output_dir, exist_ok=True)

		results = {
			"rom_path": rom_path,
			"output_dir": output_dir,
			"plugins_run": [],
			"plugin_results": {},
			"errors": [],
			"total_execution_time": 0
		}

		import time
		start_time = time.time()

		if parallel:
			# Run plugins in parallel
			futures = {}
			for plugin_name in plugin_names:
				if plugin_name in self.registry.loaded_plugins:
					future = self.executor.submit(
						self._run_plugin_with_metrics,
						plugin_name, rom_path, output_dir
					)
					futures[future] = plugin_name

			for future in as_completed(futures):
				plugin_name = futures[future]
				try:
					plugin_result = future.result()
					results["plugin_results"][plugin_name] = plugin_result
					results["plugins_run"].append(plugin_name)
				except Exception as e:
					error_msg = f"Plugin {plugin_name} failed: {e}"
					results["errors"].append(error_msg)
					print(error_msg)

		else:
			# Run plugins sequentially
			for plugin_name in plugin_names:
				if plugin_name not in self.registry.loaded_plugins:
					error_msg = f"Plugin {plugin_name} not loaded"
					results["errors"].append(error_msg)
					continue

				try:
					plugin_result = self._run_plugin_with_metrics(
						plugin_name, rom_path, output_dir
					)
					results["plugin_results"][plugin_name] = plugin_result
					results["plugins_run"].append(plugin_name)
				except Exception as e:
					error_msg = f"Plugin {plugin_name} failed: {e}"
					results["errors"].append(error_msg)
					print(error_msg)

		results["total_execution_time"] = time.time() - start_time

		# Save combined results
		results_path = os.path.join(output_dir, "pipeline_results.json")
		with open(results_path, 'w', encoding='utf-8') as f:
			json.dump(results, f, indent=4, ensure_ascii=False)

		# Add to execution history
		self.execution_history.append({
			"timestamp": time.time(),
			"rom_path": rom_path,
			"plugins": plugin_names,
			"success_count": len(results["plugins_run"]),
			"error_count": len(results["errors"]),
			"execution_time": results["total_execution_time"]
		})

		# Broadcast update if WebSocket server running
		if self.connected_clients:
			asyncio.create_task(self.broadcast_update({
				"type": "pipeline_complete",
				"results": results
			}))

		return results

	def _run_plugin_with_metrics(self, plugin_name: str, rom_path: str, output_dir: str) -> Dict[str, Any]:
		"""Run plugin and collect performance metrics"""
		import time
		import tracemalloc

		# Start memory and time tracking
		tracemalloc.start()
		start_time = time.time()
		start_memory = tracemalloc.get_traced_memory()[0]

		try:
			result = self.registry.run_plugin(plugin_name, rom_path, output_dir)

			# Collect metrics
			end_time = time.time()
			current_memory, peak_memory = tracemalloc.get_traced_memory()
			tracemalloc.stop()

			execution_time = end_time - start_time
			memory_used = peak_memory - start_memory

			# Store metrics
			if plugin_name not in self.performance_metrics:
				self.performance_metrics[plugin_name] = {
					"total_runs": 0,
					"total_time": 0,
					"average_time": 0,
					"max_time": 0,
					"min_time": float('inf'),
					"total_memory": 0,
					"average_memory": 0,
					"max_memory": 0
				}

			metrics = self.performance_metrics[plugin_name]
			metrics["total_runs"] += 1
			metrics["total_time"] += execution_time
			metrics["average_time"] = metrics["total_time"] / metrics["total_runs"]
			metrics["max_time"] = max(metrics["max_time"], execution_time)
			metrics["min_time"] = min(metrics["min_time"], execution_time)
			metrics["total_memory"] += memory_used
			metrics["average_memory"] = metrics["total_memory"] / metrics["total_runs"]
			metrics["max_memory"] = max(metrics["max_memory"], memory_used)

			# Add metrics to result
			if result:
				result["_performance_metrics"] = {
					"execution_time": execution_time,
					"memory_used": memory_used
				}
			else:
				result = {"error": "Plugin returned None", "_performance_metrics": {
					"execution_time": execution_time,
					"memory_used": memory_used
				}}

			return result

		except Exception as e:
			tracemalloc.stop()
			raise e

	def auto_initialize_plugins(self, config_file: str = "plugin_config.json") -> int:
		"""
		Auto-initialize all loaded plugins with configuration

		Args:
			config_file: Path to plugin configuration file

		Returns:
			Number of successfully initialized plugins
		"""
		config = {}
		if os.path.exists(config_file):
			with open(config_file, 'r', encoding='utf-8') as f:
				config = json.load(f)

		initialized_count = 0

		for plugin_name in self.registry.loaded_plugins.keys():
			plugin_config = config.get(plugin_name, {})

			if self.registry.initialize_plugin(plugin_name, plugin_config):
				initialized_count += 1
				print(f"Initialized plugin: {plugin_name}")
			else:
				print(f"Failed to initialize plugin: {plugin_name}")

		return initialized_count

	def get_system_status(self) -> Dict[str, Any]:
		"""Get comprehensive system status"""
		status = {
			"plugin_directory": self.plugin_directory,
			"registry_status": str(self.registry),
			"total_plugins": len(self.registry.registered_plugins),
			"loaded_plugins": len(self.registry.loaded_plugins),
			"enabled_plugins": 0,
			"error_plugins": 0,
			"websocket_server": self.websocket_server is not None,
			"connected_clients": len(self.connected_clients),
			"execution_history_count": len(self.execution_history),
			"performance_metrics_available": len(self.performance_metrics),
			"plugins_by_type": {},
			"plugin_statuses": {}
		}

		# Count plugins by type and status
		for plugin_type in PluginType:
			status["plugins_by_type"][plugin_type.value] = len(
				self.registry.get_plugins_by_type(plugin_type)
			)

		# Get individual plugin statuses
		for plugin_name in self.registry.loaded_plugins.keys():
			plugin = self.registry.loaded_plugins[plugin_name]
			plugin_status = plugin.status.value
			status["plugin_statuses"][plugin_name] = plugin_status

			if plugin_status == "enabled":
				status["enabled_plugins"] += 1
			elif plugin_status == "error":
				status["error_plugins"] += 1

		return status

	def generate_performance_report(self) -> Dict[str, Any]:
		"""Generate performance report for all plugins"""
		return {
			"metrics": self.performance_metrics,
			"execution_history": self.execution_history[-10:],	# Last 10 executions
			"total_executions": len(self.execution_history)
		}

	def export_system_state(self, filepath: str):
		"""Export complete system state to file"""
		state = {
			"system_status": self.get_system_status(),
			"plugin_registry": self.registry.create_plugin_report(),
			"performance_metrics": self.performance_metrics,
			"execution_history": self.execution_history
		}

		with open(filepath, 'w', encoding='utf-8') as f:
			json.dump(state, f, indent=4, ensure_ascii=False)

		print(f"System state exported to: {filepath}")

	def create_plugin_config_template(self, filepath: str):
		"""Create a template configuration file for all plugins"""
		config = {}

		for plugin_name, plugin_info in self.registry.registered_plugins.items():
			metadata = plugin_info['metadata']
			config[plugin_name] = {
				"enabled": True,
				"config": metadata.config_schema.get('properties', {}),
				"description": metadata.description
			}

		with open(filepath, 'w', encoding='utf-8') as f:
			json.dump(config, f, indent=4, ensure_ascii=False)

		print(f"Plugin configuration template created: {filepath}")

	def shutdown(self):
		"""Shutdown plugin manager and cleanup resources"""
		# Unload all plugins
		for plugin_name in list(self.registry.loaded_plugins.keys()):
			self.registry.unload_plugin(plugin_name)

		# Shutdown executor
		self.executor.shutdown(wait=True)

		# Close WebSocket server
		if self.websocket_server:
			self.websocket_server.close()

		print("PluginManager shutdown complete")

	def __enter__(self):
		return self

	def __exit__(self, exc_type, exc_val, exc_tb):
		self.shutdown()


# Convenience functions for common operations
def quick_analysis(rom_path: str, output_dir: str = "output",
					plugin_types: Optional[List[PluginType]] = None) -> Dict[str, Any]:
	"""
	Quick ROM analysis using available plugins

	Args:
		rom_path: Path to ROM file
		output_dir: Output directory
		plugin_types: Types of plugins to use (all if None)

	Returns:
		Analysis results
	"""
	with PluginManager() as manager:
		# Load all plugins
		manager.registry.load_all_plugins()

		# Initialize plugins
		manager.auto_initialize_plugins()

		# Filter by plugin types if specified
		plugin_names = None
		if plugin_types:
			plugin_names = []
			for ptype in plugin_types:
				plugin_names.extend(manager.registry.get_plugins_by_type(ptype))

		# Run analysis
		return manager.run_plugin_pipeline(rom_path, output_dir, plugin_names)


def create_example_plugins():
	"""Create example plugins for demonstration"""
	manager = PluginManager()

	# Create some example plugins
	examples = [
		("Text Extractor", PluginType.EXTRACTOR, "Extracts text strings from ROM"),
		("Graphics Analyzer", PluginType.ANALYZER, "Analyzes graphics data structures"),
		("Audio Extractor", PluginType.EXTRACTOR, "Extracts audio samples and music"),
		("Map Analyzer", PluginType.ANALYZER, "Analyzes game map data"),
		("ROM Patcher", PluginType.EDITOR, "Applies patches to ROM files"),
		("Sprite Viewer", PluginType.VISUALIZER, "Visualizes sprite data"),
	]

	created_plugins = []
	for name, ptype, description in examples:
		plugin_dir = manager.create_new_plugin(name, ptype, description)
		created_plugins.append(plugin_dir)
		print(f"Created example plugin: {name}")

	return created_plugins
