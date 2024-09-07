# PowerShell Configuration and Utilities

This repository contains a customized PowerShell environment with various utilities and aliases to improve productivity. Follow the instructions below to set up and start using the provided scripts.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Git**: Used for cloning the repository.
- **Neovim (nvim)**: For editing configuration files.

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
    - Add the configuration to CurrentUserCurrentHost.
    - Install Oh My Posh for a customized prompt.
    - Install and configure fzf, Terminal-Icons, and other PowerShell modules.
    - Set up additional utilities and aliases for an enhanced shell experience.
    - Create a `custom.ps1` file for your custom configrations.

4. **Reload Your PowerShell Profile:**

    ```sh
    . $PROFILE
    ```

## Customization

You can customize the environment further by editing the following files:

- **`user_profile.ps1`**: Contains the main configuration, including prompt settings, aliases, and more.
- **`utils.ps1`**: Houses additional utility functions such as brave, chrome, weather, etc.
- **`custom.ps1`**: Add your custom functions or overrides here.

To edit these files, you can use the following commands:

- Edit the main profile:

  ```pwsh
  pwshrc
  ```

- Edit the utilities script:

  ```pwsh
  pwshut
  ```

- Edit the custom script:

  ```pwsh
  cus
  ```

## Available Commands and Aliases

This setup includes several commands and aliases to enhance your workflow. They are categorized below for easy reference.

### Navigation and File Operations

- `ll`: Enhanced ls command with color, icons, and Git integration.
- `rmf`: Remove files or directories forcefully.
- `touch`: Create a new file

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
- `notes <optional_file_path>`: Opens Notepads for quick note-taking; notepads [link](https://apps.microsoft.com/detail/9nhl4nsc67wm) highly recommended.

### File Management

- `uz <file_to_unzip>`: Unzips a file.

  Examples:

- `uz <file_path> -o"output_folder`: Extracts the files in given output folder.

### Prompt Customization

- `theme <theme_name>`: Changes the Oh My Posh theme.

  Oh-my-posh [themes](https://ohmyposh.dev/docs/themes).

### Other Utilities

- `weather`: Get the weather report for your location based on IP address.

## Contributing

Feel free to fork this repository, make your changes, and submit a pull request. Contributions are welcome!
