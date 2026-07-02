# Login shell settings (XDG, PATH, etc.) live in shell/profile.
[[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile" ]] && \
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile"
