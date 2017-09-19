# encoding
export LANG=ja_JP.UTF-8

# keybind
bindkey -e
bindkey "^F" forward-word
bindkey "^B" backward-word

# completion
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# options
setopt nonomatch
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt list_packed

# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
## history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# PROMPT
autoload -Uz colors
colors
[[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]] && PROMPT="%K{green}%n@%m%(!,#,$)%k " || PROMPT="%K{green}%n%(!,#,$)%k "
PROMPT2="> "
## git PROMPT
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "%F{green}%b%f:"
precmd () { vcs_info }
RPROMPT='[${vcs_info_msg_0_}%F{green}%~%f]'

# Alias
alias ls='ls -F'

#functions
function abspath() {
    echo $(cd $(dirname $1) && pwd)/$(basename $1)
}

# local settings
[[ -f ~/.zsh.d/local.zsh ]] && source ~/.zsh.d/local.zsh
