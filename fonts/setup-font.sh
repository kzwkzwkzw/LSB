#!/bin/sh

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
COL_ON="${ESC}${STR_COL_GREEN}${ESCEND}"
COL_OFF="${ESC}${ESCEND}"
COL_ALERT="${ESC}${STR_COL_RED}${ESCEND}"
COL_ALERT_OFF="${ESC}${ESCEND}"

printf "${COL_ON}[fonts] begin\n${COL_OFF}"

necessary_app=()
for r in "fontforge"
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

ENTITY_PATH=~/envfiles
if [ ! -d ${ENTITY_PATH} ]
then
	mkdir -p ${ENTITY_PATH}
fi

# SELF_PATH=$(cd $(dirname $0) && pwd -P)
#SELF_PATH=$(perl -e "use File::Spec;say STDOUT File::Spec->rel2abs('.');")

# for linux
# readlink -f

if [ ! -d ${ENTITY_PATH}/RictyDiminished-for-Powerline/ ]
then
	mkdir -p ${ENTITY_PATH}/RictyDiminished-for-Powerline/
	git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git ${ENTITY_PATH}/RictyDiminished-for-Powerline/
fi

cp -vf ${ENTITY_PATH}/RictyDiminished-for-Powerline/*ttf ~/Library/Fonts/
fc-cache -fv

printf "${COL_ON}[fonts] end\n${COL_OFF}"

