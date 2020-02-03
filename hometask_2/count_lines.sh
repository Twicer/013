#!/bin/bash

#Download the versions.txt file if it doesn't exist
wget -q -nc http://yoko.ukrtux.com:8899/versions.txt

while IFS= read -r  file
do
	sort -fV  | uniq -cd | sort -gr | head -n 1
done < versions.txt
