#!/usr/bin/bash
httpd -v 2>&1 | awk -F '/' 'NR==1{print $2}' | awk '{print $1}'
cat /etc/httpd/conf/httpd.conf | grep ^Listen | awk '{print $2}'