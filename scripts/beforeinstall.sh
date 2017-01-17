if [ -d /var/www/lighttpd/project/ ]; then
    rm -rf /var/www/lighttpd/project/*
fi
if [ -f /etc/lighttpd/vhosts.d/project.felipeferreira.net.conf ]
 rm -f /etc/lighttpd/vhosts.d/project.felipeferreira.net.conf
fi
