# My dotfiles 🚀
Welcome to my dotfiles repository! 🎨 These configuration files are the backbone of my development environment, optimised for productivity, customisation, and a streamlined workflow. This repository showcases how I configure and manage my terminal, Tmux, and more.

The dotfiles here are designed with flexibility and minimalism in mind, providing a cohesive and efficient experience across various tools. Feel free to explore, fork, or adapt them for your own use!

**IMPORTANT**: These are primarily meant for inspiration. I wouldn't just blindly use them.

## Terminal Set Up
The terminal is where I spend most of my time, so this setup focuses on speed, aesthetics, and ease of use.

I use [Alacritty](https://alacritty.org/), a lightweight and blazing-fast terminal emulator, configured for optimal performance and readability
You will also need to install extra CLI tools to fully use these configs: 
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- [fzf-git](https://github.com/junegunn/fzf-git.sh)
- [bat](https://github.com/sharkdp/bat)
- [delta](https://github.com/dandavison/delta)
- [eza](https://github.com/eza-community/eza)
- [tldr](https://github.com/tealdeer-rs/tealdeer)
- [thefuck](https://github.com/nvbn/thefuck)
- [zsh-syntax-highlight](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

### Ffz (command line fuzzy finder)
`fzf` is an absolute must, when building an environment set up. This command line will allow for fuzzy finding in the command line.

Install `fzf` with `homebrew`:

```bash
brew install fzf
```

To enable `fzf` key bindings and fuzzy completion, add the following to your `.zshrc`:

```bash
eval "$(fzf --zsh)"
```

Examples of wha you can do with it:

| Example                                       | Description                                      |
| --------------------------------------------- | ------------------------------------------------ |
| `CTRL-t`                                      | Look for files and directories                   |
| `CTRL-r`                                      | Look through command history                     |
| `ENTER`                                       | Select the item                                  |
| `CTRL-j` or `CTRL-n` or `Down arrow`          | Go down one result                               |
| `CTRL-k` or `CTRL-p` or `Up arrow`            | Go up one result                                 |
| `TAB`                                         | Mark a result                                    |
| `SHIFT+TAB`                                   | Unmark a result                                  |
| `cd **TAB`                                    | Open up fzf to find directory                    |
| `export **TAB`                                | Look for env variable to export                  |
| `unset **TAB`                                 | Look for env variable to unset                   |
| `unalias **TAB`                               | Look for alias to unalias                        |
| `ssh **TAB`                                   | Look for recently visited host names             |
| `kill -9 **Tab`                               | Look for process name to kill to get pid         |
| any command (like `nvim` or `code`) + `**TAB` | Look for files & directories to complete command |
#### Use fd with fzf
`fzf` by default uses the `find` command to look for files and directories.

Let's replace that with `fd` for better functionality.

Install `fd`:

```bash
brew install fd
```

Add the following to your `.zshrc` file

```bash
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
```
### Fzf-git
`fzf-git` is a powerful tool that integrates `fzf` with Git to provide intuitive key bindings for navigating Git objects. Each key binding enables you to browse specific types of Git objects and seamlessly select them for insertion into your command-line.

Navigate to your home directory, and clone the repo:

```bash
git clone https://github.com/junegunn/fzf-git.sh.git
```

| Keybind   | Description                         |
| --------- | ----------------------------------- |
| `CTRL-GF` | Look for git files with fzf         |
| `CTRL-GB` | Look for git branches with fzf      |
| `CTRL-GT` | Look for git tags with fzf          |
| `CTRL-GR` | Look for git remotes with fzf       |
| `CTRL-GH` | Look for git commit hashes with fzf |
| `CTRL-GS` | Look for git stashes with fzf       |
| `CTRL-GL` | Look for git reflogs with fzf       |
| `CTRL-GW` | Look for git worktrees with fzf     |
| `CTRL-GE` | Look for git for-each-ref with fzf  |

### Zsh utilities
**[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)**

It suggests commands as you type based on history and completions.

1. Install command:

```bash
brew install zsh-autosuggestions
```

2. To activate the autosuggestions, add the following at the end of your .zshrc:

```bash
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

**[zsh-syntax-highlight](https://github.com/zsh-users/zsh-syntax-highlighting)**

This package provides syntax highlighting for the shell zsh. It enables highlighting of commands whilst they are typed at a zsh prompt into an interactive terminal.

1. Install command:

```bash
brew install zsh-syntax-highlighting
```

2. Enable `zsh-syntax-highlight` by sourcing the script. Running this command on the terminal will add the source line to the end of your .zshrc:

```bash
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```


### Relevant Files
- [.zshrc](https://github.com/nicoalvarezz/dotfiles/blob/main/.zshrc)
- [alacritty.toml](https://github.com/nicoalvarezz/dotfiles/blob/main/.config/alacritty/alacritty.toml)

## Tmux
[Tmux](https://github.com/tmux/tmux/wiki) is my go-to terminal multiplexer for managing multiple terminal sessions efficiently. My tmux set up focuses on simplicity, productivity, and aesthetics.

### Key Features
- **Mouse Support**: Enabled for ease pane and window management
- **Vi Mode**: Configured for navigating using familiar Vim-style keybindings
- **Plugins for Enhanced Functionality**:
    - [tmp](https://github.com/tmux-plugins/tpm): Tmux Plugin Manager for managing and installing plugins
    - [tmux-yank](https://github.com/tmux-plugins/tmux-yank): Seamless copying to the system clipboard
    - [minimal-tmux-status](https://github.com/niksingh710/minimal-tmux-status): A clean, minimalistic status bar with customisable colours
- **Split Panes in the Current Directory**: Opening new panes inherits the current working directory for seamless navigation
- **Custom Keybidings**:
    - `Ctrl + b + f`: Quickly open a new sessions using `tmux-sessionizer`
    - `Ctrl + b + d`: Select session to be closed/deleted using `tmux-killer`

### Basic Usage
Once a tmux client is attached, any keys entered are forwarded to the program running in the active pane of the current window. For keys that control tmux itself, a special key must be pressed first - this is called the prefix key.

The default prefix key is `C-b`, which means the `Ctrl` key and `b`.

| **Category**             | **Action**                      | **Command**                                             |
| ------------------------ | ------------------------------- | ------------------------------------------------------- |
| **Managing Windows**     | Create a new window             | `Prefix + c` (shown at the bottom)                      |
|                          | Switch between windows          | `Prefix + window number` (status bar)                   |
|                          |                                 | `Prefix + n` (next), `Prefix + p` (previous)            |
|                          | Close a window                  | `Prefix + &`                                            |
| **Managing Panes**       | Split horizontally              | `Prefix + "`                                            |
|                          | Split vertically                | `Prefix + %`                                            |
|                          | Navigate between panes          | `Prefix + arrow keys`                                   |
|                          | Swap panes                      | `Prefix + {` (open brace) or `Prefix + }` (close brace) |
|                          | Zoom into a pane                | `Prefix + z`                                            |
|                          | Turn a pane into a window       | `Prefix + !`                                            |
| **Managing Sessions**    | List active sessions            | `Prefix + s`                                            |
|                          | Preview windows in each session | `Prefix + w`                                            |
|                          | Project navigation              | `Prefix + f` (more details in the next section)         |
|                          | Search and close sessions       | `Prefix + d` (more details in the next section)         |
| **Copy and Search Text** | Copy mode: Begin selection      | `Prefix + [`                                            |
|                          | Copy mode: Move selection       | vim motions                                             |
|                          | Copy mode: Copy selection       | `y`                                                     |
|                          | Copy mode: Exit                 | `<C-c>`                                                 |
|                          | Search text: Enable text mode   | `Prefix + [`                                            |
|                          | Search text: Start search       | `/`                                                     |

### Tmux Utilities
**tmux-sessionizer**
[tmux-sessionizer](https://github.com/nicoalvarezz/dotfiles/blob/main/.config/tmux/tmux-sessionizer) is a custom script that streamlines project navigation using Tmux sessions and fzf. It allows me to:

- **Quickly switch between projects**: Search for any project or directory within a specified path using the power of fzf.
- **Create sessions on the fly**: If no Tmux session exists for a selected directory, it creates one automatically in that path.
- **Seamlessly reuse sessions**: If a session for the directory already exists, it instantly switches to that session, saving time and avoiding duplicates.
This integration makes navigating large project trees effortless and boosts productivity by keeping my sessions organised.

Credits to [ThePrimeagen](https://www.youtube.com/c/theprimeagen)

**tmux-killer**
[tmux-killer](https://github.com/nicoalvarezz/dotfiles/blob/main/.config/tmux/tmux-killer) is a custom script designed for seamless management of Tmux sessions, integrating fzf for intuitive session selection and closure. It provides:

- **An overview of all active sessions**: Displays a list of currently open Tmux sessions for easy management.
- **Search and select functionality**: Use fzf to quickly find the session you want to close.
- **Effortless session cleanup**: Ideal for keeping your Tmux environment clean and organised, especially when tools like tmux-sessionizer leave behind a trail of open sessions after frequent switching.

To enhance usability, I’ve also set up an alias here for quick access to the script, bypassing the need for a keybinding.

This tool complements tmux-sessionizer by ensuring my Tmux workflow remains efficient and clutter-free.
