sudo snap install lxd
newgrp lxd
lxd init --auto

lxc launch ubuntu:20.04 haproxy

sudo apt-get update

lxc exec haproxy -- sudo apt-get install haproxy -y
lxc exec haproxy -- sudo systemctl enable haproxy
lxc file push /vagrant/haproxy/haproxy.cfg haproxy/etc/haproxy/haproxy.cfg
lxc file push /vagrant/haproxy/503.http haproxy/etc/haproxy/errors/503.http
lxc config device add haproxy myport80 proxy listen=tcp:192.168.100.13:80 connect=tcp:127.0.0.1:80
lxc exec haproxy -- sudo systemctl start haproxy