#!/bin/bash
if [ ! -f /var/lib/mysql/ibdata1 ]; then
	mysql_install_db
fi

/usr/bin/mysqld_safe &


echo "create database metastore;" | mysql
echo "create user 'hive'@localhost identified by 'hive';" | mysql
echo "GRANT ALL ON metastore.* TO hive@'localhost' IDENTIFIED BY 'hive';"  | mysql
echo "flush privileges;" | mysql


echo "create database lens;" | mysql
echo "create user 'lens'@localhost identified by 'lens';" | mysql
echo "GRANT ALL ON lens.* TO lens@'localhost' IDENTIFIED BY 'lens';"  | mysql
echo "flush privileges;" | mysql
