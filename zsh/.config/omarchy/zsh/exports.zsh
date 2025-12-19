export TERM=xterm-256color
export GOPATH="$HOME/go"
export LD_LIBRARY_PATH="/usr/lib:$LD_LIBRARY_PATH"

paths=(
  "$HOME/.local/share/nvim/mason/bin"
  "$GOPATH/bin"
  "/bin"
  "/usr/local/bin"
  "/usr/bin"
)

PATH=$(
  IFS=":"
  echo "${paths[*]}"
)

export PATH
