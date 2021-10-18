#!/bin/bash
cat /tmp/hosts >> /etc/hosts 2>&1 
# if [  -z "$(ls -A /$ROUTER)" ]; then
#    /bootstrap.sh  2>&1 ;
# fi

/bootstrap.sh  2>&1

basedir=/$ROUTER

if [ `whoami` == 'root' ]; then
  ROUTER_PID=$basedir/mysqlrouter.pid /usr/bin/mysqlrouter -c $basedir/mysqlrouter.conf 
else
  sudo ROUTER_PID=$basedir/mysqlrouter.pid /usr/bin/mysqlrouter -c $basedir/mysqlrouter.conf --user=root 
fi

# Add use_gr_notifications=1 to the router configuration
sed -i "s/cluster_type=gr/cluster_type=gr\\nuse_gr_notifications=1/g" $basedir/mysqlrouter.conf

$basedir/stop.sh && $basedir/start.sh
