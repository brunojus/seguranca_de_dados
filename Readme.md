# Para quem for rodar o ambiente em docker deve seguir esses passos

- docker build -t mykali .

- docker run -it --net="host" --privileged --name aircrack mykali bash


- docker exec -it aircrack bash


# Esses comandos são necessários a partir do slide 42

> Esse comando server para inciar a interface de rede que foi criada a partir da rede wi-fi
1) ifconfig at0 up 

> É necessário atrelar um endereço IP a essa interface
2) ifconfig at0 192.168.2.1/24

> Adicionamos essas informações em nossa tabela de rotas
3) route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.2.1
> Deve-se editar esse arquivo e copiar e colar arquivo disponibilizado nesse repositório
4) sudo nano /etc/dhcpd.conf 

> Nessa etapa estamos configurando o servidor DHCP, pode-ser que aconteça algum erro relacionado a permissão
5) dhcpd -cf /etc/dhcpd.conf -pf /var/run/dhcpd.pid at0

> Inicia-se o serviço do servidor DHCP
6) /etc/init.d/isc-dhcp-server start

> Apenas Habilita o IP Forward
7) echo 1 > /proc/sys/net/ipv4/ip_forward

> Os itens 8, 9 e 10 server para limpar configurações antigas
8) iptables --table nat --flush
9) iptables --delete-chain
10) iptables --table nat --delete-chain

> Necessário mudar a interface de rede e colocar a sua conexão cabeada
11) iptables --table nat --append POSTROUTING --out-interface enp0s20f0u1c4i2 -j MASQUERADE
12) iptables --append FORWARD --in-interface at0 -j ACCEPT
