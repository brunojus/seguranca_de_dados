FROM kalilinux/kali-linux-docker

RUN apt-get -y update && \
apt-get -y upgrade && \
apt-get install -y aircrack-ng pciutils && \
apt-get install net-tools && \
apt-get install isc-dhcp-server