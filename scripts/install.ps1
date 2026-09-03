[CmdletBinding()]
param(
    [ValidateSet("all", "codex", "claude")]
    [string]$Target = "all",

    [ValidateSet("link", "copy")]
    [string]$Mode = "link",

    [string]$UserRoot = $env:USERPROFILE,

    [switch]$RefreshCopies,
    [switch]$InstallGlobalInstructions
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillsRoot = Join-Path $RepoRoot "skills"

if (-not (Test-Path $SkillsRoot -PathType Container)) {
    throw "Skills directory not found: $SkillsRoot"
}
if ([string]::IsNullOrWhiteSpace($UserRoot)) {
    throw "UserRoot cannot be empty."
}
$UserRoot = [System.IO.Path]::GetFullPath($UserRoot)

$Destinations = @()
if ($Target -in @("all", "codex")) {
    $Destinations += [PSCustomObject]@{
        Name = "Codex"
        Skills = Join-Path $UserRoot ".agents\skills"
        Instructions = Join-Path $UserRoot ".codex\AGENTS.md"
        InstructionSource = Join-Path $RepoRoot "config\AGENTS.md"
    }
}
if ($Target -in @("all", "claude")) {
    $Destinations += [PSCustomObject]@{
        Name = "Claude Code"
        Skills = Join-Path $UserRoot ".claude\skills"
        Instructions = Join-Path $UserRoot ".claude\CLAUDE.md"
        InstructionSource = Join-Path $RepoRoot "config\CLAUDE.md"
    }
}

$Installed = 0
$Skipped = 0

foreach ($Destination in $Destinations) {
    New-Item -ItemType Directory -Force -Path $Destination.Skills | Out-Null
    Write-Host "`n[$($Destination.Name)] $($Destination.Skills)" -ForegroundColor Cyan

    foreach ($Skill in Get-ChildItem -Path $SkillsRoot -Directory | Sort-Object Name) {
        if (-not (Test-Path (Join-Path $Skill.FullName "SKILL.md") -PathType Leaf)) {
            Write-Warning "Skipping $($Skill.Name): SKILL.md was not found."
            $Skipped++
            continue
        }

        $DestinationPath = Join-Path $Destination.Skills $Skill.Name
        if (Test-Path $DestinationPath) {
            if ($Mode -eq "copy" -and $RefreshCopies) {
                Remove-Item -Recurse -Force -LiteralPath $DestinationPath
            } else {
                Write-Host "  SKIP $($Skill.Name) (destination already exists)" -ForegroundColor Yellow
                $Skipped++
                continue
            }
        }

        if ($Mode -eq "link") {
            New-Item -ItemType Junction -Path $DestinationPath -Target $Skill.FullName | Out-Null
        } else {
            Copy-Item -Recurse -LiteralPath $Skill.FullName -Destination $DestinationPath
        }
        Write-Host "  OK   $($Skill.Name)"
        $Installed++
    }

    if ($InstallGlobalInstructions) {
        $InstructionParent = Split-Path -Parent $Destination.Instructions
        New-Item -ItemType Directory -Force -Path $InstructionParent | Out-Null
        if (Test-Path $Destination.Instructions) {
            Write-Warning "Global instructions already exist and were not changed: $($Destination.Instructions)"
        } elseif ($Mode -eq "link") {
            try {
                New-Item -ItemType HardLink -Path $Destination.Instructions -Target $Destination.InstructionSource | Out-Null
                Write-Host "  OK   global instructions"
            } catch {
                Copy-Item -LiteralPath $Destination.InstructionSource -Destination $Destination.Instructions
                Write-Warning "Hard link was unavailable; global instructions were copied instead."
            }
        } else {
            Copy-Item -LiteralPath $Destination.InstructionSource -Destination $Destination.Instructions
            Write-Host "  OK   global instructions"
        }
    }
}

Write-Host "`nInstalled: $Installed | Skipped: $Skipped" -ForegroundColor Green
Write-Host "Restart an open agent session if the new skills do not appear immediately."
