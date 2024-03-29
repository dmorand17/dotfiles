# dotfiles

My dotfiles setup for bootstrapping machines.

Inspired by the dotfiles setup by [Ben Selby](https://github.com/benmatselby/dotfiles)

## Getting Started

```bash
git clone https://github.com/dmorand17/dotfiles.git
./install.sh
```

## Customizing

The following files can be customized for local settings by creating another version with `.local` extension:
* .aliases
* .exports
* .functions

e.g. `.aliases.local`

Save exports, aliases, functions, etc in a `.extra` file.  An example is below
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

## Testing

Run `test.sh` to check for shellcheck errors

### Building Image

```bash
docker build --build-arg SHA=$(curl -s 'https://api.github.com/repos/dmorand17/dotfiles-bare/git/refs/heads/master' | jq -r '.object.sha') -t dotfiles-test:latest .

# Or build using a specific branch
docker build --build-arg BRANCH=main --build-arg SHA=$(curl -s 'https://api.github.com/repos/dmorand17/dotfiles-bare/git/refs/heads/master' | jq -r '.object.sha') -t dotfiles-test:latest .
```

### Running dotfiles-tester

```bash
docker run -it dotfiles-test /bin/bash
```

When necessary reload the shell via `exec bash`

### Cleanup

docker rm $(docker ps -a -q)
docker image prune

### Makefile

A docker image can be created to be used to test.

| Command                                        | Description                                |
| ---------------------------------------------- | ------------------------------------------ |
| `make -f Makefile-test test [BRANCH='branch']` | Build an image. Default branch is `main` |
| `make -f Makefile-test clean`                  | clean any unused images/containers         |
