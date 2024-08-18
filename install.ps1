Set-ExecutionPolicy Bypass -Scope Process -Force

$fzf_version = "0.54.3"

function Test-ModuleInstalled {
    param (
        [string]$ModuleName
    )
    return Get-Module -ListAvailable -Name $ModuleName -ErrorAction SilentlyContinue
}

function Install-ModuleIfNotExists {
    param (
        [string]$ModuleName,
        [string]$Source = "PSGallery"
    )
    if (-not (Test-ModuleInstalled -ModuleName $ModuleName)) {
        Write-Output "Installing $ModuleName..."
        Install-Module -Name $ModuleName -Scope CurrentUser -Force -AllowClobber -Repository $Source
    } else {
        Write-Output "$ModuleName is already installed."
    }
}

Write-Output ". '$HOME\.config\powershell\user_profile.ps1'" >  $PROFILE.CurrentUserCurrentHost

Write-Output "Installing Oh My Posh..."
winget install JanDeDobbeleer.OhMyPosh -s winget

Install-ModuleIfNotExists -ModuleName "Terminal-Icons"

Install-ModuleIfNotExists -ModuleName "z"

Install-ModuleIfNotExists -ModuleName "PSFzf"

Write-Output "Downloading fzf.exe..."
$fzfUrl = "https://github.com/junegunn/fzf/releases/download/v$fzf_version/fzf-$fzf_version-windows_amd64.zip"
$destination = "$env:USERPROFILE\downloads\fzf.zip"
Invoke-WebRequest -Uri $fzfUrl -OutFile $destination

Write-Output "Extracting fzf.exe..."
Expand-Archive -Path $destination -DestinationPath "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\bin" -Force

Remove-Item -Path $destination -Force

Write-Output "Installation completed. Please restart your terminal or reload your profile to use the new modules and tools."
