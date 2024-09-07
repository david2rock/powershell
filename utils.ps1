# --------- utilites ---------
function ll {
  eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --color-scale-mode gradient --no-permissions $args
}
# --------- Brave ---------
function brave {
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

# --------- Chrome ----------
function chrome {
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


function pkill($name) {
  Get-Process $name -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
}

function which($name) {
  try {
    Get-Command $name -ErrorAction Stop
  }
  catch {
    Write-Output "$name Command not found."
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
  shutdown -r -t 0
}
function quit {
  shutdown -s -t 0
}

# ----------- Sticky notes --------
function note {
  Start-Process "explorer.exe" "shell:appsFolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"
}

# ------- notepad -----------
function notes {
  Start-Process notepads $args
}

# ----------------- unzip -----------------
function uz {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )

    if (-Not (Test-Path $sourcePath)) {
        Write-Error "Source file does not exist: $sourcePath"
        return
    }

    if (-Not (Test-Path $destinationPath)) {
        New-Item -Path $destinationPath -ItemType Directory -Force | Out-Null
    }

    try {
        Expand-Archive -Path $sourcePath -DestinationPath $destinationPath -Force
        Write-Output "Successfully unzipped $sourcePath to $destinationPath"
    } catch {
        Write-Error "Failed to unzip $sourcePath to $destinationPath: $_"
    }
}

# ---------------rm item force & Recurse -------
function rmf {
  Remove-Item $args -Recurse -Force 
}

# ----------theme-------
function theme {
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\$args.omp.json" | Invoke-Expression
}

# ------------- Activate python .venv -------------
function act {
  .\.venv\Scripts\activate
  theme "kali"
}

# ---- main.py -------
function main {
  python main.py
}
