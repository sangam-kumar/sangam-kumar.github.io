# PowerShell script to create a new daily blog post
# Usage: .\scripts\new-post.ps1 [optional-title]

param(
    [string]$Title = ""
)

# Get today's date in YYYY-MM-DD format
$Date = Get-Date -Format "yyyy-MM-dd"
$DateForTitle = Get-Date -Format "yyyy-MM-dd"

# If title is provided, use it; otherwise create a default daily entry title
if ($Title -eq "") {
    $Title = "$DateForTitle - Daily Entry"
    $FileName = "$Date-daily-entry.md"
} else {
    # Sanitize title for filename (lowercase, replace spaces with hyphens, remove special chars)
    $FileNameTitle = $Title.ToLower() -replace '[^\w\s-]', '' -replace '\s+', '-'
    $FileName = "$Date-$FileNameTitle.md"
}

# Get project root (one level up from scripts directory)
$ProjectRoot = Split-Path -Parent $PSScriptRoot

# Path to the new post file
$PostPath = Join-Path $ProjectRoot "_posts\$FileName"

# Check if file already exists
if (Test-Path $PostPath) {
    Write-Host "⚠️  Post already exists: $PostPath" -ForegroundColor Yellow
    $Overwrite = Read-Host "Do you want to overwrite it? (y/N)"
    if ($Overwrite -ne "y" -and $Overwrite -ne "Y") {
        Write-Host "❌ Aborted." -ForegroundColor Red
        exit 1
    }
}

# Read the template
$TemplatePath = Join-Path $ProjectRoot "_templates\post-template.md"
if (-not (Test-Path $TemplatePath)) {
    Write-Host "❌ Template not found at: $TemplatePath" -ForegroundColor Red
    exit 1
}

$TemplateContent = Get-Content $TemplatePath -Raw

# Replace title first if custom title provided, otherwise replace {{DATE}} in title
if ($Title -ne "$DateForTitle - Daily Entry") {
    $TemplateContent = $TemplateContent -replace 'title: "{{DATE}} - Daily Entry"', "title: `"$Title`""
} else {
    # Replace {{DATE}} in title with actual date
    $TemplateContent = $TemplateContent -replace 'title: "{{DATE}} - Daily Entry"', "title: `"$DateForTitle - Daily Entry`""
}

# Replace {{DATE}} placeholder in date field
$TemplateContent = $TemplateContent -replace '\{\{DATE\}\}', $Date
$TemplateContent = $TemplateContent -replace '{{DATE}}', $Date

# Write the new post
$TemplateContent | Out-File -FilePath $PostPath -Encoding UTF8

Write-Host ""
Write-Host "✅ Created new post: $PostPath" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Title: $Title" -ForegroundColor Cyan
Write-Host "📅 Date: $Date" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Tip: Open the file and start writing!" -ForegroundColor Yellow
Write-Host ""

# Optionally open the file in the default editor
$OpenEditor = Read-Host "Would you like to open it now? (Y/n)"
if ($OpenEditor -eq "" -or $OpenEditor -eq "y" -or $OpenEditor -eq "Y") {
    notepad $PostPath
}

