#!/bin/bash
passedFile=$1
if [ -d ~/TRASH ]
then
	:
else
	mkdir ~/TRASH
fi
find ~/TRASH/ -name *.tar.gz -type f -atime +2 -delete
if [ $passedFile ]
then
	if [ -f $passedFile ] || [ -d $passedFile ]
	then
		if file "$passedFile" | grep -q "gzip"
		then
			mv $passedFile ~/TRASH
		else
			tar czf $passedFile.tar.gz $passedFile
			mv $passedFile.tar.gz ~/TRASH
			rm $passedFile
		fi
	else
		echo "File not found"
	fi
else
	echo "Enter file name as input option"
fi
