#!/bin/bash
ip=$(curl -s ipv6.tools.pwserv.net) # Get current IP
echo Current IP: $ip
IFS=':' read -r -a array <<< "$ip"   # Split at ':'

outip=${array[0]}:${array[1]}:${array[2]}:${array[3]}::  # Concat first 4 segments
echo Prefix: $outip
DIR=/var/run/nginx_fw/current_ip/
mkdir -p $DIR # Make directory for storing current ip
FILE=$DIR$outip
if [ -f "$FILE" ]; then
echo No new prefix. Not updating config
exit 0
fi
rm $DIR* # Clear old entries
touch $FILE # Store new ip 
NETMASK=64
sed -i "s/.*sedhint.*/        allow $outip\/$NETMASK; # sedhint/"  /etc/nginx/nginx.conf # Replace line in config with correct value
