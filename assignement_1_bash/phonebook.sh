#!/bin/bash
#set -x //enables debug
#set +x //disables debug

#Writing some comments


#sdfhsdfhsdhsdgh

tempName="hamada"
tempNumber="hamada"
delimiter="\t"
endline="\n"
if [ $# > 0 ]
then
	if [ -f database ]
	then
		echo Data base found
	else
		echo creating database
		touch database
	fi
	case $1 in
	"-i")
		read -p "Enter new name: " tempName
		read -p "Enter new number: " tempNumber
		echo -e $tempName$delimiter$tempNumber$endline >> database
		;;
	"-v")
		echo "These are all the saved numbers:"
		cat database
		;;
	"-s")
		read -p "Enter name of contact: " tempName
		if grep -q "^$tempName" database
		then
			echo found
			grep "^$tempName" database
		else
			echo Not found
		fi
		;;
	"-e")
		rm database
		echo all data base removed:
		;;
	"-d")
		read -p "Enter name to be deleted: " tempName
		if grep -q "^$tempName" database
		then
			sed -i_bak -e "/^$tempName/d" database
			echo Found and removed
		else
			echo Not found
		fi
		;;
	*)
		#echo all options
		echo '-i for inserting new recored'
		echo '-v for viewing all records'
		echo '-e for erasing all records'
		echo '-d for deleting certian record'
		echo '-s for searching '
	esac
else
	#echo all options
	echo '-i for inserting new recored'
	echo '-v for viewing all records'
	echo '-e for erasing all records'
	echo '-d for deleting certian record'
	echo '-s for searching '
fi
