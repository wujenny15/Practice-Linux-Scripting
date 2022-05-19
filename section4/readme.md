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