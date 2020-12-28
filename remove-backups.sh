#! /bin/bash
now=$(date +'%d-%m-%Y')
name="backup_$now.tar.gz"
tar -zcf $name backups
sshpass -p "SSHPASS" scp $name OPENSTACK_HOST:/home/USERNAME
rm $name
backup_list=( $(ls /root/backups) )
length=${#backup_list[@]}
for (( i=0; i<length; i++ ))
do
rm "/root/backups/${backup_list[i]}"
done
