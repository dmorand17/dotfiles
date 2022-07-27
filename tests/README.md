# Testing

## Building Image
```bash
docker build --build-arg SHA=$(curl -s 'https://api.github.com/repos/dmorand17/dotfiles-bare/git/refs/heads/master' | jq -r '.object.sha') -t dotfiles-test:latest .

# Or build using a specific branch
docker build --build-arg BRANCH=main --build-arg SHA=$(curl -s 'https://api.github.com/repos/dmorand17/dotfiles-bare/git/refs/heads/master' | jq -r '.object.sha') -t dotfiles-test:latest .
```

## Running dotfiles-tester
```bash
docker run -it dotfiles-test /bin/bash
```
When necessary reload the shell via `exec bash`

## Cleanup
docker rm $(docker ps -a -q)
docker image prune

## Makefile 
A docker image can be created to be used to test.

| Command     | Description |
| ----------- | ----------- |
| `make -f Makefile-test test [BRANCH='branch']`| Build an image.  Default branch is `master` |
| `make -f Makefile-test clean`| clean any unused images/containers |
