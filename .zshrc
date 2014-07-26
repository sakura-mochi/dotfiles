###
###  .zshrc
###  z shell configration file
###  Version 1.5
###
###  Created by Teppei Kobayashi
###  Last Modified 2014/04/14
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
PROMPT=$'%F{magenta}%n@%m%f%}> '
SPROMPT=$'%UDid you mean%u : %F{red}%R%f -> %F{green}%r%f [n,y,a,e]'
RPROMPT=$'[%F{magenta}%39<...<% %~%f]'


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
## alias configuration
##
alias cd='pushd'
alias pd='popd'
alias mkdir='mkdir -p'
alias hd='cd ~/'
case ${OSTYPE} in
    darwin*)
        ;;
    linux*)
        alias open='xdg-open'
		alias pkill='ps aux | percol | awk '{ print $1 }' | xargs kill'
        ;;
esac


##
## binary alias configuration
##
case ${OSTYPE} in
    darwin*)
        alias screen='/usr/local/Cellar/screen/HEAD/bin/screen'
        ;;
    linux*)
        alias eclipse='/usr/local/eclipse/eclipse'
        ;;
esac


##
## history setting
##
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


##
## <ls> configuration
##
case ${OSTYPE} in
    darwin*)
        alias ls='ls -G'
        alias ll="ls -Gl"
        alias la="ls -GA"
        alias lla="ls -GlA"
        alias lal="lla"
        ;;
    linux*)
        alias ls='ls -G --color=auto'
        alias ll="ls -Gl"
        alias la="ls -GA"
        alias lla="ls -GlA"
        alias lal="lla"
        ;;
esac
### auto ls after cd
#function chpwd() { ls }


##
## <Emacs> configuration
##
case ${OSTYPE} in
    darwin*)
        alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
        alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
        alias e='emacsclient'
        ;;
    linux*)
        alias e='emacsclient'
        ;;
esac
### path enviroment variable link
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/cache/shellenv.el


###
### percol functions
###
function percol_select_history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N percol_select_history
bindkey '^r' percol_select_history
