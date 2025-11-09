"""
Plugin Architecture for Dragon Quest III ROM Analysis
===================================================

This module provides an extensible plugin system for ROM analysis tools.

Features:
- Dynamic plugin discovery and loading
- Plugin registration system
- Plugin dependency management
- Plugin configuration management
- Plugin API standardization
- Plugin validation and security checks

Created: 2025-11-09 14:08:27
"""

__version__ = "1.0.0"
__author__ = "DQ3R Analysis Team"

from .plugin_manager import PluginManager
from .base_plugin import BasePlugin, PluginMetadata
from .plugin_registry import PluginRegistry

__all__ = ['PluginManager', 'BasePlugin', 'PluginMetadata', 'PluginRegistry']
