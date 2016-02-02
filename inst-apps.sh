#!/bin/sh

# color
ESC="\e["
ESCEND="m"
STR_COL_BLACK="30"
STR_COL_RED="31"
STR_COL_GREEN="32"
STR_COL_YELLOW="33"
STR_COL_BLUE="34"
STR_COL_MAJENTA="35"
STR_COL_CYAN="36"
STR_COL_WHITE="37"
COL_ON="${ESC}${STR_COL_RED}${ESCEND}"
COL_OFF="${ESC}${ESCEND}"
COL_ALERT="${ESC}${STR_COL_RED}${ESCEND}"
COL_ALERT_OFF="${ESC}${ESCEND}"

printf "${COL_ON}Installing some applications by homebrew\n${COL_OFF}"

# assertion
necessary_app=()
for r in "brew"
do
	if [ -z `which $r` ]
	then
		necessary_app+=($r)
	fi
done
if [ ${#necessary_app[@]} -gt 0 ]
then
	printf "\n"
	printf "${COL_ALERT}"
	printf "${necessary_app[@]} is not installed.\n"
	printf "${COL_ALERT_OFF}"
	printf ""
	exit 1;
fi

# install
brew install lua
brew install ctags
brew install vim --with-lua
brew install wget
brew install fontforge

printf "${COL_ON}Done.\n${COL_OFF}"

