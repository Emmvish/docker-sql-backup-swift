#! /bin/bash
backup_list=( $(ls /root/snipeit-backups) )
length=${#backup_list[@]}
now=$(date +'%d-%m-%Y')
name="backup-${now}.sql"
docker exec CONTAINER_NAME /usr/bin/mysqldump -u root --password=PASSWORD DATABASE > "/root/backups/$name"
k=$(diff -U 0 "/root/backups/${backup_list[length-1]}" "/root/backups/$name" | grep -v ^@ | wc -l)
if [[ $k -eq 0 ]]
then
mv "/root/backups/${backup_list[length-1]}" "/root/backups/$name"
fi
