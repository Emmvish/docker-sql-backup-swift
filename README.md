These BASH scripts can be used to obtain SQL backup from a docker container that runs SQL on a Virtual Machine spawned by an OpenStack Setup, and upload this SQL backup to a container inside Swift Object Storage of OpenStack. 

backup-script.sh --> It creates a new SQL backup file at location /root/backups, by appending current date to the name of the backup file. It also compares the current backup file with the last backup file and if both the files are same then, last backup file is deleted.

remove-backups.sh --> This script creates an archive of the backups found in directory: /root/backups, deletes all but the last backup file at this location and then sends the archived backups to a certain Openstack host from which this backups archive can be uploaded to Swift Object Storage.

upload-backups-archive.sh --> This script must be installed on the OpenStack host that is being used to send the file to Swift Object Storage. It simply uploads the backup archive file to the desired Swift Container and removes it from location /home/USERNAME.

This process can also be automated using Crontab, for instance, I execute the backup-script.sh file everyday at 00:00 to obtain SQL backup and I execute the remove-backups.sh file on every Sunday, following which, I can execute upload-backups-archive.sh to upload the archive of backups onto some container in the Swift Object Storage.

NOTE: You must replace the UPPERCASE WORDS in the three scripts with your own credentials to use these scripts properly.