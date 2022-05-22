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

# sort

```
sort /etc/passwd
sort /etc/passwd | less

# revert the view of the source, use -r
sort -r /etc/passwd

# sort number
cut -d ":" -f 3 /etc/passwd | sort -n

# revert sort number
cut -d ":" -f 3 /etc/passwd | sort -n

sudo du /var | sort -n

# to display human readable disk size
sudo du -h /var | sort -n

netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -n | uniq
cat people.csv | sort | uniq

# understand how many duplicate values
cat people.csv | sort | uniq -c

wc /etc/passwd
wc -w /etc/passwd

grep bash /etc/passwd

grep bash /etc/passwd | wc -l

cat /etc/passwd | sort -t ':' -k 3 -n -r

cat people.csv | cut -d ',' -f2
cut -d ',' -f2 people.csv
cut -d '"' -f 2 access_log | cut -d ' ' -f 2 | sort | uniq -c | sort -n | tail -3
```

# Parsing logs
```
grep Failed syslog-sample | awk -F 'from ' '{print $2}' | cut -d ' ' -f 1
grep Failed syslog-sample | awk '{print $(NF -3)}' | sort | uniq -c
grep Failed syslog-sample | awk 'print $(NF -3)' | sort | uniq -c | sort -n
geoiplookup 182.100.67.59
```