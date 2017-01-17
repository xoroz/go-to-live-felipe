#!/bin/bash
# Script to delete some file before codeploy-agent copy files
# Felipe Ferreira Jan/2017

if [ -d /var/www/lighttpd/project/ ]; then
  /bin/rm -rf /var/www/lighttpd/project/*
fi
if [ -f /etc/lighttpd/vhosts.d/project.felipeferreira.net.conf ]; then
  /bin/rm -f /etc/lighttpd/vhosts.d/project.felipeferreira.net.conf
fi
exit 0
