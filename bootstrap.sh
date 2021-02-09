#!/bin/bash
cat /tmp/hosts >> /etc/hosts 2>&1 
echo $CLUSETR_PASSWORD  | mysqlrouter --bootstrap $CLUSTER_ADMIN@$CLUSTER_MASTER:3306 --directory $ROUTER --user=$ROUTER_USER 2>&1 
#$ mysqlrouter --bootstrap clusteradmin@db1:3306 --directory myrouter --user=root
