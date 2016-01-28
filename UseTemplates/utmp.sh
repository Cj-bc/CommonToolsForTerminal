#!/bin/bash

#======================= Set_Variables =========================================

Temp=$1
FName=$2
Dir="$HOME/CjP/Stmp/Temp"

while getopts a:n: OPT
do
	case $OPT in
		a) Add="$OPTARG" ;;
		n) Name="$OPTARG" ;;
	esac
done

#======================= Check_Option_and_err ==================================

if [ -n "$Add" ]
then
	add $Add $Dir/ $Name
fi

if [ $# -lt 2 ]
then
	echo Plz_2_Arguments.
	clog utmp Fail.NEA
	exit 1
fi

#======================= Main ==================================================

if find $Dir/$Temp > /dev/null 2>&1
then
	cp $Dir/$Temp ./$FName
	vi ./$FName
else
	echo Sorry,But_there's_no_Template_as_that.
	echo Plz_Add.
	clog utmp fail.ND:Template
	exit 1
fi

clog utmp Success
exit 0
