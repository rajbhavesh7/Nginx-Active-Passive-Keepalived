#!/bin/sh

#/usr/sbin/service nginx start

/usr/sbin/keepalived -n -l -D -f /etc/keepalived/keepalived.conf --dont-fork --log-console &

nginx -g "daemon off;"
