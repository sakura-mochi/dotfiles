###
###  .zshrc
###  z shell configration file
###  Version 1.0
###
###  Created by Teppei Kobayashi
###  Last Modified 2015/03/16
###


##
## Path environment variable(depand on OS)
##
export LANG=C
export LC_ALL=C

case ${OSTYPE} in
    darwin*)
        export PATH=$HOME/bin:/usr/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/texlive/2013/bin/universal-darwin
        export LSCOLORS=gxfxcxdxbxegedabagacad
        export EDITOR=emacsclient
        ;;
    linux*)
        export PATH=$HOME/bin:/usr/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/lib/jvm/java-8-oracle/bin
        eval $(dircolors -b ~/.dir_colors)
        export EDITOR=emacsclient
        export JAVA_HOME=/usr/lib/jvm/java-8-oracle
        export CLASSPATH=.:/usr/lib/jvm/java-8-oracle/lib
        ;;
esac


##
## Prompt settings
##
setopt prompt_subst
PROMPT=$'%F{yellow}%n@%m%f%}> '
SPROMPT=$'%UDid you mean%u : %F{red}%R%f -> %F{green}%r%f [n,y,a,e]'
RPROMPT=$'[%F{yellow}%39<...<% %~%f]'


##
## Option settings
##
setopt extended_glob
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt globdots
setopt no_beep
setopt no_list_beep
setopt no_list_types
setopt no_hup
setopt auto_pushd
setopt correct
setopt pushd_ignore_dups
setopt pushd_silent
setopt auto_menu
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt magic_equal_subst
setopt mark_dirs
setopt print_eight_bit
setopt no_flow_control
setopt always_last_prompt
setopt transient_rprompt


##
## General configuration
##
autoload -U compinit
compinit
autoload -U colors
colors
compdef _tex platex
compdef _dvi dvipdfmx
bindkey -e
umask 022
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'pi=33' 'ex=31' 'bd=34;46' 'cd=34;43' 'su=30;41' 'sg=30;46' 'tw=30;42' 'ow=30;43'


##
## history setting
##
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


##
## Another zsh configuration files
##

# zsh aliases
source $ZDOTDIR/.zaliases

# zsh functions
source $ZDOTDIR/.zfunction
