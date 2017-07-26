# Docker image with SSH server

* based on phusion base Docker image


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

* access other containers from this container
```
docker ps

```
