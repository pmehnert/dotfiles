#
# ~/.zshrc
#

zstyle ':completion:*' completer _expand _complete _approximate _ignored _correct
zstyle ':completion:*' expand suffix
zstyle ':completion:*' format 'Complete %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit

HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Enable git completion
zstyle ':completion:*:*:git:*' script /usr/share/git/completion/git-completion.zsh

setopt PROMPT_SUBST

# Source oh-my-zsh configuration from ~/.oh-my-zsh-config
if [[ -f ~/.oh-my-zsh-config ]]; then
    source ~/.oh-my-zsh-config
fi

compinit -i
promptinit

# Enable zsh syntax highlighting
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Source user specific alias definitions from ~/.zsh-aliases
if [[ -f ~/.zsh-aliases ]]; then
    source ~/.zsh-aliases
fi

# Source user specific functions from ~/.zsh-functions
if [[ -f ~/.zsh-functions ]]; then
    source ~/.zsh-functions
fi

# if [[ -e ~/.local/bin/run-setup-script.sh ]]; then
#     source ~/.local/bin/run-setup-script.sh
# fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

