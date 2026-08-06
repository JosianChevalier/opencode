#!/usr/bin/env sh
set -eu

plugin_name=opencode-devcontainer
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
plugin_source="$source_dir/zsh/$plugin_name.plugin.zsh"

if [ ! -f "$plugin_source" ]; then
  echo "Missing plugin source: $plugin_source" >&2
  exit 1
fi

if [ -n "${ZSH_CUSTOM:-}" ] && [ -d "$ZSH_CUSTOM/plugins" ]; then
  ohmyzsh_custom=$ZSH_CUSTOM
elif [ -d "$HOME/.oh-my-zsh/custom/plugins" ]; then
  ohmyzsh_custom="$HOME/.oh-my-zsh/custom"
else
  ohmyzsh_custom=
fi

if [ -n "$ohmyzsh_custom" ]; then
  target_dir="$ohmyzsh_custom/plugins/$plugin_name"
  mkdir -p "$target_dir"
  cp "$plugin_source" "$target_dir/$plugin_name.plugin.zsh"

  echo "Installed Oh My Zsh plugin: $target_dir"
  echo "Add '$plugin_name' to plugins=(...) in ~/.zshrc, then restart zsh."
else
  target_dir="${XDG_CONFIG_HOME:-$HOME/.config}/$plugin_name"
  mkdir -p "$target_dir"
  cp "$plugin_source" "$target_dir/$plugin_name.zsh"

  echo "Installed zsh helper: $target_dir/$plugin_name.zsh"
  echo "Add this to ~/.zshrc, then restart zsh:"
  echo "source \"$target_dir/$plugin_name.zsh\""
fi
