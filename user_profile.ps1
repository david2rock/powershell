# --------- set PowerShell to UTF-8 ---------
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# --------- Prompt ---------
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kali.omp.json" | Invoke-Expression

# --------- Bat (better cat) ---------
$env:BAT_THEME="OneHalfDark"

# --------- Terminal-Icons ---------
Import-Module -Name Terminal-Icons

# --------- Alias ---------
Set-Alias d z
Set-Alias g git
Set-Alias c code
Set-Alias cat bat
Set-Alias vi nvim
Set-Alias br brave
Set-Alias vim nvim
Set-Alias cl clear
Set-Alias py python
Set-Alias ch chrome
Set-Alias lg lazygit
Set-Alias touch New-Item
Set-Alias cpl inetcpl.cpl
Set-Alias s Start-Process
Set-Alias sq $home\.dbclient\sqlite3.exe
Set-Alias tig $home\scoop\apps\git\current\usr\bin\tig.exe
Set-Alias less $home\scoop\apps\git\current\usr\bin\less.exe
Set-Alias grep $home\scoop\apps\git\current\usr\bin\grep.exe

# --------- PSReadLine ---------
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# --------- Fzf ---------
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

function pwshrc {
    nvim $HOME\.config\powershell\user_profile.ps1
  }
function pwshut {
    nvim $HOME\.config\powershell\utils.ps1
}

function cus {
    nvim $HOME\.config\powershell\custom.ps1    
}
. $HOME\.config\powershell\utils.ps1
. $HOME\.config\powershell\custom.ps1 -ErrorAction SilentlyContinue