# readonly

```
type -a logger
man logger
logger 'Hello from the command line'
```

# getopt
```
type -a getopt
type -a getopts
```

# NUM
```
NUM=$(( 1+2 ))
echo $NUM
```

# bc
```
type -a bc
sudo yum install -y bc
bc -h
echo '6/4' | bc -l
awk 'BEGIN {print 6/4}'
NUM=$(( 6/4 ))
NUM=$(( 6%4 ))
DICEA='3'
DICEB='6'
TOTAL=$(( DICEA + DICEB ))
echo $TOTAL

NUM='1'
(( NUM ++ ))
echo $NUM

((NUM -- ))
echo ${NUM}


```

# let

```
type -a let
help let | less
let NUM='2+3'
echo ${NUM}
let NUM++
echo ${NUM}
```

# expr
```
type -a expr
expr 1 + 1
NUM=$((expr 2 + 3 ))
```

# userdel
userdel - delete a user account and related files

```
type -a userdel
locate userdel | grep bin

# Find files
sudo !!
ls -l /usr/sbin/userdel
find /usr/sbin/ -name userdel
find / -name userdel 2>/dev/null

sudo find / -name userdel

tail /etc/passwd
[root@27ae6411e476 ~]# sudo userdel einstein
userdel: user 'einstein' does not exist
# id einstein
id: einstein: no such user

#
ls -l /home

id -u root
# 0

id -u sshd
id -u
vi /etc/login.defs
id -u isaac
```

# tar
```
type -a tar
man tar
mkdir carvideos
touch catvideos/admiral-catbar.mp4
touch catvideos/darthpaw.mp4
touch catvideos/luke-claw-walker.mp4
tar -cf catvideos.tar catvideos
rm *tar
tar -cvf catvideos.tar catvideos/

mkdir restore
cd restore/
tar -xf ../catvideos.tar 
rm -rf c*
cd ..

tar -cvf catvideos.tar catvideos

gzip catvideos.tar
ls
gunzip catvideos.tat.gz
ls -l
rm *tar
tar -zcvf catvideos.tar catvideos/
sudo tar

```