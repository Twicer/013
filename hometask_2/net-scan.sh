#!/bin/bash

# Make the script exit if a control+C input has been received.
trap "exit" INT

for ipAddress in $@
do
	nc -zvn -w 1 $ipAddress 80 443 2>&1 | grep open
done

# how the script work
# if we want  check open port 80 and 443 for this ip address 172.217.20.{0..255}
# just run the script like ./net-scan.sh 172.217.20.{0..255} and press Enter
