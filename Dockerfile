FROM ubuntu:20.04
ENV CLUSTER_ADMIN \
    CLUSETR_PASSWORD \
    CLUSTER_MASTER \
    ROUTER=router \
    ROUTER_USER

COPY ./hosts /tmp/hosts

ADD https://repo.mysql.com/apt/ubuntu/pool/mysql-apt-config/m/mysql-apt-config/mysql-apt-config_0.8.16-1_all.deb mysql-apt-config_0.8.16-1_all.deb 
RUN apt-get update; \
    apt-get -y install mysql-router mysql-client; \
    rm mysql-apt-config_0.8.16-1_all.deb; \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./bootstrap.sh /bootstrap.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN  chmod +x /bootstrap.sh &&  chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

