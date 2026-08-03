# zsh always reads ~/.zshenv from $HOME. Do not set ZDOTDIR here — that would
# make zsh look for .zprofile in $ZDOTDIR instead of ~/.zprofile.
[[ -f "$HOME/.config/zsh/.zshenv" ]] && source "$HOME/.config/zsh/.zshenv"
