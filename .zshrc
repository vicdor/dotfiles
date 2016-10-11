# Keep history, searchable across mutliple systems
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory incappendhistory 

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:warnings' format '%BNo matches for : %d%b'
setopt correctall
# Include the rescomp scripts in the path by default
export PATH="$PATH:/usr/local/rescomp/bin:/usr/local/rescomp/sbin"

# Include sbins
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"

# cd without typing 'cd'
setopt autocd
# powerful globs
setopt extendedglob

# make the noise stop 
unsetopt beep
# wait until current command is finished to inform about background jobs
unsetopt notify
# error if a glob has no match instead of running the command with the glob
setopt nomatch

# vi keybindings
bindkey -v
# 'Home' key
bindkey -M viins "\e[H" beginning-of-line
bindkey -M vicmd "\e[H" beginning-of-line
# 'End' key
bindkey -M viins "\e[F" end-of-line
bindkey -M vicmd "\e[F" end-of-line

# The following lines were added by compinstall
zstyle :compinstall filename '/home/nbaldwin/.zshrc'

autoload -Uz compinit
compinit -d ~/.zcompdump.`hostname -s`
# End of lines added by compinstall

# Stolen from http://blogs.noname-ev.de/commandline-tools/archives/6-Pimping-zsh-prompt-with-colors.html
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
export PROMPT="$PR_CYAN%n@%m $PR_BLUE%~ %# $PR_NO_COLOR"

# From http://www.semicomplete.com/blog/2006/Jun/29
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\e]2;$a @ $2\a" # plain xterm title
    print -Pn "\ek$a\e\\"      # screen title (in ^A")
    print -Pn "\e_$2\e\\"   # screen location
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$a @ $2\a" # plain xterm title
    ;;
  esac
}

# precmd is called just before the prompt is printed
function precmd() {
  title "zsh" "%m(%55<...<%~)"
}

# preexec is called just before any command line is executed
function preexec() {
  title "$1" "%m(%35<...<%~)"
}

# system-wide aliases
# We like ls with colors, but it's different on FreeBSD vs Linux
if [[ $OSTYPE == freebsd* || $OSTYPE == darwin* ]] ; then
	DIR=Ex
	SYM_LINK=Fx
	SOCKET=Fx
	PIPE=dx
	EXE=Cx
	BLOCK_SP=Dx
	CHAR_SP=Dx
	EXE_SUID=hb
	EXE_GUID=ad
	DIR_STICKY=Gx
	DIR_WO_STICKY=Gx
	export LSCOLORS="$DIR$SYM_LINK$SOCKET$PIPE$EXE$BLOCK_SP$CHAR_SP$EXE_SUID$EXE_GUID$DIR_STICKY$DIR_WO_STICKY"
        alias ls='ls -G'

elif [[ -n $LS_COLORS ]] ; then    
        alias ls='ls --color'
else
	alias ls='ls -F'
fi

export EDITOR="vim"
export VISUAL="vim"

# Aliases and functions
fpath=(~/.zfunctions $fpath)
# autoload -U ${fpath[1]}/*~${fpath[1]}/*.zwc(:t)
[ -f ~/.aliases ] && source ~/.aliases

# CDPATH
cdpath=(. ~)
# Named directories (so they show up as ~tmp instead of abs paths)
tmp=/tmp/$USERNAME
[ -d $tmp ] && : ~tmp
conf=~/src/conf
[ -d $conf ] && : ~conf 
ports=/tmp/$USERNAME/ports
[ -d $ports ] && : ~ports
ule=/usr/local/etc
[ -d $ule ] && : ~ule
ulr=/usr/local/rescomp
[ -d $ulr ] && : ~ulr
sysadmin=~/src/sysadmin
[ -d $sysadmin ] && : ~sysadmin
pup=~/puppet/modules
[ -d $pup ] && : ~pup

bindkey -M viins OF end-of-line

if [[ $OSTYPE = darwin* ]] ; then # Mac OS X is generally case-insensitive
	unsetopt caseglob
fi
#make backspace work not stupidly.
bindkey '^?' backward-delete-char
# vim :ts=4:ft=zsh

PR_NO_COLOR="%{$terminfo[sgr0]%}"
export PROMPT="$PR_CYAN%n[%*]%~ %# $PR_NO_COLOR"
export PATH=$PATH:/opt/bin
setopt auto_cd
setopt menu_complete
source ~/.zshtra

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
