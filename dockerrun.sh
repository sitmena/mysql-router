ROUTER=web_router &&
docker run -p 6446:6446 -p 6447:6447 -p 6448:6448 -p 6449:6449 \
    -d --name web_prod_router  \
    -e CLUSTER_NAME=web_cluster \
    -e CLUSTER_ADMIN=root \
    -e CLUSETR_PASSWORD=PASSWORD \
    -e CLUSTER_MASTER=web_cluster \
    -e ROUTER=router \
    -e ROUTER_USER=root \
    -v /home/ubuntu/router/prod/web-app-vol/:/$ROUTER \
    prod_router:1.0 \
    --restart always