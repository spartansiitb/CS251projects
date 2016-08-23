#!/bin/bash
for f in * 
	do 
		if [ "$(file --mime-type -b $f)" == "text/html" ]
			then
				mv $f $f.html
		elif [ "$(file --mime-type -b $f)" == "application/gzip" ]
			then
				mv $f $f.gz
		elif [ "$(file --mime-type -b $f)" == "image/jpeg" ]
			then
				mv $f $f.jpg
		elif [ "$(file --mime-type -b $f)" == "text/x-c" ]
			then
				mv $f $f.cpp		
		fi
	done
