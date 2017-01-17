#!/bin/bash
#script to restart lighttpd, get status of current deploy and send email
# Felipe Ferreira Jan/2017
LOG="/var/www/lighttpd/project/log/deploylog.html"
EMAILTO="fel.h2o@gmail.com"

if [ ! -f $LOG ]; then #if new file create html header
 echo "<html>" > $LOG
 echo "<script src='https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js'></script>" >>  $LOG
 echo "<body>" >> $LOG
fi
echo -e "<br><hr><br>" >> $LOG
echo "<pre class='prettyprint lang-txt  linenums:1'>" >> $LOG
date >> $LOG
echo "Re-Starting lighttpd" >> $LOG
service lighttpd restart >> $LOG
echo "</pre>" >> $LOG

echo "<pre class='prettyprint lang-mxml  linenums:1'>"  >> $LOG
/usr/bin/aws deploy list-deployments --application-name codedeploy_github --deployment-group-name test  |grep "d-"|sed 's/,//g' |head -n1 |xargs aws deploy batch-get-deployments --deployment-ids $1 >> $LOG
echo "</pre>" >> $LOG

chown lighttpd. $LOG
#Send an email 
echo "Auto Deploy from github http://project.felipeferreira.net" |/bin/mail -s "AutoDeploy from github" -a $LOG -r "felipe@mail.felipeferreira.net"  $EMAILTO
exit 0
