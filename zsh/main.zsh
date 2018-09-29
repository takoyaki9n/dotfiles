# encoding
export LANG=ja_JP.UTF-8

# Path to this file
ZSHRC_DIR=`dirname $0`

# keybind
bindkey -e
bindkey "^F" forward-word
bindkey "^B" backward-word

# completion
autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select

# options
# setopt nonomatch
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt list_packed
setopt list_types

# PROMPT
autoload -Uz colors
colors
[[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]] && PROMPT="%n@%m%(!,#,$) " || PROMPT="%(!,#,$) "
PROMPT2="> "
## git PROMPT
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "%F{green}%b%f:"
precmd () { vcs_info }
RPROMPT='[${vcs_info_msg_0_}%F{green}%~%f]'

# history
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_space

# zplug
. $ZSHRC_DIR/zplug.zsh

# Alias
alias ls='ls -F'

#functions
. $ZSHRC_DIR/functions.zsh

# env
. $ZSHRC_DIR/env.zsh

# OS specific settings
if [[ $(uname) == 'Darwin' ]]; then
  # Mac
  . $ZSHRC_DIR/mac.zsh
elif [[ $(expr substr $(uname -s) 1 5) == 'Linux' ]]; then
  # Linux
  . $ZSHRC_DIR/linux.zsh
elif [[ $(expr substr $(uname -s) 1 10) == 'MINGW32_NT' ]]; then
  # Cygwin
fi

# local settings
[[ -f $HOME/.zsh.d/local.zsh ]] && . $HOME/.zsh.d/local.zsh