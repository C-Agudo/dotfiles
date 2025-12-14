#############################################
#  Zim initialization
#############################################
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Initialize Zim if init.zsh is missing or outdated
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi

# Load Zim modules
source ${ZIM_HOME}/init.zsh

#############################################
#  History configuration
#############################################
HISTFILE=~/.zsh_history        # File to store command history
HISTSIZE=100000                # Number of commands in memory
SAVEHIST=100000                # Number of commands to save on disk

setopt inc_append_history       # Append commands immediately to the history file
setopt share_history            # Share history across sessions
setopt hist_reduce_blanks       # Remove extra blanks in commands
setopt HIST_IGNORE_ALL_DUPS     # Ignore duplicate commands

#############################################
#  Input / Keybindings
#############################################
bindkey -e                     # Use Emacs keybindings
WORDCHARS=${WORDCHARS//[\/]}   # Remove '/' from WORDCHARS for completion

# Zsh-history-substring-search (up/down in history by substring)
zmodload -F zsh/terminfo +p:terminfo
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

#############################################
#  Optional Zim module configuration
#############################################

# Git module
# Uncomment to set a custom prefix for git aliases
# zstyle ':zim:git' aliases-prefix 'g'

# Input module
# Append '../' to input for each '.' typed after initial '..'
# zstyle ':zim:input' double-dot-expand yes

# Termtitle module
# Set custom terminal title format
# zstyle ':zim:termtitle' format '%1~'

# zsh-autosuggestions
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
# typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# Disable Zim prompt wrapping
ZIM_DISABLE_PROMPT_WRAPPING=1

#############################################
#  Load Omarchy Zsh configuration (user overrides via stow)
#############################################
OMARCHY_ZSH_CONFIG="$HOME/.config/omarchy/zsh"

# init.zsh (adapted to Zsh: mise, starship, zoxide, try, fzf)
if [[ -f "$OMARCHY_ZSH_CONFIG/init.zsh" ]]; then
  source "$OMARCHY_ZSH_CONFIG/init.zsh"
fi

# aliases
if [[ -f "$OMARCHY_ZSH_CONFIG/aliases.zsh" ]]; then
  source "$OMARCHY_ZSH_CONFIG/aliases.zsh"
fi

# functions
if [[ -f "$OMARCHY_ZSH_CONFIG/functions.zsh" ]]; then
  source "$OMARCHY_ZSH_CONFIG/functions.zsh"
fi

# envs
if [[ -f "$OMARCHY_ZSH_CONFIG/envs.zsh" ]]; then
  source "$OMARCHY_ZSH_CONFIG/envs.zsh"
fi

if [[ -f "$OMARCHY_ZSH_CONFIG/exports.zsh" ]]; then
  source "$OMARCHY_ZSH_CONFIG/exports.zsh"
fi


#############################################
#  Editor & PATH
#############################################
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PATH="$HOME/.local/bin:$PATH"

#############################################
#  Autocompletion
#############################################
# Only run compinit if not already loaded
if ! type compinit &>/dev/null || ! (( $+functions[compinit] )); then
  autoload -Uz compinit
  compinit
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
fi

#############################################
#  Miscellaneous options
#############################################
setopt auto_cd        # Enter directories by just typing the name
setopt prompt_subst   # Enable prompt substitution
