# utils here
## ntfs commands
* `sudo ntfsfix /dev/sda6`
* `sudo ntfsfix /dev/sda5`

## in .bash_aliases
### gedit ~/.bash_aliases
alias r2='rvm use --default 2.5.8'\
alias r3='rvm use --default 3.0.0'\
alias rl='rvm list'\
alias 3k='rails s'\
alias 4k='rails s -p 4000'\
alias rcl='rails console'\
alias home='cd ~/'\
alias la='alias'\
alias cl='clear'\
alias ys='yarn start'\
alias gg='git gui'

## For terminal in sublime
* https://www.geeksforgeeks.org/how-to-use-terminal-in-sublime-text-editor/
* Alt+1

## Ruby Installation:
* gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
* curl -sSL https://get.rvm.io | bash -s stable --ruby
* source /home/satish/.rvm/scripts/rvm
* rvm get stable --autolibs=enable
* rvm version
* rvm list
* rvm --default use 3.0.0

## Node Installation:
* sudo apt install gcc g++ make
* curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
* sudo apt-get install -y nodejs
* sudo apt-get install gcc g++ make
* curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
* echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
* sudo apt-get update && sudo apt-get install yarn
* node --version
* yarn –version

## Rails Installation:
* gem update --system
* gem info bundler
* gem -v
* gem install rails
* rails –version


## Rails app creation:
* `rails _5.2.6_ new univ_app` (for using a specific rails version)
* `rails new myApp -d postgresql` (creates app with webpacker)
* `rails new todoAppApi -d postgresql --skip-webpack-install –skip-javascript` (creates app without webpacker)

## database.yml
development:
>  adapter: postgresql\
>  encoding: unicode\
>  database: todo_App_Api_dev\
>  pool: 5\
>  username: postgres\
>  password: postgres

test:
>  adapter: postgresql\
>  encoding: unicode\
>  database: todo_App_Api_test\
>  pool: 5\
>  username: postgres\
>  password: postgres

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
