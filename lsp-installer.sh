#!/usr/bin/env bash
#
# Supports Linux (x86_64) and macOS (Apple Silicon).

set -euo pipefail

BIN="$HOME/.local/bin"
OPT="$HOME/.local/opt"
mkdir -p "$BIN" "$OPT"

case "$(uname -s)-$(uname -m)" in
  Linux-x86_64) xml=linux-x86_64 ;;
  Darwin-arm64) xml=osx-aarch_64 ;;
  *) echo "unsupported platform: $(uname -s)-$(uname -m)" >&2; exit 1 ;;
esac

# Latest release tag of a GitHub repo
latest() { curl -fsSI "https://github.com/$1/releases/latest" | tr -d '\r' | sed -n 's#^[Ll]ocation: .*/tag/##p'; }

# Lemminx (same on both platforms)
tag=$(latest redhat-developer/vscode-xml)
rm -rf "$OPT/lemminx" && mkdir -p "$OPT/lemminx"
curl -fL -o /tmp/lemminx.zip "https://github.com/redhat-developer/vscode-xml/releases/download/$tag/lemminx-$xml.zip"
unzip -qo /tmp/lemminx.zip -d "$OPT/lemminx" && rm /tmp/lemminx.zip
bin=$(find "$OPT/lemminx" -type f -name 'lemminx*' | head -n1)
chmod +x "$bin" && ln -sf "$bin" "$BIN/lemminx"

# Lua and Kotlin
if [[ "$(uname -s)" == Darwin ]]; then
  # https://brew.sh/
  brew install lua-language-server
  brew install --cask kotlin-lsp
else
  tag=$(latest LuaLS/lua-language-server)
  rm -rf "$OPT/lua-language-server" && mkdir -p "$OPT/lua-language-server"
  curl -fL "https://github.com/LuaLS/lua-language-server/releases/download/$tag/lua-language-server-$tag-linux-x64.tar.gz" \
    | tar -xz -C "$OPT/lua-language-server"
  ln -sf "$OPT/lua-language-server/bin/lua-language-server" "$BIN/lua-language-server"

  ver=$(latest Kotlin/kotlin-lsp); ver=${ver##*/v}
  rm -rf "$OPT/kotlin-lsp" && mkdir -p "$OPT/kotlin-lsp"
  curl -fL "https://download.jetbrains.com/language-server/kotlin-server/$ver/kotlin-server-$ver.tar.gz" \
    | tar -xz -C "$OPT/kotlin-lsp"
  ln -sf "$(find "$OPT/kotlin-lsp" -type f -name intellij-server -print -quit)" "$BIN/intellij-server"
fi

# npm (installed into ~/.local, no sudo)
npm install -g --prefix "$HOME/.local" \
  yaml-language-server \
  typescript typescript-language-server \
  pyright \
  bash-language-server \
  @actions/languageserver

# go
GOBIN="$BIN" go install github.com/docker/docker-language-server/cmd/docker-language-server@latest

ls -l "$BIN"
