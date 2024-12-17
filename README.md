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

### Relevant Files
- [.zshrc](https://github.com/nicoalvarezz/dotfiles/blob/main/.zshrc)
- [alacritty.toml](https://github.com/nicoalvarezz/dotfiles/blob/main/.config/alacritty/alacritty.toml)

## Tmux
[Tmux](https://github.com/tmux/tmux/wiki) is my go-to terminal multiplexer for managing multiple terminal sessions efficiently. My tmux set up focuses on simplicity, productivity, and asthetics.

### Key Features
- **Mouse Support**: Eneabled for ease pane and window management
- **Vi Mode**: Configured for navigating using familiar Vim-style keybindings
- **Plugins for Enhanced Functionality**:
    - [tmp](https://github.com/tmux-plugins/tpm): Tmux Plugin Manager for managing and installing plugins
    - [tmux-yank](https://github.com/tmux-plugins/tmux-yank): Seamless copying to the system clipboard
    - [minimal-tmux-status](https://github.com/niksingh710/minimal-tmux-status): A clean, minimalistic status bar with customizable colors
- **Split Panes in the Current Directory**: Opening new panes inherits the current working direcotry for seamless navigation
- **Custom Keybidings**:
    - `Ctrl + b + f`: Quickly open a new sessions using `tmux-sessionizer`
    - `Ctrl + b + d`: Select session to be closed/deleted using `tmux-killer`

### Tmux Utilities

**tmux-sessionizer**
[tmux-sessionizer](https://github.com/nicoalvarezz/dotfiles/blob/main/.config/tmux/tmux-sessionizer) is a custom script that streamlines project navigation using Tmux sessions and fzf. It allows me to:

- **Quickly switch between projects**: Search for any project or directory within a specified path using the power of fzf.
- **Create sessions on the fly**: If no Tmux session exists for a selected directory, it creates one automatically in that path.
- **Seamlessly reuse sessions**: If a session for the directory already exists, it instantly switches to that session, saving time and avoiding duplicates.
This integration makes navigating large project trees effortless and boosts productivity by keeping my sessions organized.

Credits to [ThePrimeagen](https://www.youtube.com/c/theprimeagen)

**tmux-killer**
[tmux-killer](https://github.com/nicoalvarezz/dotfiles/blob/main/.config/tmux/tmux-killer) is a custom script designed for seamless management of Tmux sessions, integrating fzf for intuitive session selection and closure. It provides:

- **An overview of all active sessions**: Displays a list of currently open Tmux sessions for easy management.
- **Search and select functionality**: Use fzf to quickly find the session you want to close.
- **Effortless session cleanup**: Ideal for keeping your Tmux environment clean and organized, especially when tools like tmux-sessionizer leave behind a trail of open sessions after frequent switching.

To enhance usability, I’ve also set up an alias here for quick access to the script, bypassing the need for a keybinding.

This tool complements tmux-sessionizer by ensuring my Tmux workflow remains efficient and clutter-free.
