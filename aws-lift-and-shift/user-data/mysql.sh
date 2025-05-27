#!/bin/bash

DATABASE_PASS='admin123'
SQL_FILE="/opt/vprofile-project/src/main/resources/db_backup.sql"
LOG_FILE="/var/log/mysql-import.log"

# Install and start MariaDB
dnf update -y
dnf install -y git zip unzip mariadb105-server
systemctl start mariadb
systemctl enable mariadb

# Secure MariaDB and prepare DB
mysqladmin -u root password "$DATABASE_PASS"
mysql -u root -p"$DATABASE_PASS" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_PASS';"
mysql -u root -p"$DATABASE_PASS" -e "CREATE DATABASE IF NOT EXISTS accounts;"
mysql -u root -p"$DATABASE_PASS" -e "GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'localhost' IDENTIFIED BY 'admin123';"
mysql -u root -p"$DATABASE_PASS" -e "GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'%' IDENTIFIED BY 'admin123';"
mysql -u root -p"$DATABASE_PASS" -e "FLUSH PRIVILEGES;"

# Clone project repo
git clone -b main https://github.com/hkhcoder/vprofile-project.git /opt/vprofile-project

# Wait for SQL file and import
if [ -f "$SQL_FILE" ]; then
  mysql -u root -p"$DATABASE_PASS" accounts < "$SQL_FILE" 2>> "$LOG_FILE"
  mysql -u root -p"$DATABASE_PASS" -e "SHOW TABLES IN accounts;" >> "$LOG_FILE"
else
  echo "SQL file not found at $SQL_FILE" >> "$LOG_FILE"
  ls -l /opt/vprofile-project/src/main/resources/ >> "$LOG_FILE"
fi