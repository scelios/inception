#!/bin/bash

service mariadb start
echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
mysql -u root $MYSQL_DATABASE --force < /wordpress.sql
# https://mariadb.com/kb/en/mariadb-environment-variables/   MARIA VARIABLES
