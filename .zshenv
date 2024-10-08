#
# ~/.zshenv
#

export PATH="$HOME/.local/share/zig-linux-x86_64-0.10.1:$PATH"

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fpath=("$HOME"/.local/share/zsh/site-functions $fpath)

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export JAVA_HOME="/usr/lib/jvm/java"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

if hash ruby >/dev/null 2>&1; then
    PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
    export GEM_HOME=$HOME/.gem
fi

export ZDOTDIR="$HOME"

if [[ -n "$TMUX" ]]; then
    export TERM="tmux-256color"
else
    export TERM="xterm-256color"
fi

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

export PAGER=nvimpager
export PDFVIEW=evince
export IMAGEVIEW=eog

export FZF_DEFAULT_OPTS='--height 50% --multi'

export LANG=en_US.UTF-8

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export SESSION_TYPE='remote/ssh'
# many other tests omitted
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) export SESSION_TYPE='remote/ssh';;
    *) export SESSION_TYPE='local'
  esac
fi
