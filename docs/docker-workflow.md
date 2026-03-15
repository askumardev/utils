## docker cmds
Installation cmds:
* sudo apt-get remove docker docker-engine docker.io
* sudo apt-get update
* sudo apt install docker.io
* sudo snap install docker
* sudo apt purge snapd && sudo apt install snapd
* sudo snap install docker
* sudo apt-get install docker

## Version check:
* docker --version

## Pulling an image and running an image
* docker pull hello-world
* docker run hello-world
* docker pull nginx
* docker run -it nginx
* docker run -itd nginx

## Docker images related cmds:
* docker
* docker images
* sudo docker ps
* sudo docker ps -a
* pwd
* where is docker
* ps -ef
* ps -ef | grep docker

* ifconfig
* ip -a
* ip addr show

* docker exec -it e6fd9cbeda6c bash

*sudo rm -rf /usr/local/bin/npm 
sudo rm -rf /usr/local/share/man/man1/node* 
sudo rm -rf /usr/local/lib/dtrace/node.d
rm -rf ~/.npm
rm -rf ~/.node-gyp
sudo rm -rf /opt/local/bin/node
sudo rm -rf /opt/local/include/node
sudo rm -rf /opt/local/lib/node_modules
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/include/node*
sudo rm -rf /usr/local/bin/node*
