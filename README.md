# Linux Shell Scripting

## Get Started
```
docker run --rm -it \
    -v $(pwd)/script:/app \
    centos \
    bash

docker image build . -t wujenny15/centos 
docker run --rm -it \
   -v $(pwd)/section1:/app \
    wujenny15/centos \
    bash
```

## Permissions
```
ls -l

-rw-r--r--
```
The first three characters "rw-" represents the permissions of the owner of the file. The next three characters represents the permissions that that are granted to the group in the file.The last three characters represents the read permissions that everyone else who is not the vagrant user or in the file. 

chmod 755 demo1.sh

```
ls -l
-rwxr-xr-x 
```
rwx which is read, write and execute represents the permissions of the owner of the file. The next three is read exeucte for the group and read, execute that everyone else who is not the vagrant user or in the file.

Explanation: If you have read permission, you can look at the contents of the file. If you have write permissiom, that means you can change the contents of the file. If you have x permission, that means you can execute the file. Typically we want to rewrite and execute for ourselved and read and execute for other people.

### Where does 755 comes from
r=4, w =2, x=1
7= 4+2+1 (r+w+x)
5= 5+1 (r+x)

### Execute the script
```
./demo1.sh
```

### Create a file
```
touch blah.sh
```

### Check Shell Builtin
```
> type echo
echo is a shell builtin
> type -a echo

> help echo
```

### Check non Builtin
```
[root@695500a03727 app]# uptime
 01:04:27 up  9:12,  0 users,  load average: 0.08, 0.20, 0.45
[root@695500a03727 app]# type -a uptime
uptime is /usr/bin/uptime
uptime is /bin/uptime
[root@695500a03727 app]# help uptime
bash: help: no help topics match `uptime'.  Try `help help' or `man -k uptime' or `info uptime'.
[root@695500a03727 app]# man uptime
bash: man: command not found

```

## Read Standard Input, Create accounts, Username conventions.
```
type read
type -a read
help read
```

```
read -p 'Type something:' THING
echo $THING
```

### Add a new user
```
sudo useradd dougstamper
sudo su - dougstamper
```


### Create Password
