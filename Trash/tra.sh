#!bin/bash

#========================= Setting =============================================

Obj=$1
Type=$2

if [ $# -lt 2 ]
then
	echo Plz_2_Arguments.
	clog tra Fail.NEA
	exit 1
fi

#======================== Main =================================================

mv $Obj $HOME/Dustbox/$Type/$(echo $Obj | grep -o "[^/]*$")

if [ $? -eq 0 ]
then
	clog tra Success
	exit 0
else
	clog tra Fail.Final_process
	exit 1
fi
