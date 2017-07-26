# Docker image with SSH server

* based on phusion base Docker image

includes
* ssh server
* docker.io client utility to connect to other docker containers on host



# Run

* build
```
docker build -t base-phusion-ssh github.com/maxivak/base-phusion-ssh
```

* run container
```
docker run -d --name my-ssh \
-p 8022:22 \
-v /var/run/docker.sock:/var/run/docker.sock \
base-phusion-ssh /sbin/my_init
```


* change root password
```
PASS='newpass'
echo -e "$PASS\n$PASS" | docker exec -i my-ssh passwd
```


* login by ssh
```
ssh -p 8022 root@localhost
```

enter root login and enter container


* access other Docker containers on the host
```
ssh -p 8022 root@localhost


root@145b03e2f6e7:~# docker ps

# see the list of docker container on the host

```
