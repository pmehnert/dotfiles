#
# ~/.bashrc
#

shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source envrionment variables
if [[ -f ~/.bashenv ]]; then
    source ~/.bashenv
fi

# Source envrionment variables
if [[ -f ~/.zshenv ]]; then
    source ~/.zshenv
fi

# Source alias definitions from ~/.bash-aliases
if [[ -f ~/.bash-aliases ]]; then
    source ~/.bash-aliases
fi

# Source alias definitions from ~/.bash-aliases
if [[ -f ~/.zsh-aliases ]]; then
    source ~/.zsh-aliases
fi

# Try sourcing the git prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
else
    PS1='[\u@\h \W]\$ '
fi

# Enable bash comletion
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# Enable git completion
if [[ -f /usr/share/git/completion/git-completion.bash ]]; then
    source /usr/share/git/completion/git-completion.bash
fi

# Source user specific completions
if [[ -d ~/.local/share/bash/completions ]]; then
    for file in ~/.local/share/bash/completions/*.sh; do
        source $file
    done
fi
