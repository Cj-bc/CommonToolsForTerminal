#!/bin/bash

#============================== Settings =======================================

if [ $(ist -Sp pf) -eq 1 ]
then
	echo Plz_add_Project_File.
	exit 1
fi

Obj=$1
Dir="$HOME/CjP/what"

#============================== Main ===========================================

if [ $# -eq 0 ]
then
	less $HOME/CjP/etc/CPs.data
	clog what Success
	exit 0
fi

if find $Dir/$Obj.wh
then
	less $Dir/$Obj.wh
	clog what Success
	exit 0
else
	echo No_Data.
	clog what Fail.ND
	exit 1
fi
