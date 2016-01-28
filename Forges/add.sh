#!/bin/bash

#=========================== Setting ===========================================

FL=$1
To=$2

#=========================== Check Err =========================================

if [ $# -lt 2 ]
then
	ehco please_2_Arguments.
	clog add Fail(NEA)
	exit 1
fi

#=========================== Main ==============================================

cp $FL $To/$(echo $FL | grep -o "[^/]*$" | cut -d "." -f 1)

if [ $? -eq 0 ]
then
	echo Success.
	clog add Success
	exit 0
else
	echo Err.
	clog add Fail(cp_Err)
	exit 1
fi
