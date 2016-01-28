#!/bin/bash

#============================= Settings ========================================

Obj=$1
Where=$2

while getopts s: OPT
do
	case $OPT in
		s) Sp="$OPTARG" ;;
	esac
done

#============================= Err_Test ========================================

if [ $# -lt 2 ]
then
	echo Plz_2_Arguments.
	clog ist Fail(NEA)
	exit 2
fi

#============================= Main ============================================

if [ -n "$Sp" ]
then
	if [ "$Sp" -eq "PF" ] || [ "$Sp" -eq "pf" ]
	then
		exit $(find $HOME/CjP)
	fi

else
	exit $(Find $Where/$Obj)
fi

clog ist Fail(Unknown:FinalProcess)
exit 2		#this_means_Error.
