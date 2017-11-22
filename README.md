# Dockerfile for Galera cluster

Docker build file for mariadb galera cluster based on official mariadb image.

You need to set environment `WSREP` to y for adding --wsrep-on=ON option to mysqld.

```
WSREP=y
```

## Sample config for cluster

You need to drop cluster setting into /etc/mysql/local.conf.d by volume mapping.

```
[galera]
wsrep_cluster_name = 'my-galera-cluster'
## Use following 2 lines to init cluster
#wsrep_new_cluster = 1
#wsrep_cluster_address = gcomm://
## Use this line for normal operation
#wsrep_cluster_address = gcomm://node-1.your.domain:4567,node-2.your.domain:4567,node-3.your.domain:4567
wsrep_sst_auth = 'root:your-password'
wsrep_node_name = node-1
wsrep_node_address = node-1.your.domain:4567
wsrep_node_incoming_address = node-1.your.domain:3306
```
