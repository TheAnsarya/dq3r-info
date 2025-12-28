# Dragon Quest III Reverse Engineering Project
# Professional SNES assembly build system

# Tools
AS = ca65
LD = ld65
PYTHON = python3

# Directories
SRC_DIR = src
BUILD_DIR = build
ASSETS_DIR = assets
TOOLS_DIR = tools

# Target ROM
TARGET = build/dragonquest3.smc
ORIGINAL_ROM = static/Dragon Quest III - Soshite Densetsu he... (J).smc

# Assembly source files
BOOT_SRC = $(SRC_DIR)/boot/boot.asm
ENGINE_SRC = $(SRC_DIR)/engine/engine.asm
BATTLE_SRC = $(SRC_DIR)/battle/battle.asm

# Object files
BOOT_OBJ = $(BUILD_DIR)/boot.o
ENGINE_OBJ = $(BUILD_DIR)/engine.o
BATTLE_OBJ = $(BUILD_DIR)/battle.o

# Linker configuration
LINKER_CONFIG = src/dragonquest3.cfg

# Assembly flags for SNES/65816
ASFLAGS = --cpu 65816 -t none -I $(SRC_DIR)/include

# Linker flags
LDFLAGS = -C $(LINKER_CONFIG)

# Build targets
.PHONY: all clean verify analyze extract

all: $(TARGET)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Assemble boot code
$(BOOT_OBJ): $(BOOT_SRC) | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

# Assemble engine code
$(ENGINE_OBJ): $(ENGINE_SRC) | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

# Assemble battle code
$(BATTLE_OBJ): $(BATTLE_SRC) | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

# Link final ROM
$(TARGET): $(BOOT_OBJ) $(ENGINE_OBJ) $(BATTLE_OBJ) $(LINKER_CONFIG) | $(BUILD_DIR)
	$(LD) $(LDFLAGS) -o $@ $(BOOT_OBJ) $(ENGINE_OBJ) $(BATTLE_OBJ)

# Verify ROM matches original
verify: $(TARGET)
	@echo "Verifying ROM integrity..."
	@if cmp -s $(TARGET) $(ORIGINAL_ROM); then \
		echo "✓ ROM verification PASSED - identical to original"; \
	else \
		echo "✗ ROM verification FAILED - differences detected"; \
		echo "Building file comparison..."; \
		$(PYTHON) tools/rom_compare.py $(ORIGINAL_ROM) $(TARGET); \
	fi

# Extract assets from original ROM
extract:
	@echo "Extracting assets from ROM..."
	$(PYTHON) tools/extract_graphics.py $(ORIGINAL_ROM) $(ASSETS_DIR)/graphics
	$(PYTHON) tools/extract_audio.py $(ORIGINAL_ROM) $(ASSETS_DIR)/audio
	$(PYTHON) tools/extract_text.py $(ORIGINAL_ROM) $(ASSETS_DIR)/text

# Analyze ROM structure
analyze:
	@echo "Analyzing ROM structure..."
	$(PYTHON) dq3_rom_analyzer_v2.py

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)
	rm -f $(TARGET)

# Development targets
.PHONY: boot engine battle

# Build just the boot system
boot: $(BOOT_OBJ)

# Build just the engine
engine: $(ENGINE_OBJ)

# Build just the battle system
battle: $(BATTLE_OBJ)

# Help target
help:
	@echo "Dragon Quest III Build System"
	@echo "Available targets:"
	@echo "  all      - Build complete ROM"
	@echo "  verify   - Verify ROM matches original"
	@echo "  extract  - Extract assets from ROM"
	@echo "  analyze  - Analyze ROM structure"
	@echo "  clean    - Remove build artifacts"
	@echo "  boot     - Build boot system only"
	@echo "  engine   - Build engine only"
	@echo "  battle   - Build battle system only"
