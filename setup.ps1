# Dragon Quest III Remake - Development Environment Setup
# PowerShell script for Windows development setup
# Based on FFMQ-Info project setup procedures

[CmdletBinding()]
param(
	[switch]$SkipROM,
	[switch]$SkipTools,
	[switch]$VerboseOutput
)

# Configuration
$ErrorActionPreference = 'Stop'
$ProjectRoot = $PSScriptRoot

# Project information
Write-Host "Dragon Quest III Remake (DQ3R) - Development Setup" -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Project: DQ3R SNES Disassembly" -ForegroundColor Green
Write-Host "Target: Dragon Quest III - Soshite Densetsu he... (J).smc" -ForegroundColor Green
Write-Host "Platform: Super Nintendo Entertainment System (SNES)" -ForegroundColor Green
Write-Host ""

# Helper functions
function Write-Success {
	param([string]$Message)
	Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Info {
	param([string]$Message)
	Write-Host "ℹ️  $Message" -ForegroundColor Cyan
}

function Write-Warning {
	param([string]$Message)
	Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

function Write-Error {
	param([string]$Message)
	Write-Host "❌ $Message" -ForegroundColor Red
}

function Write-Section {
	param([string]$Title)
	Write-Host ""
	Write-Host "═══ $Title ═══" -ForegroundColor Magenta
	Write-Host ""
}

# Check PowerShell version
Write-Section "Checking PowerShell Version"
if ($PSVersionTable.PSVersion.Major -lt 7) {
	Write-Warning "PowerShell 7+ recommended for best compatibility"
	Write-Host "Current version: $($PSVersionTable.PSVersion)" -ForegroundColor Yellow
	Write-Host "Download PowerShell 7: https://github.com/PowerShell/PowerShell/releases"
} else {
	Write-Success "PowerShell $($PSVersionTable.PSVersion) detected"
}

# Check for Python
Write-Section "Checking Python Installation"
try {
	$pythonVersion = python --version 2>&1
	if ($LASTEXITCODE -eq 0) {
		Write-Success "Python found: $pythonVersion"

		# Check if Python version is suitable (3.8+)
		$versionMatch = $pythonVersion -match "Python (\d+)\.(\d+)"
		if ($versionMatch) {
			$majorVersion = [int]$Matches[1]
			$minorVersion = [int]$Matches[2]

			if ($majorVersion -ge 3 -and $minorVersion -ge 8) {
				Write-Success "Python version is compatible (3.8+ required)"
			} else {
				Write-Warning "Python 3.8+ recommended. Current: $pythonVersion"
			}
		}
	} else {
		throw "Python not found"
	}
} catch {
	Write-Error "Python not found or not in PATH"
	Write-Host "Please install Python 3.8+ from: https://python.org/"
	Write-Host "Make sure to check 'Add Python to PATH' during installation"
	Read-Host "Press Enter to continue anyway, or Ctrl+C to exit"
}

# Check for Git
Write-Section "Checking Git Installation"
try {
	$gitVersion = git --version 2>&1
	if ($LASTEXITCODE -eq 0) {
		Write-Success "Git found: $gitVersion"
	} else {
		throw "Git not found"
	}
} catch {
	Write-Warning "Git not found or not in PATH"
	Write-Host "Download Git from: https://git-scm.com/"
	Write-Host "Git is recommended for version control and updates"
}

# Setup project directories
Write-Section "Setting Up Project Directories"

$directories = @(
	"src",
	"src\asm",
	"src\include",
	"src\data",
	"src\graphics",
	"assets",
	"assets\graphics",
	"assets\data",
	"assets\text",
	"assets\music",
	"tools",
	"tools\extractors",
	"tools\editors",
	"tools\build",
	"tools\analysis",
	"tools\formatting",
	"build",
	"tests",
	"docs\guides",
	"docs\technical",
	"docs\reference",
	"static"
)

foreach ($dir in $directories) {
	$fullPath = Join-Path $ProjectRoot $dir
	if (-not (Test-Path $fullPath)) {
		Write-Host "Creating directory: $dir" -ForegroundColor Cyan
		New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
	}
}

Write-Success "Project directory structure created"

# Check for ROM files (optional if -SkipROM specified)
if (-not $SkipROM) {
	Write-Section "Checking ROM Files"

	$staticDir = Join-Path $ProjectRoot "static"
	$romFiles = Get-ChildItem -Path $staticDir -Filter "*.smc" -ErrorAction SilentlyContinue

	if ($romFiles.Count -eq 0) {
		Write-Warning "No ROM files found in static/ directory"
		Write-Host ""
		Write-Host "Expected ROM files:" -ForegroundColor Yellow
		Write-Host "  • Dragon Quest III - Soshite Densetsu he... (J).smc (Primary target)" -ForegroundColor White
		Write-Host "  • Dragon Quest III - english (patched).smc (Optional)" -ForegroundColor Gray
		Write-Host ""
		Write-Host "ROM files should be placed in: $staticDir" -ForegroundColor Cyan

		$openStatic = Read-Host "Open static directory in Explorer? (y/n)"
		if ($openStatic -eq "y" -or $openStatic -eq "Y") {
			Start-Process explorer.exe -ArgumentList $staticDir
		}

		Write-Warning "Continue setup without ROM files? They can be added later."
		$continue = Read-Host "Continue? (y/n)"
		if ($continue -ne "y" -and $continue -ne "Y") {
			Write-Info "Setup paused. Add ROM files to static/ directory and run setup again."
			exit 0
		}
	} else {
		Write-Success "Found $($romFiles.Count) ROM file(s) in static/"
		foreach ($rom in $romFiles) {
			Write-Host "  • $($rom.Name)" -ForegroundColor Green
		}
	}
}

# Create Python virtual environment
Write-Section "Setting Up Python Environment"

$venvPath = Join-Path $ProjectRoot "venv"

if (Test-Path $venvPath) {
	Write-Info "Virtual environment already exists at: $venvPath"
} else {
	try {
		Write-Host "Creating Python virtual environment..." -ForegroundColor Cyan
		python -m venv $venvPath
		Write-Success "Virtual environment created"
	} catch {
		Write-Error "Failed to create virtual environment: $_"
		Write-Host "Continuing without virtual environment..."
	}
}

# Activate virtual environment and install dependencies
if (Test-Path $venvPath) {
	$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"

	if (Test-Path $activateScript) {
		try {
			Write-Host "Activating virtual environment..." -ForegroundColor Cyan
			& $activateScript

			Write-Host "Installing Python dependencies..." -ForegroundColor Cyan
			pip install -r requirements.txt
			Write-Success "Python dependencies installed"
		} catch {
			Write-Warning "Failed to install dependencies in virtual environment: $_"
			Write-Host "You may need to manually run:"
			Write-Host "  venv\Scripts\Activate.ps1"
			Write-Host "  pip install -r requirements.txt"
		}
	}
}

# Check for optional tools (if not skipped)
if (-not $SkipTools) {
	Write-Section "Checking Optional Tools"

	# Check for Asar (SNES assembler)
	try {
		$asarVersion = asar --version 2>&1
		if ($LASTEXITCODE -eq 0) {
			Write-Success "Asar assembler found: $asarVersion"
		} else {
			throw "Asar not found"
		}
	} catch {
		Write-Warning "Asar SNES assembler not found"
		Write-Host "Download from: https://github.com/RPGHacker/asar/releases"
		Write-Host "Asar is required for building ROM files from assembly"
	}

	# Check for VS Code
	try {
		$codeVersion = code --version 2>&1
		if ($LASTEXITCODE -eq 0) {
			Write-Success "VS Code found"
		} else {
			throw "VS Code not found"
		}
	} catch {
		Write-Info "VS Code not found (optional)"
		Write-Host "Download from: https://code.visualstudio.com/"
		Write-Host "VS Code is recommended for development with EditorConfig support"
	}
}

# Create basic configuration files
Write-Section "Creating Configuration Files"

# Create build configuration
$buildConfigPath = Join-Path $ProjectRoot "build.config.json"
if (-not (Test-Path $buildConfigPath)) {
	$buildConfig = @{
		"project" = @{
			"name" = "DQ3R"
			"version" = "1.0.0"
			"description" = "Dragon Quest III Remake - SNES Disassembly"
		}
		"build" = @{
			"mainSource" = "src\asm\main.asm"
			"outputRom" = "build\dq3r-rebuilt.sfc"
			"tempDir" = "build\temp"
		}
		"tools" = @{
			"assembler" = "asar"
			"emulator" = "mesen-s"
			"python" = @{
				"version" = "3.8"
				"venv" = "venv"
			}
		}
		"paths" = @{
			"static" = "static"
			"assets" = "assets"
			"docs" = "docs"
		}
	} | ConvertTo-Json -Depth 4

	$buildConfig | Out-File -FilePath $buildConfigPath -Encoding UTF8
	Write-Success "Created build configuration: build.config.json"
}

# Create workspace settings for VS Code
$vscodeDir = Join-Path $ProjectRoot ".vscode"
if (-not (Test-Path $vscodeDir)) {
	New-Item -ItemType Directory -Path $vscodeDir -Force | Out-Null
}

$settingsPath = Join-Path $vscodeDir "settings.json"
if (-not (Test-Path $settingsPath)) {
	$vscodeSettings = @{
		"files.associations" = @{
			"*.asm" = "asm-intel-x86-generic"
			"*.inc" = "asm-intel-x86-generic"
			"*.s" = "asm-intel-x86-generic"
		}
		"editor.insertSpaces" = $false
		"editor.tabSize" = 4
		"editor.detectIndentation" = $false
		"files.eol" = "`r`n"
		"files.encoding" = "utf8"
		"files.trimTrailingWhitespace" = $true
		"files.insertFinalNewline" = $true
		"python.defaultInterpreterPath" = "venv\Scripts\python.exe"
		"python.terminal.activateEnvironment" = $true
	} | ConvertTo-Json -Depth 3

	$vscodeSettings | Out-File -FilePath $settingsPath -Encoding UTF8
	Write-Success "Created VS Code workspace settings"
}

# Final summary
Write-Section "Setup Complete"

Write-Success "DQ3R development environment setup completed!"
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Add ROM files to static/ directory (if not done)" -ForegroundColor White
Write-Host "  2. Run initial ROM analysis: python tools\analyze_rom.py" -ForegroundColor White
Write-Host "  3. Start disassembly work in src\asm\" -ForegroundColor White
Write-Host "  4. Build ROM: .\build.ps1" -ForegroundColor White
Write-Host ""
Write-Host "Available Commands:" -ForegroundColor Yellow
Write-Host "  .\build.ps1              - Build ROM from source" -ForegroundColor White
Write-Host "  python tools\extract_*.py - Extract game assets" -ForegroundColor White
Write-Host "  pytest tests\            - Run test suite" -ForegroundColor White
Write-Host ""
Write-Host "Documentation:" -ForegroundColor Yellow
Write-Host "  docs\INDEX.md            - Documentation index" -ForegroundColor White
Write-Host "  tools\README.md          - Tools reference" -ForegroundColor White
Write-Host "  README.md                - Project overview" -ForegroundColor White
Write-Host ""

if (-not $SkipROM) {
	# Check if primary ROM exists
	$primaryRom = Join-Path $ProjectRoot "static\Dragon Quest III - Soshite Densetsu he... (J).smc"
	if (Test-Path $primaryRom) {
		Write-Success "Primary target ROM found: Dragon Quest III - Soshite Densetsu he... (J).smc"
		Write-Host "Ready to begin disassembly work! 🎮" -ForegroundColor Green
	} else {
		Write-Warning "Primary target ROM not found"
		Write-Host "Place 'Dragon Quest III - Soshite Densetsu he... (J).smc' in static/ directory"
	}
}

Write-Host ""
Write-Host "Happy ROM hacking! ✨" -ForegroundColor Cyan
