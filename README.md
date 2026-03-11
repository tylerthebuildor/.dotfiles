# Tyler's Dotfiles

## Quick Install

```
cd ~
git clone https://github.com/tylerbuchea/.dotfiles.git
~/.dotfiles/install.sh
```

## What it does

- Installs [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) if not already installed
- Clones this repo to `~/.dotfiles`
- Sources `~/.dotfiles/includes` from your `.zshrc`
- Sets zsh plugins: `git`, `z`

## Shell Config Files

A login shell runs when you first log in (e.g., SSH, opening Terminal.app). A non-login shell runs when you open a subshell (e.g., typing `bash` inside a terminal). Interactive means you're typing commands. Non-interactive means a script is running.

| File | Shell | When it runs |
|------|-------|-------------|
| `~/.zshenv` | zsh | **Every** zsh invocation (login, non-login, scripts — always) |
| `~/.zprofile` | zsh | Login shells only (before `.zshrc`) |
| `~/.zshrc` | zsh | Interactive shells (this is your main config) |
| `~/.zlogin` | zsh | Login shells (after `.zshrc`) |
| `~/.bash_profile` | bash | Login shells only |
| `~/.bashrc` | bash | Interactive non-login shells |
| `~/.profile` | sh/bash | Login shells (bash reads this **only if** `.bash_profile` doesn't exist) |
| `/etc/paths` | macOS | System-wide PATH, read by `path_helper` at login |

Bash splits login config (`.bash_profile`) and interactive config (`.bashrc`), so people end up sourcing `.bashrc` from `.bash_profile`. Zsh is simpler — `.zshrc` runs for all interactive shells whether login or not.

On macOS, Terminal.app and iTerm2 open login shells by default, so `.zprofile` and `.zshrc` both run every time you open a new tab. Since we're on zsh, `~/.zshrc` is the one that matters for day-to-day config.

## Explore

```
# Open dotfiles folder in VSCode
dotfiles
```
