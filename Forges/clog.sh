#!/bin/bash

CPName=$1
Status=$2

if [ $# -lt 2 ]
then
	echo Plz_more_Argument.
	clog clog Fail(NEA)
	exit 1
fi

#=============================== Main ==========================================

echo "$(date +%y%m%d-%H%M%s) : $CPName : $Status." >> ~/CjP/etc/log.data
if [ $? -eq 0 ]
then
	echo "$(date +%y%m%d-%H%M%s) : clog : Success." >> ~/CjP/etc/log.data
	exit 0
else
	echo "$(date +%y%m%d-%H%M%s) : clog : Fail." >> ~/CjP/etc/log.data
	exit 1
fi
