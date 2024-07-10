#!/bin/bash

# Prompt for database name
echo -n "Enter database name: "
read DB_NAME

# Prompt for database user
echo -n "Enter database user: "
read DB_USER

# Prompt for password
echo -n "Enter password: "
read -s DB_PASS
echo

# Prompt for output filename
echo -n "Enter output filename (with .sql extension): "
read OUTPUT_FILE

# Generate list of views to ignore
mysql -u $DB_USER -p$DB_PASS -N -e "SELECT TABLE_NAME FROM information_schema.VIEWS WHERE TABLE_SCHEMA='$DB_NAME';" > exclude_views.txt

# Prepare the ignore views string
IGNORE_VIEWS=""
while read -r view; do
    IGNORE_VIEWS="${IGNORE_VIEWS} --ignore-table=$DB_NAME.${view}"
done < exclude_views.txt

# Perform the dump excluding views
mysqldump -u $DB_USER -p$DB_PASS --no-data --skip-lock-tables --single-transaction $IGNORE_VIEWS $DB_NAME > $OUTPUT_FILE.sql

# Clean up
rm exclude_views.txt

echo "DDL statements have been exported to $OUTPUT_FILE"
