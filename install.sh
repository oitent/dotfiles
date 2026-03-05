#!/usr/bin/env bash
# Dotfiles install script — symlinks all configs into place
# Run from ~/dotfiles: ./install.sh

set -e
DOTFILES="$( cd "$(dirname "$0")" && pwd )"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  BACKUP  $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "  LINKED  $dst"
}

echo ""
echo "==> Fish"
link "$DOTFILES/fish/config.fish"     "$HOME/.config/fish/config.fish"

echo ""
echo "==> Git"
link "$DOTFILES/git/.gitconfig"       "$HOME/.gitconfig"
link "$DOTFILES/git/.gitignore_global" "$HOME/.gitignore_global"

echo ""
echo "==> VSCode"
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_DIR"
link "$DOTFILES/vscode/settings.json" "$VSCODE_DIR/settings.json"

echo ""
echo "==> Zed"
ZED_DIR="$HOME/.config/zed"
mkdir -p "$ZED_DIR"
link "$DOTFILES/zed/settings.json"    "$ZED_DIR/settings.json"

echo ""
echo "==> Claude"
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$CLAUDE_DIR"
if [ -f "$DOTFILES/claude/settings.json" ]; then
  link "$DOTFILES/claude/settings.json" "$CLAUDE_DIR/settings.json"
fi

echo ""
echo "Done. Open a new terminal to apply fish changes."
