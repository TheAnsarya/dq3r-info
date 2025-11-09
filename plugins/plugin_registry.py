"""
Plugin Registry for Dragon Quest III ROM Analysis
================================================

This module manages the registration and discovery of plugins
in the Dragon Quest III ROM analysis system.

Created: 2025-11-09 14:08:30
"""

import os
import json
import importlib.util
from typing import Dict, List, Optional, Type, Any, Tuple
from .base_plugin import BasePlugin, PluginMetadata, PluginType, PluginStatus


class PluginRegistry:
	"""Central registry for managing ROM analysis plugins"""

	def __init__(self, plugin_directory: str = "plugins"):
		"""
		Initialize plugin registry

		Args:
			plugin_directory: Directory containing plugins
		"""
		self.plugin_directory = plugin_directory
		self.registered_plugins: Dict[str, Dict[str, Any]] = {}
		self.loaded_plugins: Dict[str, BasePlugin] = {}
		self.plugin_metadata: Dict[str, PluginMetadata] = {}

		# Create plugin directory if it doesn't exist
		os.makedirs(plugin_directory, exist_ok=True)

		# Discover and register plugins
		self.discover_plugins()

	def discover_plugins(self):
		"""Discover all available plugins in the plugin directory"""
		self.registered_plugins.clear()
		self.plugin_metadata.clear()

		if not os.path.exists(self.plugin_directory):
			return

		for item in os.listdir(self.plugin_directory):
			plugin_path = os.path.join(self.plugin_directory, item)

			# Skip files, only check directories
			if not os.path.isdir(plugin_path):
				continue

			# Look for metadata.json
			metadata_path = os.path.join(plugin_path, "metadata.json")
			if not os.path.exists(metadata_path):
				print(f"Plugin {item} missing metadata.json, skipping")
				continue

			try:
				metadata = PluginMetadata.from_json_file(metadata_path)
				self.plugin_metadata[metadata.name] = metadata

				# Check for plugin entry point
				entry_point = os.path.join(plugin_path, metadata.entry_point)
				if not os.path.exists(entry_point):
					print(f"Plugin {metadata.name} missing entry point {metadata.entry_point}")
					continue

				self.registered_plugins[metadata.name] = {
					'metadata': metadata,
					'path': plugin_path,
					'entry_point': entry_point,
					'loaded': False,
					'instance': None
				}

				print(f"Discovered plugin: {metadata.name} v{metadata.version}")

			except Exception as e:
				print(f"Failed to load metadata for plugin {item}: {e}")

	def load_plugin(self, plugin_name: str) -> Optional[BasePlugin]:
		"""
		Load a specific plugin

		Args:
			plugin_name: Name of plugin to load

		Returns:
			BasePlugin instance or None if loading failed
		"""
		if plugin_name not in self.registered_plugins:
			print(f"Plugin {plugin_name} not registered")
			return None

		if self.registered_plugins[plugin_name]['loaded']:
			return self.loaded_plugins.get(plugin_name)

		try:
			plugin_info = self.registered_plugins[plugin_name]
			metadata = plugin_info['metadata']
			entry_point = plugin_info['entry_point']

			# Load the plugin module
			spec = importlib.util.spec_from_file_location(
				f"plugin_{plugin_name.replace(' ', '_')}",
				entry_point
			)

			if spec is None or spec.loader is None:
				raise ImportError(f"Could not load plugin module from {entry_point}")

			plugin_module = importlib.util.module_from_spec(spec)
			spec.loader.exec_module(plugin_module)

			# Create plugin instance
			if hasattr(plugin_module, 'create_plugin'):
				plugin_instance = plugin_module.create_plugin(metadata)
			else:
				raise AttributeError("Plugin module missing create_plugin function")

			if not isinstance(plugin_instance, BasePlugin):
				raise TypeError("create_plugin must return BasePlugin instance")

			# Mark as loaded
			self.loaded_plugins[plugin_name] = plugin_instance
			self.registered_plugins[plugin_name]['loaded'] = True
			self.registered_plugins[plugin_name]['instance'] = plugin_instance

			print(f"Loaded plugin: {plugin_name}")
			return plugin_instance

		except Exception as e:
			print(f"Failed to load plugin {plugin_name}: {e}")
			return None

	def unload_plugin(self, plugin_name: str):
		"""
		Unload a specific plugin

		Args:
			plugin_name: Name of plugin to unload
		"""
		if plugin_name in self.loaded_plugins:
			del self.loaded_plugins[plugin_name]

		if plugin_name in self.registered_plugins:
			self.registered_plugins[plugin_name]['loaded'] = False
			self.registered_plugins[plugin_name]['instance'] = None

		print(f"Unloaded plugin: {plugin_name}")

	def load_all_plugins(self) -> List[str]:
		"""
		Load all discovered plugins

		Returns:
			List of successfully loaded plugin names
		"""
		loaded = []
		for plugin_name in self.registered_plugins.keys():
			if self.load_plugin(plugin_name):
				loaded.append(plugin_name)
		return loaded

	def get_plugins_by_type(self, plugin_type: PluginType) -> List[str]:
		"""
		Get plugins of specific type

		Args:
			plugin_type: Type of plugins to find

		Returns:
			List of plugin names matching the type
		"""
		return [
			name for name, info in self.registered_plugins.items()
			if info['metadata'].plugin_type == plugin_type
		]

	def get_plugin_info(self, plugin_name: str) -> Optional[Dict[str, Any]]:
		"""
		Get information about a specific plugin

		Args:
			plugin_name: Name of plugin

		Returns:
			Dictionary with plugin information or None
		"""
		if plugin_name not in self.registered_plugins:
			return None

		info = self.registered_plugins[plugin_name].copy()

		# Add runtime status if loaded
		if info['loaded'] and plugin_name in self.loaded_plugins:
			instance = self.loaded_plugins[plugin_name]
			info['status'] = instance.get_status_info()

		return info

	def get_all_plugin_info(self) -> Dict[str, Dict[str, Any]]:
		"""
		Get information about all registered plugins

		Returns:
			Dictionary mapping plugin names to their info
		"""
		return {name: self.get_plugin_info(name) for name in self.registered_plugins.keys()}

	def initialize_plugin(self, plugin_name: str, config: Optional[Dict[str, Any]] = None) -> bool:
		"""
		Initialize a loaded plugin with configuration

		Args:
			plugin_name: Name of plugin to initialize
			config: Plugin configuration dictionary

		Returns:
			True if initialization successful
		"""
		if plugin_name not in self.loaded_plugins:
			print(f"Plugin {plugin_name} not loaded")
			return False

		if config is None:
			config = {}

		plugin = self.loaded_plugins[plugin_name]

		try:
			# Validate configuration first
			is_valid, errors = plugin.validate_configuration(config)
			if not is_valid:
				print(f"Plugin {plugin_name} configuration validation failed:")
				for error in errors:
					print(f"  - {error}")
				return False

			# Initialize plugin
			return plugin.initialize(config)

		except Exception as e:
			print(f"Failed to initialize plugin {plugin_name}: {e}")
			return False

	def run_plugin(self, plugin_name: str, rom_path: str, output_dir: str) -> Optional[Dict[str, Any]]:
		"""
		Run a plugin on a ROM file

		Args:
			plugin_name: Name of plugin to run
			rom_path: Path to ROM file
			output_dir: Output directory for results

		Returns:
			Plugin execution results or None if failed
		"""
		if plugin_name not in self.loaded_plugins:
			print(f"Plugin {plugin_name} not loaded")
			return None

		plugin = self.loaded_plugins[plugin_name]

		if plugin.status != PluginStatus.ENABLED:
			print(f"Plugin {plugin_name} not enabled (status: {plugin.status.value})")
			return None

		try:
			return plugin.process_rom(rom_path, output_dir)
		except Exception as e:
			print(f"Plugin {plugin_name} execution failed: {e}")
			plugin.set_status(PluginStatus.ERROR, str(e))
			return None

	def validate_dependencies(self, plugin_name: str) -> Tuple[bool, List[str]]:
		"""
		Validate plugin dependencies

		Args:
			plugin_name: Name of plugin to check

		Returns:
			Tuple of (dependencies_satisfied, missing_dependencies)
		"""
		if plugin_name not in self.plugin_metadata:
			return False, [f"Plugin {plugin_name} not found"]

		metadata = self.plugin_metadata[plugin_name]
		missing = []

		for dep in metadata.dependencies:
			if dep.name not in self.registered_plugins:
				if not dep.optional:
					missing.append(f"Required dependency {dep.name} not available")
				else:
					print(f"Optional dependency {dep.name} not available")

		return len(missing) == 0, missing

	def create_plugin_report(self) -> Dict[str, Any]:
		"""
		Create comprehensive plugin system report

		Returns:
			Dictionary containing system report
		"""
		report = {
			'plugin_directory': self.plugin_directory,
			'total_plugins': len(self.registered_plugins),
			'loaded_plugins': len(self.loaded_plugins),
			'plugins_by_type': {},
			'plugins': {}
		}

		# Count plugins by type
		for plugin_type in PluginType:
			count = len(self.get_plugins_by_type(plugin_type))
			report['plugins_by_type'][plugin_type.value] = count

		# Add individual plugin info
		for name in self.registered_plugins.keys():
			plugin_info = self.get_plugin_info(name)
			if plugin_info:
				report['plugins'][name] = {
					'version': plugin_info['metadata'].version,
					'type': plugin_info['metadata'].plugin_type.value,
					'loaded': plugin_info['loaded'],
					'description': plugin_info['metadata'].description
				}

				if plugin_info['loaded'] and 'status' in plugin_info:
					report['plugins'][name]['status'] = plugin_info['status']

		return report

	def save_registry_state(self, filepath: str):
		"""Save registry state to file"""
		state = {
			'plugin_directory': self.plugin_directory,
			'registered_plugins': list(self.registered_plugins.keys()),
			'loaded_plugins': list(self.loaded_plugins.keys())
		}

		with open(filepath, 'w', encoding='utf-8') as f:
			json.dump(state, f, indent=4, ensure_ascii=False)

	def __str__(self) -> str:
		return f"PluginRegistry({len(self.registered_plugins)} registered, {len(self.loaded_plugins)} loaded)"

	def __repr__(self) -> str:
		return f"PluginRegistry(directory='{self.plugin_directory}', plugins={len(self.registered_plugins)})"
