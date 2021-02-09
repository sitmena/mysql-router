## Configuration

 - change x.x.x.x, y.y.y.y and z.z.z.z to DBs IPs on the host file before buiding the docker image or on the k8s yaml deployment 
 - change primary dbs credentials on the yaml 

## To run as docker 

```
ROUTER=edxapp_router
docker run -it --name mysql_router  \
    -e CLUSTER_ADMIN=clusteradmin \
    -e CLUSETR_PASSWORD="changeme" \
    -e CLUSTER_MASTER=edxapp-db1 \
    -e ROUTER=edxapp_router \
    -e ROUTER_USER=root \
    -v /mnt/data/mysql-router:/$ROUTER \
    sitmenadev/mysql-router:1.0
```