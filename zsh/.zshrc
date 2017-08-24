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

#git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

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
alias ls='ls -F'
alias allhist='history -E 1'

#load local settings
if [ -f ~/.zsh.d/local.zsh ]; then
    source ~/.zsh.d/local.zsh
fi
