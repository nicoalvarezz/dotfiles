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

**Managing Windows**
1. Crete a new window: `Prefix + c` (shown at the bottom)
2. Switching between windows:
	- `Prefix + window number` (shown at the bottom - status bar)
	- Alternative - `Prefix + n` (next), `Prefix + p` (previous)
3. Closing a window: `Prefix + &`

**Managing Panes**
1. Splitting horizontally: `Prefix + "`
2. Splitting vertically: `Prefix + %`
3. Navigating between panes: `Prefix + arrow keys`
4. Swapping panes: `Prefix + { (open brace) or } (close brace)`
5. Zooming into a pane: `Prefix + z`
6. Turning a pane into a window: `Prefix + !`

**Managing Sessions**
1. Listing active sessions: `Prefix + s`
2. Previewing windows for each session: `Prefix + w`
3. Project navigation: `Prefix + f` (more on this in the next section)
4. Search and select sessions to be closed: `Prefix + d` (more on this in the next section)

**Copy and search text**
1. Copy mode:
	- begin selection: `Prefix + [`
	- selection move: `vim motions`
	- slection copy: `y`
	- exit selection: `<C-c>`
2. Search text:
	 - `Prefix + [` - Enables text mode to move the cursor around the output
	- `/` - Enables the search feature

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
