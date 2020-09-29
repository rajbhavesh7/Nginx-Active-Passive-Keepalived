# Docker ubuntu-nginx-keepalived Demo
A small demo to run two ubuntu containers with nginx webserver service in active-passive mode by using keepalived. 

This demo is made to simulate a scenario with two running nginx servers, one as a master and another as a backup, in order to achieve high availability. 

## Run command

```
docker-compose up -d
```

Now, visit `localhost:8000` and you would see `hello I'm master!`. 

```
$ docker ps -a
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                            PORTS                    NAMES
3c3cf32e89a5        ubuntu-nginx-keepalived_keepalived_backup   "sh /entrypoint.sh"      7 seconds ago       Up 5 seconds                      0.0.0.0:8881->80/tcp     ubuntu-nginx-keepalived_keepalived_backup_1
b3eb005c3ebd        haproxy:1.7-alpine                          "/docker-entrypoint.…"   7 seconds ago       Up 5 seconds                      0.0.0.0:8000->6301/tcp   ubuntu-nginx-keepalived_proxy_1
23c5f89e6a82        ubuntu-nginx-keepalived_keepalived_master   "sh /entrypoint.sh"      7 seconds ago       Up 5 seconds                      0.0.0.0:8880->80/tcp     ubuntu-nginx-keepalived_keepalived_master_1
```

Run pause command to pause master: 
```
$ docker pause ubuntu-nginx-keepalived_keepalived_master_1
```

Now, visit `localhost:8000` and you should see `hello I'm backup!`. 

You can unpause master again to bring it back,
```
$ docker unpause ubuntu-nginx-keepalived_keepalived_master_1
```

Visit `localhost:8000` and you should see `hello I'm master!` again. 