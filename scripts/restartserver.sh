#!/bin/bash
# Felipe Ferreira Jan/2017
LOG="/var/www/lighttpd/project/log/deploy-cmd.log"
echo -e "------------------\n\n\n" >> $LOG
date >> $LOG
echo "Re-Starting lighttpd" >> $LOG
service lighttpd restart >> $LOG
aws deploy list-deployments --application-name codedeploy_github --deployment-group-name test  |grep "d-"|sed 's/,//g' |head -n1 |xargs aws deploy batch-get-deployments --deployment-ids $1 >> $LOG
chown lighttpd. $LOG
echo "Auto Deploy from github project.felipeferreira.net" |/bin/mail -s "AutoDeploy from github" -a /var/www/lighttpd/project/log/deploy-cmd.log -r "felipe@mail.felipeferreira.net"  fel.h2o@gmail.com
exit 0
