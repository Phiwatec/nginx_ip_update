# nginx_ip_update
Simple script to update the allowed ips depending on the current subnet.  
It looks up the current ip and then replaces the respective line in the nginx.conf file.  
**The #sedhint comment is important as an anchor in the file.**
## Example part of nginx.conf
```
allow 192.168.14.0/24;
allow 2001:XXXX:YYYY:ZZZZ::/64; #example for static subnet
allow 2a02:AAAA:BBBB:CCCC::/64; # sedhint  Example for dynamic subnet
allow 172.0.0.0/16;
```
