docker build -t mykali .

docker run -it --net="host" --privileged --name aircrack mykali bash


docker exec -it aircrack bash


1) ifconfig at0 up

2) ifconfig at0 192.168.2.1/24

3) route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.2.1

4) nano /etc/dhcpd.conf 

5) dhcpd -cf /etc/dhcpd.conf -pf /var/run/dhcpd.pid at0

6) /etc/init.d/isc-dhcp-server start

7) echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain


8) iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUERADE

9) iptables --append FORWARD --in-interface at0 -j ACCEPT
