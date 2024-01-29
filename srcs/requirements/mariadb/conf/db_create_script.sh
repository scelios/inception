#!/bin/bash

service mariadb start
#echo "UPDATE mysql.user SET authentication_string=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" | mysql
echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
#echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
#echo "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN}'@'%' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql
mysql -u root $MYSQL_DATABASE --force < /wordpress.sql
#rm -rf /wordpress.sql
# https://mariadb.com/kb/en/mariadb-environment-variables/   MARIA VARIABLES
