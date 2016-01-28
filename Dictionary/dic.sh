#!/bin/bash

#=============================== Setting =======================================
Lang=$1
Word=$2
WorkDir="$HOME/CjP/Dic"

while getopts a:n:r: OPT
do
	case $OPT in
		a) Add="$OPTARG" ;;		#For_Add_new_LanguageFile
		n) Name="$OPTARG" ;;		#For_name_new_LanguageFile
		r) Reverse="$OPTARG" ;;		#For_search_from_contents
	esac
done

#=============================== Err_test ======================================

if [ -n "$Add" ] && [ $# -lt 2 ]
then
	echo Please_Enter_2_Arguments.
	clog dic Fail.NEA
	exit 1
fi

#=============================== Check_Options =================================

if [ -n "$Add" ]
then
	add $Add $WorkDir $Name
	if [ $? != 0]
	then
		echo Err.
		clog dic Fail.Add_Process
		exit 1
	fi
fi

#=============================== Main ==========================================

if find $WorkDir/$Lang > /dev/null 2>&1
then
	if find $WorkDir/$Lang/$Word.dic > /dev/null 2>&1
	then
		less $WorkDir/$Lang/$Word.dic
	else
		echo No_Toppic.
		clog dic Fail.ND:Toppic
	fi
else
	echo No_Dictionary.
	echo Please_add_it.
	clog dic Fail.ND:Dictionary
fi

exit 0
