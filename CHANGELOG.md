# Changelog

## 0.3.0 - 2024-09-19

### Added

- Help descriptions added to functions: `pkill`, `restart`, `quit`, `note`, `notes`, `uz`, `theme`, `act`, `main`.
- Improved `uz` function with error handling for non-existent source files and destination folder creation.
- New Git aliases:
  - `gcl` Clone GitHub repositories (`git clone repo`).
  - `gst`: Shows the status of the working directory (`git status`).
  - `ga`: Adds changes to staging area (`git add`).
  - `gaa`: Adds all changes to the staging area (`git add --all`).
  - `gcmsg`: Commits with a message (`git commit --message`).
  - `gpush`: Pushes changes to the origin repository, with improved functionality to allow specifying remote and branch.
  - `gf`: Fetches changes from the origin remote (`git fetch origin`).
  - `gl`: Pulls changes from the remote repository (`git pull`).
  - `gb`: Lists or creates branches (`git branch`).
  - `gbD`: Forces deletion of a branch (`git branch --delete --force`).
  - `gba`: Shows all branches (`git branch --all`).
  - `gbd`: Deletes a branch (`git branch --delete`).
  - `gcb`: Creates and switches to a new branch (`git checkout -b`).
  - `gco`: Switches branches or restores working tree files (`git checkout`).
  - `glgga`: Shows the Git log with graph, decorate, and all branches (`git log --graph --decorate --all`).
  - `gm`: Merges branches (`git merge`).
  - `gms`: Squash merges branches (`git merge --squash`).
  - `gra`: Adds a remote repository (`git remote add origin`).
  - `gwch`: Shows changes in the working directory (`git whatchanged`).

### Changed

- Update json from 0.54.3 to 0.55.0
- Function `pkill`: Help descriptions and examples provided.
- Function `which`: Updated error handling for command not found.
- Function `restart`, `quit`: Help descriptions added.
- Function `note`, `notes`: Help descriptions added for sticky notes and Notepads.
- Function `uz`: Improved unzipping process and error handling.
- Function `theme`: Help description improved and added.
- Function `act`: Added theming with the "kali" theme on activation of Python virtual environment.
- Function `main`: Help description added.

## 0.2.0 - 2024-09-07

### Added

- Function `which`: Finds a command or cmdlet.
- Function `uz`: Unzips a compressed file with optional destination.
- Function `theme`: Changes the prompt theme using `oh-my-posh`.

### Changed

- Function `update`: Added more comprehensive update procedures for Python, Scoop, and `oh-my-posh`.

## 0.1.0 - 2024-08-16

### Added

- Function `ll`: A custom file listing with additional features like git status, icons, and color gradients.
- Function `brave`: Opens Brave browser with optional search query.
- Function `chrome`: Opens Chrome browser with optional search query.
- Function `pkill`: Terminates a process by name.
- Function `update`: Updates Python and other tools using Scoop and `winget`.
- Function `weather`: Displays current weather using wttr.in.
- Function `restart`: Restarts the system immediately.
- Function `quit`: Shuts down the system immediately.
- Function `note`: Opens the Microsoft Sticky Notes app.
- Function `notes`: Opens a text file in Notepads (alternative to Notepad).
- Function `rmf`: Removes an item with `-Recurse` and `-Force` options.
- Function `act`: Activates the Python virtual environment from `.venv`.
- Function `main`: Runs the `main.py` script using python.
