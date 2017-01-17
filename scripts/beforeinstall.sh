#!/bin/bash

if [ -d /var/www/lighttpd/project/ ]; then
    rm -rfv /var/www/lighttpd/project/*
fi
