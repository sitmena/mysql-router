#!/bin/bash
cat /tmp/hosts >> /etc/hosts 2>&1 
if [  -z "$(ls -A /$ROUTER)" ]; then
   /bootstrap.sh  2>&1 ;
fi

basedir=/$ROUTER

if [ `whoami` == 'root' ]; then
  ROUTER_PID=$basedir/mysqlrouter.pid /usr/bin/mysqlrouter -c $basedir/mysqlrouter.conf 
else
  sudo ROUTER_PID=$basedir/mysqlrouter.pid /usr/bin/mysqlrouter -c $basedir/mysqlrouter.conf --user=root 
fi



