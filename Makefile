.PHONY: build run clean

# Get the latest SHA from the repository
SHA := $(shell curl -s 'https://api.github.com/repos/dmorand17/dotfiles-bare/git/refs/heads/master' | jq -r '.object.sha')

# Default target
all: build

# Build the development container
build:
	docker build \
		--build-arg SHA=$(SHA) \
		-t dotfiles-test:latest .

# Run the development container interactively
run:
	docker run -it dotfiles-test /bin/bash

# Clean up containers and images
clean:
	docker rm $$(docker ps -a -q) || true
	docker image prune -f

# Help target
help:
	@echo "Available targets:"
	@echo "  build  - Build the development container"
	@echo "  run    - Run the container interactively"
	@echo "  clean  - Remove stopped containers and unused images"
	@echo "  help   - Show this help message" 
