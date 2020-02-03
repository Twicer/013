#!/bin/bash

# We assume that the script is runnned as root
# or with an user with admin privileges

cron_script=/etc/cron.weekly/auto_update

echo "#!/bin/bash" > $cron_script
echo "TODAY=\$(date +'%Y%m%d')" >> $cron_script
echo "(apt-get update && apt-get upgrade -y) &> /var/log/update-\$TODAY" >> $cron_script
chmod 755 /etc/cron.weekly/auto_update



