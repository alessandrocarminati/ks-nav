#!/bin/sh
i=0;
while [ $i -le $2 ]; do 
	echo "stocazzo $i"; 
	sleep $1; 
	i=$(( i+ 1));
	done
