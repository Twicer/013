#!/bin/bash

sudo apt-get update
sudo apt-get install  wget -y

wget -q -nc https://downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-7.3.1-x64.bin

chmod a+x atlassian-confluence-7.3.1-x64.bin

chmod 644 confluence_setup.varfile

sudo ./atlassian-confluence-7.3.1-x64.bin -q -varfile confluence_setup.varfile

sudo systemctl status confluence

