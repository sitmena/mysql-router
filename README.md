
## MySQL Router

This project is meant to be all-in-one run to remove the burden of setting up a standalone
MySQL InnoDB cluter routing app, which in this case will be running as a Docker container.

Multiple routers can be created with the same project, just modify the `docker run` script 
file (see below) to get a new container of the router. 

This automation script runs the `docker build` & `docker run` functionalities on any remote
host that you can access from your local machine via `ssh`, and that remote host is assumed
to be new and clean, so the script handles its packages.

#####This project only supports Ubuntu remote hosts, and was tested on **Ubuntu 20**.

## Running the project

### Modify the following files according to needed values:

1. _hosts_ file for IP addresses and hostnames of the MySQL
InnoDB cluster
2. _dockerrun.sh_ script file for Docker environment variables
related to the MySQL InnoDB cluster
3. _startpoint_ script file for general values related to the
project automation

**NOTE that the volume directory name in the _dockerrun.sh_ 
and _startpoint_ must be identical.**

### Run the startpoint script as Bash

`./startpoint`