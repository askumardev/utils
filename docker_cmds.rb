Docker Installation:
------------------------
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt install docker.io
sudo snap install docker
sudo apt purge snapd && sudo apt install snapd
sudo snap install docker
sudo apt-get install docker
docker --version
---------------------------------------------------------
Docker testing:
---------------
sudo docker run hello-world
---------------------------------------------------------
docker
sudo docker ps -a
pwd
where is docker
ps -ef | grep docker
docker images
sudo docker images
sudo docker pull nginx
sudo docker run -it nginx
sudo docker ps
sudo docker run -itd nginx
sudo docker ps
ip -a
ip addr show
sudo docker ps
sudo docker exec -it e6fd9cbeda6c bash