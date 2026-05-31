#!/bin/bash

# npm
npm i -g \
	typescript typescript-language-server \
	pyright

# yarn
yarn global add \
	yaml-language-server

# Custom
DOWNLOADS=$HOME/Downloads

# lua-language-server
# Check https://github.com/LuaLS/lua-language-server/releases for the latest version
LUA_LSP_DIR=$HOME/.local/share/lua-language-server
mkdir -p "$LUA_LSP_DIR"
curl -LO --output-dir "$DOWNLOADS" https://github.com/LuaLS/lua-language-server/releases/download/3.18.2/lua-language-server-3.18.2-linux-x64.tar.gz
tar -C "$LUA_LSP_DIR" -xzf "$DOWNLOADS/lua-language-server-3.18.2-linux-x64.tar.gz"
ln -s "$LUA_LSP_DIR/bin/lua-language-server" "$HOME/.local/bin/lua-language-server"

# kotlin-lsp
# Check https://github.com/Kotlin/kotlin-lsp/releases for the latest version
KOTLIN_LSP_DIR=/opt/kotlin-lsp
curl -LO --output-dir "$DOWNLOADS" https://download-cdn.jetbrains.com/kotlin-lsp/262.4739.0/kotlin-server-262.4739.0.tar.gz
sudo tar -C "$KOTLIN_LSP_DIR" -xzf "$DOWNLOADS/kotlin-server-262.4739.0.tar.gz"
chmod +x "$KOTLIN_LSP_DIR/bin/kotlin-lsp.sh"
sudo ln -s "$KOTLIN_LSP_DIR/bin/kotlin-lsp.sh" "$HOME/.local/bin/kotlin-lsp"
