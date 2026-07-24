#!/bin/bash

# npm
npm i -g \
	typescript typescript-language-server \
	pyright \
        gh-actions-language-server \
        bash-language-server \
        @microsoft/compose-language-service

# homebrew
# https://brew.sh/
brew install --cask kotlin-lsp
brew install lua-language-server \
  yaml-language-server \

# go
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest

