sudo snap install lxd
newgrp lxd
cp /vagrant/web2/preseed.sh preseed.sh
source preseed.sh
sudo cat config.yaml | lxd init --preseed

lxc launch ubuntu:20.04 web2 --target web2
lxc launch ubuntu:20.04 web2Back --target web2

sudo apt-get update

lxc exec web2 -- sudo apt-get install apache2 -y
lxc exec web2 -- sudo systemctl enable apache2 
lxc file push /vagrant/web2/web2.html web2/var/www/html/index.html
lxc exec web2 -- sudo systemctl restart apache2
lxc config device add web2 myport80 proxy listen=tcp:192.168.100.12:80 connect=tcp:127.0.0.1:80
lxc config set web2 limits.memory 64MB
echo "------------web2 Configurada------------"

lxc exec web2Back -- sudo apt-get install apache2 -y
lxc exec web2Back -- sudo systemctl enable apache2 
lxc file push /vagrant/web2/web2Back.html web2Back/var/www/html/index.html
lxc exec web2Back -- sudo systemctl restart apache2
lxc config device add web2Back myport5080 proxy listen=tcp:192.168.100.12:5080 connect=tcp:127.0.0.1:80
echo "------------web2 backup Configurada------------"