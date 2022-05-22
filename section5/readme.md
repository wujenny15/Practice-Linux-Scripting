# cut
https://www.geeksforgeeks.org/cut-command-linux-examples/
```
# 
cut -c 4-7 state.txt
cut -c -4 state.txt
cut -c 5,3 state.txt
echo "nu" | cut -c 1
echo "nu" | cut -b 1
echo -e 'one\ttwo\tthree' | cut -f 1
echo -e 'one\ttwo\tthree' | cut -f 2
echo -e 'one\ttwo\tthree' | cut -f 3

echo -e 'one,two,three' | cut -d ',' -f 1
echo -e 'one,two,three' | cut -d ',' -f 2
echo -e 'one,two,three' | cut -d, -f 3

cut -d ":" -f 1,3 /etc/passwd
cut -d ":" -f 1,3 --output-delimiter="," /etc/passwd


```

# grep
```
echo 'first,last' > people.csv
echo 'john,smitt' >> people.csv
echo 'firstly,mclasty'>> people.csv

grep first people.csv
grep 'first,last' people.csv
grep '^first' people.csv
grep 'first' people.csv
grep 't$' people.csv
grep '^first,last$' people.csv

# -v will show the outputs do not match the pattern supplied
grep -v '^first,last$' people.csv

grep -v '^first,last$' people.csv | cut -d ',' -f 1

cut -d ',' -f 1 people.csv | grep -v '^first$'

```

# awk
```
cut -d ':' -f 2 people.data
cut -d 'DATA:' -F 2 people.data 
awk -F 'DATA:' '{print $2}' people.

# Compare with cut
cut -d ':' -f 1,3 state.txt
awk -F ':' '{print $1 $3}' state.txt
awk -F ':' -v OFS=',' '{print $1 , $3}' /etc/passwd
awk -F ':' '{print $1 ", " $3}' /etc/passwd
awk -F ':' '{print "COL1:" $1 " COL3:" $3}' /etc/passwd



awk '{print $1, $2}' lines
```

# netstat

```
# -n display numbers instead of the name
# -u display information for udp
# -t display information for tcp
# -l display listening ports
netstat -nutl

netstat -nutl | grep -v '^Active' | grep -v '^Proto'
netstat -nutl | grep -Ev '^Active|^Proto'
netstat -nutl | grep ':' | cut -d ':' -f 2
netstat -nutl | grep ':' | awk '{print $4}'
netstat -4nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $2}'
```