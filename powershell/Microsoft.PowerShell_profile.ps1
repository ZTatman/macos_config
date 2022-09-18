# Environement Vars
$env:FZF_DEFAULT_COMMAND="rg --files"
$env:FZF_DEFAULT_OPTS="-m --height 50% --border"

# Aliases
Set-Alias g git
Set-Alias lg lazygit
Set-Alias vim nvim
Set-Alias which Get-CmdletAlias-Path
Set-Alias ll Get-Items
Set-Alias touch MkFile
Set-Alias status Git-Status
Set-Alias add Git-Add-File
Set-Alias commit Git-Commit
Set-Alias clone Git-Clone
Set-Alias grep findstr
# Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
# Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utility Functions
function Get-Items {ls | fw -c 5}
function Get-CmdletAlias-Definition ($cmdletname) {
    Get-Alias |
      Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
        Format-Table -Property Definition, Name -AutoSize
  }
function Get-CmdletAlias-Path ($cmdletname) {
   Get-Command "$cmdletname" | select -expandproperty Path
}

function Pro {notepad $PROFILE.CurrentUserAllHosts}
function MkFile($path) {New-Item -Path "$path" -Type File}

# Git Utility Functions
function Git-Status {git status}
function Git-Add-File($file) {git add "$file"}
function Git-Commit($message) {git commit -m "$message"}
function Git-Clone($repoUrl) {git clone "$repoUrl"}

# Oh-My-Posh Initialization
oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH\pure.omp.json" | Invoke-Expression

# Modules
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

# Module Options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows