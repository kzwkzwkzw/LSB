
# color
ESC="\033["
ESCEND="m"
STR_COL_BLACK="30"
STR_COL_RED="31"
STR_COL_GREEN="32"
STR_COL_YELLOW="33"
STR_COL_BLUE="34"
STR_COL_MAJENTA="35"
STR_COL_CYAN="36"
STR_COL_WHITE="7"
ATRB_BOLD="1"
ATRB_LOW_ITENSITY="2"
ATRB_UNDERLINE="4"
ATRB_BLINK="5"
ATRB_REVERSE_VIDEO="7"
ATRB_INVISIBLE_TEXT="8"

# prompt
COL_PS1_TIME="${ESC}${ATRB_REVERSE_VIDEO};${STR_COL_WHITE}${ESCEND}"
COL_PS1_PATH="${ESC}${STR_COL_YELLOW}${ESCEND}"
COL_PS1_GIT_STATUS="${ESC}${STR_COL_CYAN}${ESCEND}"
COL_PS2_PROMPT="${ESC}${STR_COL_RED}${ESCEND}"
COL_OFF="${ESC}${ESCEND}"
if [ -f ~/.git-prompt.sh ]; then
	PS1="\[${COL_PS1_TIME}\]\$(date +%Y/%m/%d_W%V.%u_%H:%M)\[${COL_OFF}\]:\[${COL_PS1_PATH}\]\w\[${COL_OFF}\]\[${COL_PS1_GIT_STATUS}\]\$(__git_ps1)\[${COL_OFF}\]\$ "
else
	PS1="\[${COL_PS1_TIME}\]\$(date +%Y/%m/%d_W%V.%u_%H:%M)\[${COL_OFF}\]:\[${COL_PS1_PATH}\]\w\[${COL_OFF}\]\$ "
fi
PS2="\[${COL_PS2_PROMPT}\]>\[${COL_OFF}\] "

# get git status
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm)
	PROMPT_COMMAND='echo -e "\033]0;'"${USER}@${HOSTNAME%%.*}:"'${PWD}\007\c"'
	;;
esac

# alias
case "$(uname -s)" in
Darwin)
	echo 'Mac OS X'
	alias ls="ls -G"
	alias ll="ls -alG"
	alias la="ls -aG"
	;;
Linux)
	echo 'Linux'
	alias ls='ls --color'
	alias ll='ls -al --color'
	alias la='ls -a --color'
	;;
CYGWIN*|MINGW32*|MSYS*)
	echo 'MS Windows'
	alias ls='ls --show-control-chars --color'
	alias ll='ls --show-control-chars -al --color'
	alias la='ls --show-control-chars -a --color'
	;;
# Add here more strings to compare
# See correspondence table at the bottom of this answer
*)
	echo 'Unknown OS'
	;;
esac

# key bind
bind '"\C-P": history-search-backward'
bind '"\C-N": history-search-forward'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

