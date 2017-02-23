#!/bin/bash
# Simple script to backup MySQL databases

# Parent backup directory
backup_parent_dir="/mnt/data/backups/devapi/mysql"

# MySQL settings
mysql_user="myuser"
mysql_password="dbpass"
mysql_server="myserver.local"

# Create backup directory and set permissions
backup_date_day=$(date +%Y%m%d)
backup_date_month=$(date +%Y%m)
#backup_dir="${backup_parent_dir}/${backup_date}"

mkdir -p "${backup_parent_dir}/daily"
chmod 775 "${backup_parent_dir}/daily"

mkdir -p "${backup_parent_dir}/monthly"
chmod 775 "${backup_parent_dir}/monthly"

#
database='mydb'
filename_base="${backup_parent_dir}/${database}.sql.gz"

echo "Creating backup of \"${database}\" database"
mysqldump ${additional_mysqldump_params} --host=${mysql_server} --user=${mysql_user} --password=${mysql_password} ${database} | gzip > "${filename_base}.gz"
chmod 775 "${filename_base}.gz"

# copy daily
cp -f "${filename_base}.gz" "${backup_parent_dir}/daily/${database}-${backup_date_day}.gz"

# copy monthly
cp -f "${filename_base}.gz" "${backup_parent_dir}/monthly/${database}-${backup_date_month}.gz"


# delete old backups
cd ${backup_parent_dir}/daily
n=30
(ls -t|head -n $n;ls)|sort|uniq -u|xargs rm

cd ${backup_parent_dir}/monthly
n=12
(ls -t|head -n $n;ls)|sort|uniq -u|xargs rm

#ls -tr | head -n -5 | xargs rm

#forfiles /p D:\mysql_daily_backups /s /m *.* /d -3 /c "cmd /c del @file : date >= 3days"

#Delete backups older than 7 days
#find ${backup_parent_dir} -name '*' -type d -mtime +6 -exec rm -rfv "{}" \;
