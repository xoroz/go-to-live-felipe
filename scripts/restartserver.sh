#!/bin/bash
echo "Re-Starting lighttpd" >> /var/log/cloud-init-cmd.log 2>&1
date >> /var/log/cloud-init-cmd.log 2>&1 
service lighttpd restart >> /var/log/cloud-init-cmd.log 2>&1
