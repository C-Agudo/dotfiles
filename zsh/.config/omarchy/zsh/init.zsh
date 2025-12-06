# Omarchy init adapted for Zsh
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi
if command -v try &> /dev/null; then
  eval "$(try init ~/Work/tries)"
fi
if command -v fzf &> /dev/null; then
  [[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
  [[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
fi
# ------------------------------------------------
# Starship prompt ALWAYS last
# ------------------------------------------------
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
