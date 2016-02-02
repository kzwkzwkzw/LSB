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

printf "${COL_ON}[bash] begin\n${COL_OFF}"

necessary_app=()
for r in "wget" "ln"
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

SELF_PATH=$(cd $(dirname $0) && pwd -P)
#SELF_PATH=$(perl -e "use File::Spec;say STDOUT File::Spec->rel2abs('.');")

# for linux
#readlink -f

cp -afv ${SELF_PATH}/.bash_profile ${ENTITY_PATH}/.bash_profile
cp -afv ${SELF_PATH}/.bashrc ${ENTITY_PATH}/.bashrc
wget -O ${ENTITY_PATH}/git-completion.bash -P ${ENTITY_PATH}/ https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget -O ${ENTITY_PATH}/git-prompt.sh -P ${ENTITY_PATH}/ https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
ln -snfv ${ENTITY_PATH}/git-completion.bash ~/.git-completion.bash
ln -snfv ${ENTITY_PATH}/git-prompt.sh ~/.git-prompt.sh
ln -snfv ${ENTITY_PATH}/.bash_profile ~/.bash_profile
ln -snfv ${ENTITY_PATH}/.bashrc ~/.bashrc

printf "${COL_ON}[bash] end\n${COL_OFF}"


