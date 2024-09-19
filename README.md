# PowerShell Configuration, Utilities and Aliases

This repository contains a customized PowerShell environment with various utilities and aliases to improve productivity.<br/>Follow the instructions below to set up and start using the provided scripts.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Git**: Used for cloning the repository.
- **Neovim (nvim)**: (Optional) For editing configuration files.
- **Nerd Fonts**: For better visibility; download a nerd [font](https://github.com/ryanoasis/nerd-fonts) as per your choice.

## Installation

1. **Clone the Repository:**

   ```sh
   git clone https://github.com/david2rock/powershell.git $HOME/.config/powershell
   ```

2. **Navigate to the Repository:**

    ```sh
    cd $HOME/.config/powershell
    ```

3. **Run the Installation Script:**

    This script will install the necessary modules and tools.

    ```sh
    ./install.ps1
    ```

    This will:
    - Install Windows Terminal if not already installed.
    - Install Windows Powershell if not already installed.
    - Install Oh My Posh for a customized prompt.
    - Install and configure fzf, Terminal-Icons, and other PowerShell modules.
    - Create a `custom.ps1` file for your custom configurations or overrides.
    - Add the configurations to CurrentUserCurrentHost.
    - Set up additional utilities and aliases for an enhanced shell experience.

4. **Reload Your PowerShell Profile:**

    ```sh
    . $PROFILE
    ```

## Customization

You can customize the environment further by editing the following files:

- **`user_profile.ps1`**: Contains the main configuration, including prompt settings, aliases, and more.
- **`utils.ps1`**: Houses additional utility functions such as pkill, which, uz, etc.
- **`custom.ps1`**: **Add your custom functions or overrides here.**

To edit the `custom.ps1` files, you can use the following command:

  ```pwsh
  cus
  ```

  This will open the file in neovim.

## Available Commands and Aliases

This setup includes several commands and aliases to enhance your workflow.<br/> They are categorized below for easy reference.

### Navigation and File Operations

- `ll`: Enhanced ls command with color, icons, and Git integration.
- `rmf`: Remove files or directories forcefully.
- `touch`: Create a new file.

### Git Aliases (New in 0.3.0)

This version introduces new Git aliases to simplify Git operations:

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

### Browser Shortcuts

  These commands allow you to quickly open browsers or search the web.

- `br <url or query>`: Opens Brave browser.
- `ch <url or query>`: Opens Chrome browser.

  Examples:

- **Search**: `br -s "your search query"` – Searches your query in Brave.
- **Open URL**: `br url` – Opens the specified URL in Brave.
- **Open Browser**: `br` – Opens Brave without any URL or query.

### Development Tools

  These commands help streamline your development environment.

- `g`: Shortcut for git.
- `c`: Shortcut for code (Visual Studio Code).
- `vi or vim`: Alias for nvim (Neovim).
- `lg`: Alias for lazygit.

### System Management

- `update`: Updates Python's pip, Scoop packages, and Oh My Posh, and upgrades all applications via winget.
- `pkill <process_name>`: Terminates processes by name. e.g. `pkill code`; terminates vscode.
- `which <command_name>`: Checks if a command is available on your system and returns its path.
- `restart`: Restarts your computer immediately.
- `quit`: Shuts down your computer immediately.

### Application Launchers

  Quickly launch frequently used applications.

- `note`: Launches the Microsoft Sticky Notes application.
- `notes <optional_file_path>`: Opens Notepads for quick note-taking; ([notepads](https://apps.microsoft.com/detail/9nhl4nsc67wm) alternative to Notepad).

### File Management

- `uz <file_to_unzip>`: Extracts the files in current folder.

  Examples:

- `uz <file_path> <output_folder>`: Extracts the files in given output folder.

### Prompt Customization

- `theme <theme_name>`: Changes the Oh My Posh theme.

  Oh-my-posh [themes](https://ohmyposh.dev/docs/themes).

### Other Utilities

- `weather`: Get the weather report for your location based on IP address.

> Use help command on any function above to know more about that.
>
>```sh
>  man <command>
>  ```

## Contributing

Feel free to fork this repository, make your changes, and submit a pull request. Contributions are welcome!
