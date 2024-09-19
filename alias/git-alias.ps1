# Git Add
function ga {
    git add $args
}

# Git Add All
function gaa {
    git add --all
}

# Git Branch
function gb {
    git branch $args
}

# Git Delete Branch
function gbd {
    git branch --delete $args
}

# Git Force Delete Branch
function gbD {
    git branch --delete --force $args
}

# Git Show All Branches
function gba {
    git branch --all
}

# Git Checkout New Branch
function gcb {
    git checkout -b $args
}

# Git Checkout
function gco {
    git checkout $args
}

function gcmsg {
    <#
    .SYNOPSIS
        Git Commit with Message.
    .PARAMETER msg
        Message for the commit.
    #>
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $msg
    )
    git commit --message $msg
}

# Git Fetch from Origin
function gf {
    git fetch origin
}

# Git Pull
function gl {
    git pull
}

# Git Push (Improved to allow custom branches or remotes)
function gpush {
    param (
        [string]$remote = "origin",
        [string]$branch = "main"
    )
    git push $remote $branch
}

# Git Log Graph All
function glgga {
    git log --graph --decorate --all
}

# Git Merge
function gm {
    git merge $args
}

# Git Merge Squash
function gms {
    git merge --squash $args
}

# Git Remote Add Origin
function gra {
    <#
    .PARAMETER repo
        'Username/repo' of the remote repo you want to add.
    .SYNOPSIS
        Adds a remote to Local git repository.
    .EXAMPLE
        gra david2rock/powershell
        This wil add https://github.com/david2rock/powershell as remote to local repository.
    #>
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $repo
    )
    $repourl = "https://github.com/$repo"
    git remote add origin $repourl
}

# Git Status
function gst {
    git status
}

# Git What Changed
function gwch {
    git whatchanged -p --abbrev-commit --pretty=medium $args
}

# ---- Git Clone -----
function gcl {
    <#
    .SYNOPSIS
        Clones a GitHub repository to the specified or default destination.
    .PARAMETER Repo
        The name of the GitHub repository in the format 'username/repository'. This parameter is required.
    .PARAMETER Destination
        An optional parameter specifying the destination folder to clone the repository into. If not provided, it defaults to a folder named after the repository.
    .EXAMPLE
        gcl "username/repo"
        This clones the GitHub repository 'repo' from the user 'username' into the current directory.
    .EXAMPLE
        gcl "username/repo" "C:\projects\myRepo"
        This clones the repository into the specified folder "C:\projects\myRepo".
    .NOTES
        The function uses the `git clone` command to clone repositories. Make sure that Git is installed and available in your system's PATH.
    #>
    param (
        [Parameter(Mandatory = $true)]
        [string]$Repo,
        [string]$Destination
    )

    $repoUrl = "https://github.com/$Repo.git"

    if ($Destination) {
        git clone --recurse-submodules $repoUrl $Destination
    }
    else {
        git clone --recurse-submodules $repoUrl
    }
}