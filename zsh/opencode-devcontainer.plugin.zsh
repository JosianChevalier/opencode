# OpenCode devcontainer host client helpers.

_opencode_devcontainer_root() {
  local root
  root=$(command git rev-parse --show-toplevel 2>/dev/null) || root=$PWD
  print -r -- "$root"
}

_opencode_devcontainer_port() {
  local root devcontainer_json mapping port

  root="${1:-$(_opencode_devcontainer_root)}"
  devcontainer_json="$root/.devcontainer/devcontainer.json"

  if [ ! -f "$devcontainer_json" ]; then
    print -ru2 -- "No devcontainer config found at $devcontainer_json"
    return 1
  fi

  # OpenCode publish mapping in devcontainer.json:
  #   127.0.0.1:<host-port>:4096
  mapping=$(command grep -Eo '127\.0\.0\.1:[0-9]+:4096' "$devcontainer_json" | command head -n 1)

  if [ -z "$mapping" ]; then
    print -ru2 -- "No OpenCode publish mapping found in $devcontainer_json"
    return 1
  fi

  port="${mapping#127.0.0.1:}"
  print -r -- "${port%%:4096}"
}

_opencode_devcontainer_reload_server() {
  local root port url attempt

  root="$1"
  port="$2"
  url="http://127.0.0.1:$port/doc"

  if command curl --connect-timeout 1 --max-time 2 -sf "$url" >/dev/null 2>&1; then
    return 0
  fi

  command devcontainer exec --workspace-folder "$root" sh .devcontainer/bin/opencode-serve || return

  attempt=0
  while [ "$attempt" -lt 10 ]; do
    if command curl --connect-timeout 1 --max-time 2 -sf "$url" >/dev/null 2>&1; then
      return 0
    fi

    attempt=$((attempt + 1))
    sleep 1
  done

  print -ru2 -- "OpenCode server did not answer $url after reload"
  return 1
}

opencode-attach() {
  local root port

  root=$(_opencode_devcontainer_root) || return
  port=$(_opencode_devcontainer_port "$root") || return
  _opencode_devcontainer_reload_server "$root" "$port" || return

  command opencode attach "http://127.0.0.1:$port" "$@"
}

opencode-reload() {
  local root port

  root=$(_opencode_devcontainer_root) || return
  port=$(_opencode_devcontainer_port "$root") || return

  _opencode_devcontainer_reload_server "$root" "$port"
}

opencode-init() {
  local root

  root=$(_opencode_devcontainer_root) || return

  command devcontainer up --workspace-folder "$root" &&
    command devcontainer exec --workspace-folder "$root" zsh
}
