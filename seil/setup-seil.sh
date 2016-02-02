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

printf "${COL_ON}[seil] begin\n${COL_OFF}"

SELF_PATH=$(cd $(dirname $0) && pwd -P)
#SELF_PATH=$(perl -e "use File::Spec;say STDOUT File::Spec->rel2abs('.');")

# for linux
# readlink -f

sh ${SELF_PATH}/seil-import.sh

printf "${COL_ON}[seil] end\n${COL_OFF}"

