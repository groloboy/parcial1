sudo snap install lxd
newgrp lxd
lxd init --auto

lxc launch ubuntu:20.04 web1
lxc launch ubuntu:20.04 web1Back

sudo apt-get update

lxc exec web1 -- sudo apt-get install apache2 -y
lxc exec web1 -- sudo systemctl enable apache2 -y
lxc file push /vagrant/web1/web1.html web1/var/www/html/index.html
lxc exec web1 -- sudo systemctl restart apache2
lxc config device add web1 myport80 proxy listen=tcp:192.168.100.11:80 connect=tcp:127.0.0.1:80
echo "------------web1 Configurada------------"

lxc exec web1Back -- sudo apt-get install apache2 -y
lxc exec web1Back -- sudo systemctl enable apache2 -y
lxc file push /vagrant/web1/web1Back.html web1Back/var/www/html/index.html
lxc exec web1Back -- sudo systemctl restart apache2
lxc config device add web1Back myport5080 proxy listen=tcp:192.168.100.11:5080 connect=tcp:127.0.0.1:80
echo "------------web1 backup Configurada------------"