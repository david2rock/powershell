# --------- utilites ---------
function ll {
  eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --color-scale-mode gradient --no-permissions $args
}

# --------- Brave ---------
function brave {
  <#
  .SYNOPSIS
  Opens Brave browser with an optional search query.
  .PARAMETER s
  Switch to format the query for Brave search.
  .PARAMETER query
  Search query to be passed to Brave search engine.
  .EXAMPLE
  brave -s "PowerShell scripting"
  This will open Brave and search for "PowerShell scripting".
  .EXAMPLE
  brave
  This will open the Brave browser without any search.
  .EXAMPLE
  brave github.com
  This will open github.com in Brave browser without any search.
  #>
  param (
    [switch]$s,
    [string]$query
  )

  if ($s -and $query) {
    $formattedQuery = $query -replace ' ', '+'
    $searchUrl = "https://search.brave.com/search?q=$formattedQuery"
    Start-Process "brave.exe" -ArgumentList $searchUrl
  }
  elseif ($query) {
    Start-Process "brave.exe" -ArgumentList $query
  }
  else {
    Start-Process "brave.exe"
  }
}

# --------- Chrome ---------
function chrome {
  <#
  .SYNOPSIS
  Opens Google Chrome with an optional search query.
  .PARAMETER s
  Switch to format the query for Google search.
  .PARAMETER query
  Search query to be passed to Google.
  .EXAMPLE
  chrome -s "PowerShell scripting"
  This will open Chrome and search for "PowerShell scripting" on Google.
  .EXAMPLE
  chrome
  This will open the Chrome browser without any search.
  #>
  param (
    [switch]$s,
    [string]$query
  )

  if ($s -and $query) {
    $formattedQuery = $query -replace ' ', '+'
    $searchUrl = "https://www.google.com/search?q=$formattedQuery"
    Start-Process "chrome.exe" -ArgumentList $searchUrl
  }
  elseif ($query) {
    Start-Process "chrome.exe" -ArgumentList $query
  }
  else {
    Start-Process "chrome.exe"
  }
}

function pkill {
  <#
  .SYNOPSIS
    Terminates a process by its name.
  .PARAMETER Name
    The name of the process to kill.
  .EXAMPLE
    pkill chrome
    This will stop all running Chrome processes.
  .EXAMPLE
    pkill code
    This will stop all running VS Code processes.
  #>
  param (
    [Parameter(Mandatory=$true)][string]$Name
  )
  Get-Process $Name -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
}
function which {
  <#
  .SYNOPSIS
    Finds the location of a command or cmdlet.
  .PARAMETER Name
    The name of the cmdlet or command you want to find.
  .EXAMPLE
    which python
    This will display the path of the Python executable.
  .EXAMPLE
    which git
    This will display the path of the Git executable.
  #>
  param (
    [Parameter(Mandatory=$true)]
    [string]$Name
  )
  try {
    Get-Command $Name -ErrorAction Stop
  }
  catch {
    Write-Error "$Name Command not found."
  }
}

function update {
  Write-Output "Updating Python..."
  python.exe -m pip install --upgrade pip
  scoop update
  scoop cleanup *
  scoop cache rm *
  scoop status
  Write-Output "`nUpdating oh-my-posh..."
  oh-my-posh upgrade
  winget upgrade --all --include-unknown
}
function weather {
  curl https://wttr.in/
}

# -------- shutdown / restart ---------
function restart {
  <#
  .SYNOPSIS
    Restarts the system immediately.
  #>
  shutdown -r -t 0
}

function quit {
  <#
  .SYNOPSIS
    Shuts down the system immediately.
  #>
  shutdown -s -t 0
}

# ----------- Sticky notes --------
function note {
  <#
  .SYNOPSIS
    Opens the Microsoft Sticky Notes application.
  #>
  Start-Process "explorer.exe" "shell:appsFolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"
}

# ------- Notepads -----------
function notes {
  <#
  .SYNOPSIS
    Opens a file in Notepads, a text editor.
  .PARAMETER filePath
    The path to the file you want to open.
  .EXAMPLE
    notes "C:\Users\example\document.txt"
    This will open the specified text file in Notepads.
  .NOTES
    Notepads must be installed. Download it from the Microsoft Store if not available.
    Link: https://apps.microsoft.com/detail/9nhl4nsc67wm
  #>
  param (
    [string]$filePath
  )
  Start-Process notepads $filePath
}

# ----------------- Unzip -----------------
function uz {
  <#
  .SYNOPSIS
    Unzips a compressed file to a destination directory.
  .PARAMETER sourcePath
    The path of the compressed file to be unzipped.
  .PARAMETER destinationPath
    The directory where the files will be extracted. If not provided, it will extract to a folder named after the archive.
  .EXAMPLE
    uz "C:\example\file.zip"
    This will unzip the file into a directory named "file" in the same location.
  .EXAMPLE
    uz "C:\example\file.zip" "C:\output"
    This will unzip the file to the "output" directory.
  #>
  param (
    [Parameter(Mandatory=$true)]
    [string]$sourcePath,
    [string]$destinationPath
  )

  if (-Not (Test-Path -Path $sourcePath)) {
    Write-Error "Source file does not exist: $sourcePath"
    return
  }

  if (-not $destinationPath) {
    $destinationPath = [System.IO.Path]::GetFileNameWithoutExtension($sourcePath)
  }

  if (-Not (Test-Path -Path $destinationPath)) {
    New-Item -Path $destinationPath -ItemType Directory -Force | Out-Null
  }

  try {
    Expand-Archive -Path $sourcePath -DestinationPath $destinationPath -Force
    Write-Output "Successfully unzipped $sourcePath to $destinationPath"
  } catch {
    Write-Error "Failed to unzip $sourcePath to ${destinationPath}: $_"
  }
}

# --------------- Remove Item Force & Recurse -------
function rmf {
  <#
  .SYNOPSIS
    Removes an item (file/folder) forcefully with recursion.
  .PARAMETER path
    The path(s) of the item(s) to remove.
  .EXAMPLE
    rmf "C:\example\folder"
    This will remove the specified folder and its contents.
  #>
  param (
      [Parameter(Mandatory=$true)]
      [string]
      $path
  )
  Remove-Item $path -Recurse -Force
}

# ----------theme-------
function theme {
  <#
  .SYNOPSIS
  Initializes a PowerShell theme using Oh My Posh with a specified configuration file.

  .DESCRIPTION
  The `theme` function allows you to set the visual theme of your PowerShell prompt by initializing Oh My Posh with a specific configuration file. The function constructs the path to the theme configuration file based on the environment variable `POSH_THEMES_PATH` and the provided theme name. Once initialized, it applies the theme to the current PowerShell session.

  .PARAMETER args
  The name of the theme (without the .omp.json extension) that you wish to apply. This name will be appended to the `POSH_THEMES_PATH` to locate the corresponding configuration file.

  .EXAMPLE
  theme mytheme
  To set the theme to 'mytheme', you would call the above
  This would look for the configuration file at: $env:POSH_THEMES_PATH\mytheme.omp.json and apply the theme.
  #>
  param (
    [Parameter(Mandatory=$true)]
    [string]
    $Name
  )
  oh-my-posh.exe init pwsh --config $env:POSH_THEMES_PATH\$Name.omp.json | Invoke-Expression
}

# ------------- Activate Python .venv -------------
function act {
  <#
  .SYNOPSIS
    Activates the Python virtual environment and sets the terminal theme.
  .EXAMPLE
    act
    This will activate the `.venv` virtual environment and apply the "kali" theme.
  .NOTES
    Make sure to run it the project directory.
  #>
  .\.venv\Scripts\activate
  theme "kali"
}

# ---- main.py -------
function main {
  <#
  .SYNOPSIS
    Runs the `main.py` Python script.
  .EXAMPLE
    main
    This will execute `main.py` using Python in current directory.
  #>
  python.exe main.py
}
