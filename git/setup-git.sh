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

printf "${COL_ON}[git] begin\n${COL_OFF}"

ENTITY_PATH=~/envfiles

if [ ! -d ${ENTITY_PATH} ]
then
	mkdir -p ${ENTITY_PATH}
fi

SELF_PATH=$(cd $(dirname $0) && pwd -P)
#SELF_PATH=$(perl -e "use File::Spec;say STDOUT File::Spec->rel2abs('.');")

# for linux
# readlink -f

cp -afv ${SELF_PATH}/.gitconfig  ${ENTITY_PATH}/.gitconfig
ln -snfv ${ENTITY_PATH}/.gitconfig ~/.gitconfig

printf "${COL_ON}[git] end\n${COL_OFF}"

