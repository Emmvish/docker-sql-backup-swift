#! /bin/bash
source emmvish-openrc
now=$(date +'%d-%m-%Y')
name="backup_$now.tar.gz"
mv "/home/USERNAME/$name" /root
swift upload CONTAINER_NAME "$name"
rm "$name"
