#!/bin/bash

sudo apt-get update
sudo apt-get install wget -y

sudo apt-get install mysql-server -y

sudo systemctl restart mysql
sudo systemctl enable mysql

wget https://cdn.mysql.com/archives/mysql-connector-java-8.0/mysql-connector-java_8.0.18-1ubuntu16.04_all.deb

sudo dpkg -i mysql-connector-java_8.0.18-1ubuntu16.04_all.deb

sudo systemctl restart mysql

echo "UPDATE mysql.user SET authentication_string=PASSWORD('123456') WHERE user='root';" >> setup.sql
echo "CREATE DATABASE IF NOT EXISTS CONFLUENCE;" >> setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '123456';" >> setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456';" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql

sudo mysql -u root < "setup.sql"

sudo systemctl restart mysql

sudo systemctl status mysql
