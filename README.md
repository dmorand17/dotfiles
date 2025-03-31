# 🚀 My personal dotfiles

## Summary

This repository contains my personal dotfiles configuration - a collection of customization files used to personalize my development environment across different machines. It includes shell configurations, git settings, aliases, and various utility functions. The setup is automated through a bootstrap script and supports local customizations through `.local` files.

Key features:

- 🔧 Automated setup via bootstrap script
- 🎨 Customizable local configurations
- 🪝 Pre-commit hooks for code quality
- 🐳 Docker support for testing
- 📦 Easy installation and management

Inspired by the dotfiles setup by [Ben Selby](https://github.com/benmatselby/dotfiles)

## 🏁 Getting Started

```bash
git clone https://github.com/dmorand17/dotfiles.git
./bootstrap
```

## 🌍 Localization

The following files can be customized for local deployment by creating a version with `.local` extension:

- .aliases
- .exports
- .functions

e.g. `.aliases.local`

Save exports, aliases, functions, etc in a `.extra` file. An example is below

```
###
### Git credentials
###

GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="email@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
```

## 🛠️ Development Setup

### 🪝 Pre-commit Hooks

We use pre-commit hooks to ensure code quality before commits. This includes shellcheck for shell script validation.

1. Install pre-commit:

```bash
# Using pip
pip install pre-commit

# Or using Homebrew on macOS
brew install pre-commit
```

2. Install shellcheck:

```bash
# On Ubuntu/Debian
sudo apt-get install shellcheck

# On macOS
brew install shellcheck

# On Windows (via scoop)
scoop install shellcheck
```

3. Install the pre-commit hooks:

```bash
pre-commit install
```

4. (Optional) Run the hooks against all files:

```bash
pre-commit run --all-files
```

The pre-commit configuration includes:

- shellcheck: Static analysis for shell scripts

To skip pre-commit hooks temporarily, use:

```bash
git commit -m "Your message" --no-verify
```

## 🧪 Testing

### 🏗️ Building and Running

The project includes a Makefile to simplify container management. Here are the available commands:

```bash
# Build the development container
make build

# Run the container interactively
make run

# Clean up containers and unused images
make clean

# Show all available commands
make help
```

When running the container, you can reload the shell if needed via `exec bash`.

### 🧹 Cleanup

Use the following command to clean up containers and prune unused images:

```bash
make clean
```

This will remove all stopped containers and clean up unused images.
