#!/bin/bash
sudo yum install wget -y
wget https://raw.githubusercontent.com/workexcel/socks/main/dante.sh
chmod 777 dante.sh
sudo ./dante.sh
sudo /etc/init.d/sockd adduser www www
echo 'net.ipv4.icmp_echo_ignore_all = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
echo 'Port 22001' | sudo tee -a  /etc/ssh/sshd_config
sudo systemctl restart sshd.service
