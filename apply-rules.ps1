# PowerShell script for applying Cursor Auto Rules

param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

# Check if target directory exists
if (-not (Test-Path $TargetDir)) {
    Write-Host "📁 Creating new project directory: $TargetDir"
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
    
    # Initialize readme for new project
    @"
# New Project

This project has been initialized with agile workflow support and auto rule generation configured from [cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow).

For workflow documentation, see [Workflow Rules](docs/workflow-rules.md).
"@ | Set-Content "$TargetDir\README.md"
}

# Create .cursor/rules directory if it doesn't exist
$rulesDir = Join-Path $TargetDir ".cursor\rules"
New-Item -ItemType Directory -Path $rulesDir -Force | Out-Null

# Copy core rule files
Write-Host "📦 Copying core rule files..."
Copy-Item ".cursor\rules\*.mdc" -Destination $rulesDir -Force

# Create docs directory if it doesn't exist
$docsDir = Join-Path $TargetDir "docs"
New-Item -ItemType Directory -Path $docsDir -Force | Out-Null

# Create workflow documentation
@"
# Cursor Workflow Rules

This project has been updated to use the auto rule generator from [cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow).

> **Note**: This script can be safely re-run at any time to update the template rules to their latest versions. It will not impact or overwrite any custom rules you've created.

## Core Features

- Automated rule generation
- Standardized documentation formats
- AI behavior control and optimization
- Flexible workflow integration options

## Workflow Integration Options

### 1. Automatic Rule Application (Recommended)
The core workflow rules are automatically installed in `.cursor/rules/`:
- `901-prd.mdc` - Product Requirements Document standards
- `902-arch.mdc` - Architecture documentation standards
- `903-story.mdc` - User story standards
- `801-workflow-agile.mdc` - Complete Agile workflow (optional)

These rules are automatically applied when working with corresponding file types.

### 2. Notepad-Based Workflow
For a more flexible approach, use the templates in `xnotes/`:
1. Enable Notepads in Cursor options
2. Create a new notepad (e.g., "agile")
3. Copy contents from `xnotes/workflow-agile.md`
4. Use \`@notepad-name\` in conversations

> 💡 **Tip:** The Notepad approach is ideal for:
> - Initial project setup
> - Story implementation
> - Focused development sessions
> - Reducing context overhead

## Getting Started

1. Review the templates in \`xnotes/\`
2. Choose your preferred workflow approach
3. Start using the AI with confidence!

For demos and tutorials, visit: [BMad Code Videos](https://youtube.com/bmadcode)
"@ | Set-Content "$docsDir\workflow-rules.md"

# Update .gitignore if needed
$gitignorePath = Join-Path $TargetDir ".gitignore"
if (Test-Path $gitignorePath) {
    if (-not (Select-String -Path $gitignorePath -Pattern "\.cursor/rules/_\*\.mdc" -Quiet)) {
        "`n# Private individual user cursor rules`n.cursor/rules/_*.mdc" | Add-Content $gitignorePath
    }
} else {
    "# Private individual user cursor rules`n.cursor/rules/_*.mdc" | Set-Content $gitignorePath
}

# Create xnotes directory and copy templates
Write-Host "📝 Setting up Notepad templates..."
$xnotesDir = Join-Path $TargetDir "xnotes"
New-Item -ItemType Directory -Path $xnotesDir -Force | Out-Null
Copy-Item "xnotes\*" -Destination $xnotesDir -Recurse -Force

# Update .cursorignore if needed
$cursorignorePath = Join-Path $TargetDir ".cursorignore"
if (Test-Path $cursorignorePath) {
    if (-not (Select-String -Path $cursorignorePath -Pattern "^xnotes/" -Quiet)) {
        "`n# Project notes and templates`nxnotes/" | Add-Content $cursorignorePath
    }
} else {
    "# Project notes and templates`nxnotes/" | Set-Content $cursorignorePath
}

Write-Host "✨ Deployment Complete!"
Write-Host "📁 Core rules: $rulesDir"
Write-Host "📝 Notepad templates: $xnotesDir"
Write-Host "📄 Documentation: $docsDir\workflow-rules.md"
Write-Host "🔒 Updated .gitignore and .cursorignore"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Review the documentation in docs/workflow-rules.md"
Write-Host "2. Choose your preferred workflow approach"
Write-Host "3. Enable Cursor Notepads if using the flexible workflow option"
Write-Host "4. To start a new project, use xnotes/project-idea-prompt.md as a template"
Write-Host "   to craft your initial message to the AI agent"