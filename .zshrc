#
# ~/.zshrc
#

zstyle ':completion:*' completer _expand _expand_alias _complete _ignored _correct _approximate 
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

autoload -Uz compinit promptinit is-at-least

HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Enable git completion

setopt PROMPT_SUBST

export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh-custom
export UPDATE_ZSH_DAYS=7

plugins=(
    extract
    git
    vi-mode
    vundle
    zsh-syntax-highlighting
    rsync
    rust
    systemd
    zsh-autosuggestions
)

# Configure zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Configure zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
bindkey '^ ' autosuggest-accept

compinit -i
promptinit

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd j --hook pwd)"

# Source user specific alias definitions from ~/.zsh-aliases
[[ -f ~/.zsh-aliases ]] && source ~/.zsh-aliases
