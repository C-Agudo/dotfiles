
export TERM=xterm-256color

export GOPATH="$HOME/go"

paths=(
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
