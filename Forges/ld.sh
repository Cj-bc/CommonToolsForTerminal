#!/bin/bash

#====================== Setting ================================================

FL=$1
Name=$( echo $FL | grep -o "[^/]*$" | cut -d "." -f 1 )

#======================= Set_Up ================================================

if $(find $HOME/CjP > /dev/null 2>&1 )
then
	if [$# -lt 2 ]
	then
		echo Plz_2_Arguments.
		clog ld Fail.NEA
		exit 1
	fi
else
	cp -R CjP $HOME/CjP 
	echo "export PAHT=$PATH:~/CjP/CP" >> ~/.bashrc
	echo "PATH:$PATH" > ~/CjP/etc/PCBackUp.data

#-------Register
	for foo in $(ls -l | grep -v "total" | grep -v "CjP" | cut -d " " -f 13)
	do
		cp $foo $HOME/CjP/CP/$(echo $foo | cut -d "." -f 1)
		echo $foo | cut -d "." -f 1 >> $HOME/CjP/etc/CPs.data
	done
	
	cp ld.sh $HOME/CjP/CP/ld
	echo ld >> $HOME/CjP/etc/CPs.data
fi

#========================= Main ================================================

cp $FL/*.sh /usr/bin/$Name		#Command_Activate

cp $FL/*.wh $HOME/CjP/what/$Name.wh	#what-text_Set
cp $FL $HOME/CjP/$Name			#Datas_Set
rm $HOME/CjP/*.sh $HOME/CjP/*.wh	#Delete_unwanted_File
echo $Name >> $HOME/CjP/etc/CPs.data

if [ $? -eq 0 ]
then
	echo success.
	clog ld Success
	exit 0
else
	echo "Err(FinalStep)"
	clog ld Fail.Final_process
	exit 1
fi


