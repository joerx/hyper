NAME ?= $(shell git remote get-url origin | sed 's/\([^\/]*\).git$$/|\1/' | cut -d'|' -f2)
VERSION ?= $(shell git rev-parse --short HEAD)

build: out/$(NAME)

clean:
	rm -rf bin

out/$(NAME):
	go build -o bin/$(NAME)

test:
	go test ./...
