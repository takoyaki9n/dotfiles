# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

#history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wataru/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt nonomatch
setopt correct
setopt auto_pushd
setopt extended_glob
setopt list_packed
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'

# PROMPT
PROMPT='%K{green}%n@localhost%#%k '
RPROMPT='[%F{green}%~%f]'
setopt transient_rprompt

# Color
#eval "$(dircolors -b)"
#if [ -n "$LS_COLORS" ]; then
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#fi
alias grep='grep --color=auto'

# Alias
alias rm="trash-put"
alias ls='ls -F'
alias xopen="xdg-open"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ocaml="ledit ocaml"
$ dentaku () {echo $(($@))}
$ py-c () {python -c "print($@)"}

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#node
if [ -s ~/.nvm/nvm.sh ]; then
source ~/.nvm/nvm.sh
nvm use v0.10.22 > /dev/null 2>&1
export NODE_PATH=${NVM_PATH}_modules
fi

#byobu
#if [ $SHLVL -eq 1 -a `which byobu` ];then
# byobu
#fi

# OPAM configuration
. /home/wataru/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config -env`

[ -s "/home/wataru/.k/kvm/kvm.sh" ] && . "/home/wataru/.k/kvm/kvm.sh" # Load kvm
