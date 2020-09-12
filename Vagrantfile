# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define :web1 do |web1|
        web1.vm.box = "bento/ubuntu-20.04"
        web1.vm.network :private_network, ip: "192.168.100.11"
        web1.vm.hostname = "web1"
        web1.vm.provision :shell, path: "web1/web1.sh"
    end
    config.vm.define :web2 do |web2|
        web2.vm.box = "bento/ubuntu-20.04"
        web2.vm.network :private_network, ip: "192.168.100.12"
        web2.vm.hostname = "web2"
        web2.vm.provision :shell, path: "web2/web2.sh"
    end
    config.vm.define :haproxy do |haproxy|
        haproxy.vm.box = "bento/ubuntu-20.04"
        haproxy.vm.network :private_network, ip: "192.168.100.13"
        haproxy.vm.hostname = "haproxy"
        haproxy.vm.provision :shell, path: "haproxy/haproxy.sh"
    end
end
