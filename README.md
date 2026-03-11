# 🏠 Tyler's Dotfiles

> One command to rule them all.

## ⚡ Install

```bash
curl -fsSL https://raw.githubusercontent.com/tylerthebuildor/.dotfiles/main/install.sh | bash
```

## 📦 What's Inside

| File | Purpose |
|------|---------|
| `includes` | Sources everything below |
| `aliases` | Shortcuts for git, apps, and more |
| `functions` | Utility functions (`server`, `pushkey`, `shellfiles`, etc.) |
| `path` | PATH exports and environment variables |
| `install.sh` | Automated setup script |

## 🔧 Useful Commands

| Command | What it does |
|---------|-------------|
| `dotfiles` | Open this repo in VS Code |
| `ca [dir]` | Add directory to VS Code workspace and cd into it |
| `pushkey user@host` | Copy SSH public key to remote host |
| `server [port]` | Start HTTP server (default: 8000) |
| `shellfiles` | Show all shell config files and their contents |
| `path` | List PATH entries one per line |
| `fs [path]` | Show file or directory size |

## 🐚 Shell Config Files

A **login shell** runs when you first log in (SSH, opening Terminal.app). A **non-login shell** runs when you open a subshell. **Interactive** = you're typing commands. **Non-interactive** = a script is running.

| File | Shell | When it runs |
|------|-------|-------------|
| `~/.zshenv` | zsh | **Every** zsh invocation (login, non-login, scripts — always) |
| `~/.zprofile` | zsh | Login shells only (before `.zshrc`) |
| `~/.zshrc` | zsh | Interactive shells — **this is your main config** ⭐ |
| `~/.zlogin` | zsh | Login shells (after `.zshrc`) |
| `~/.bash_profile` | bash | Login shells only |
| `~/.bashrc` | bash | Interactive non-login shells |
| `~/.profile` | sh/bash | Login shells (bash reads this **only if** `.bash_profile` doesn't exist) |
| `/etc/paths` | macOS | System-wide PATH, read by `path_helper` at login |

> 💡 On macOS, Terminal.app and iTerm2 open login shells by default, so `.zprofile` and `.zshrc` both run every time you open a new tab. Since we're on zsh, `~/.zshrc` is the one that matters.
