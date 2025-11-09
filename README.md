# Dragon Quest III Remake (DQ3R) - SNES Disassembly Project

![Dragon Quest III Logo](docs/images/dq3_logo.png)

> **Complete disassembly, documentation, asset extraction, and editor suite for Dragon Quest III (SNES)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: SNES](https://img.shields.io/badge/Platform-SNES-blue.svg)](https://en.wikipedia.org/wiki/Super_Nintendo_Entertainment_System)
[![Status: Active Development](https://img.shields.io/badge/Status-Active%20Development-green.svg)](#project-status)

---

# # 🎮 About Dragon Quest III

**Dragon Quest III: Soshite Densetsu he...** (そして伝説へ..., "And Into the Legend...") is a classic JRPG originally released for the Nintendo Famicom in 1988, later ported to the Super Nintendo Entertainment System (SNES) in 1996. This project focuses on the **Japanese SNES version** for complete disassembly and documentation.

# ## Key Features
- **Classic JRPG Mechanics** - Turn-based combat, character classes, party management
- **Epic Quest** - Save the world from the Archfiend Baramos
- **Character Customization** - Multiple character classes and party configurations
- **Rich Storyline** - Prequel to the original Dragon Quest

---

# # 📁 Project Structure

```
dq3r-info/
├── src/                    # Source code (disassembled)
│   ├── asm/               # Assembly files (65816 SNES)
│   ├── include/           # Header files and constants
│   ├── data/              # Game data tables
│   └── graphics/          # Binary graphics data
│
├── assets/                # Extracted game assets
│   ├── graphics/          # PNG graphics files
│   ├── data/              # JSON data files
│   ├── text/              # Text strings and dialog
│   └── music/             # Music and sound data
│
├── tools/                 # Development and analysis tools
│   ├── README.md          # Tools documentation
│   ├── extractors/        # Asset extraction tools
│   ├── editors/           # Game data editors
│   ├── build/             # Build system tools
│   ├── analysis/          # Analysis and debugging tools
│   └── formatting/        # Code formatting tools
│
├── build/                 # Build output directory
│   └── dq3r-rebuilt.sfc  # Rebuilt ROM file
│
├── docs/                  # Project documentation
│   ├── INDEX.md           # Documentation index
│   ├── guides/            # User guides and tutorials
│   ├── technical/         # Technical documentation
│   ├── reference/         # Reference materials
│   └── original_files/    # Original game analysis files
│
├── tests/                 # Test suite
│   ├── test_build.py      # Build system tests
│   ├── test_data.py       # Data integrity tests
│   └── test_graphics.py   # Graphics extraction tests
│
├── static/                # ROM files and saves (gitignored)
│   ├── *.smc              # ROM files
│   ├── *.srm              # Save files
│   └── *.diz              # Diztinguish project files
│
├── .editorconfig          # Code formatting rules
├── .gitignore             # Git ignore patterns
├── setup.ps1              # Development environment setup
├── build.ps1              # Build script
└── requirements.txt       # Python dependencies
```

---

# # 🚀 Quick Start

# ## Prerequisites

**Required Tools:**
- **Python 3.8+** - For extraction and analysis tools
- **Asar** - SNES assembler for building ROMs
- **Git** - Version control
- **PowerShell 7+** - For build scripts (Windows)

**Optional Tools:**
- **VS Code** - Recommended editor with EditorConfig support
- **MesenS** - SNES emulator for testing
- **YY-CHR** - Graphics editor for SNES tiles

# ## Initial Setup

```powershell

# 1. Clone the repository
git clone https://github.com/[YOUR_USERNAME]/dq3r-info.git
cd dq3r-info

# 2. Run setup script
.\setup.ps1

# 3. Place ROM files in static/ directory

# - Dragon Quest III - Soshite Densetsu he... (J).smc (required)

# - Any save files or patches (optional)

# 4. Verify setup
.\build.ps1 --check
```

---

# # 🛠️ Available Tools

# ## Asset Extraction
```powershell

# Extract graphics
python tools/extract_graphics.py --output assets/graphics/

# Extract text and dialog
python tools/extract_text.py --output assets/text/

# Extract music data
python tools/extract_music.py --output assets/music/
```

# ## Data Editing
```powershell

# Character stats editor
python tools/editors/character_editor.py

# Enemy data editor
python tools/editors/enemy_editor.py

# Item database editor
python tools/editors/item_editor.py
```

# ## Build and Test
```powershell

# Build ROM from source
.\build.ps1

# Run test suite
python -m pytest tests/

# Launch in emulator
.\tools\launch_emulator.ps1 build/dq3r-rebuilt.sfc
```

---

# # 📊 Project Status

# ## Completion Overview
- **🔍 ROM Analysis**: Starting
- **📝 Disassembly**: 0% complete
- **📖 Documentation**: In progress
- **🎨 Graphics Extraction**: Not started
- **💬 Text Extraction**: Not started
- **🎵 Music Extraction**: Not started
- **🧪 Testing**: Framework in place

# ## Current Focus
1. **Initial ROM analysis** using Diztinguish
2. **Setting up build pipeline** and tools
3. **Creating extraction workflows**
4. **Establishing documentation standards**

---

# # 🤝 Contributing

We welcome contributions from the Dragon Quest and ROM hacking communities!

# ## How to Help

**For Modders:**
- Test tools and report bugs
- Suggest feature improvements
- Create content guides and tutorials
- Share knowledge about DQ3 mechanics

**For Developers:**
- Improve extraction algorithms
- Add new editor features
- Enhance build system
- Write comprehensive tests

**For Researchers:**
- Analyze game mechanics
- Document undiscovered features
- Reverse engineer algorithms
- Create technical documentation

# ## Contribution Guidelines
1. Read our [Code Standards](docs/reference/coding-standards.md)
2. Follow the [EditorConfig](.editorconfig) formatting rules
3. Write tests for new features
4. Document your changes clearly
5. Submit pull requests for review

---

# # 📖 Documentation

**Quick Links:**
- **[Getting Started Guide](docs/guides/getting-started.md)** - New contributor walkthrough
- **[Build Instructions](docs/guides/build-instructions.md)** - How to build the ROM
- **[Tools Reference](tools/README.md)** - Complete tools documentation
- **[Technical Overview](docs/technical/overview.md)** - Project architecture
- **[Game Mechanics](docs/reference/game-mechanics.md)** - DQ3 system documentation

**Browse All Documentation:** [docs/INDEX.md](docs/INDEX.md)

---

# # 🎯 Project Goals

# ## Short Term (3 months)
- [ ] Complete ROM analysis with Diztinguish
- [ ] Extract and document graphics format
- [ ] Set up automated build pipeline
- [ ] Create basic character/enemy editors

# ## Medium Term (6 months)
- [ ] Disassemble core game engine (50%)
- [ ] Document battle system mechanics
- [ ] Extract all text and create translation tools
- [ ] Build comprehensive test suite

# ## Long Term (1+ years)
- [ ] Complete disassembly with full documentation
- [ ] Advanced ROM editor suite
- [ ] Translation patch creation tools
- [ ] Community modding resources

---

# # 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Important Notes:**
- This project is for educational and research purposes
- Original ROM files are **not included** and must be provided by the user
- We do not distribute copyrighted game content
- All analysis and documentation respects fair use guidelines

---

# # 🙏 Acknowledgments

- **Enix/Square Enix** - Original Dragon Quest III creators
- **Nintendo** - SNES hardware platform
- **ROM Hacking Community** - Tools and inspiration
- **FFMQ-Info Project** - Project structure template
- **Diztinguish** - SNES disassembly tool
- **Asar** - SNES assembler

---

# # 📞 Contact

- **Issues**: Report bugs via [GitHub Issues](https://github.com/[YOUR_USERNAME]/dq3r-info/issues)
- **Discussions**: Join our community discussions
- **Documentation**: Browse the [docs/](docs/) directory

**Happy ROM hacking! 🎮✨**
