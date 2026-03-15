# GitHub Copilot Documentation

Welcome to the Copilot guide.

## 📚 Navigation

| Section | Description |
|-------|-------------|
| [Core Commands](commands.md) | List of Copilot slash commands |
| [Rails Prompts](rails-prompts.md) | Prompts useful for Rails development |
| [RSpec Prompts](rspec-prompts.md) | Prompts for writing tests |
| [Debugging Prompts](debugging-prompts.md) | Prompts for debugging code |
| [Architecture Docs](docs/architecture.md) | System architecture notes |
| [Workflow](docs/workflow.md) | Development workflow |

---

## About

This repository contains notes and prompts to use GitHub Copilot effectively.


# utils here
## ntfs commands
* `sudo ntfsfix /dev/sda6`
* `sudo ntfsfix /dev/sda5`



## For terminal in sublime
* https://www.geeksforgeeks.org/how-to-use-terminal-in-sublime-text-editor/
* Alt+1



## PG db restoration commands
* sudo service postgresql stop
* sudo service postgresql start
* Go to folder where dump file is present
* Open terminal
* sudo su postgres
* createdb sample_db;
* Enter postgres password
* psql -U postgres sample_db < sample_db_dump;

## postgres terminal cmds
* sudo -i -u postgres
* psql
* \l

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
