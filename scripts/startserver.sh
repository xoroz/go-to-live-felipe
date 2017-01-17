#!/bin/bash
echo "Starting lighttpd" >> /var/log/cloud-init-cmd.log 2>&1
date >> /var/log/cloud-init-cmd.log 2>&1 
service lighttpd start >> /var/log/cloud-init-cmd.log 2>&1
