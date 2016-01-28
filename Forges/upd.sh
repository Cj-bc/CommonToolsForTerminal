#!/bin/bash

#=========================== Setting ===========================================

NewF=$1
To=$2

#=========================== Check Err =========================================

if [$# < 2]
then
	echo Plz_2_argument.
	clog upd Fail.NEA
	exit 1
fi

#=========================== Main ==============================================

if [ $(Find $HOME/CjP/CP/$To) -eq 0 ]
then
	cp $NewF $HOME/CjP/CP/$To

	if [$? -eq 0 ]
	then
		clog apd Success
		exit 0
	else
		clog apd Fail.MainProcess
		exit 1
	fi
fi
