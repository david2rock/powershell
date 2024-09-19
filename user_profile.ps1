# --------- set PowerShell to UTF-8 ---------
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# --------- Prompt ---------
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kali.omp.json" | Invoke-Expression

# --------- Bat (better cat) ---------
$env:BAT_THEME="OneHalfDark"

# --------- Terminal-Icons ---------
Import-Module -Name Terminal-Icons

# --------- PSReadLine ---------
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
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
. $HOME\.config\powershell\alias\alias.ps1
. $HOME\.config\powershell\utils.ps1
. $HOME\.config\powershell\custom.ps1
