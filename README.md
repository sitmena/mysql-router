## Configuration

 - change x.x.x.x, y.y.y.y and z.z.z.z to DB IPs on the hosts file before buiding the docker image or on the k8s yaml deployment 
 - also hostnames on hosts and yaml must be identical to the real hostname on the db servers 
 - change primary dbs credentials on the yaml

## To run as docker 

```
ROUTER=edxapp_router
docker run -it --name mysql_router  \
    -e CLUSTER_NAME=clustername \
    -e CLUSTER_ADMIN=clusteradmin \
    -e CLUSETR_PASSWORD="changeme" \
    -e CLUSTER_MASTER=edxapp-db1 \
    -e ROUTER=router \
    -e ROUTER_USER=usr \
    -e ROUTER_RW_PORT=rw_port
    -e ROUTER_RO_PORT=ro_port
    -e ROUTER_RW_X_PORT=rw_x_port
    -e ROUTER_RO_X_PORT=ro_x_port
    -v /mnt/data/mysql-router:/$ROUTER \
    sitmenadev/mysql-router:1.0
```