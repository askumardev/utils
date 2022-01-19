# utils
## ntfs commands
* `sudo ntfsfix /dev/sda6`
* `sudo ntfsfix /dev/sda5`

## in .bash_aliases
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
alias gg='git gui'\

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
* Go to folder where dump file is present
* Open terminal
* sudo su postgres
* createdb sample_db;
* Enter postgres password
* psql -U postgres sample_db < sample_db_dump;

## docker cmds
Installation cmds
* sudo apt-get remove docker docker-engine docker.io
* sudo apt-get update
* sudo apt install docker.io
* sudo snap install docker
* sudo apt purge snapd && sudo apt install snapd
* sudo snap install docker
* sudo apt-get install docker
* docker --version

* sudo docker run hello-world
* docker
* sudo docker ps -a
* pwd
* where is docker
* ps -ef
* ps -ef | grep docker
* docker images
* sudo docker images
* sudo docker pull nginx
* sudo docker run -it nginx
* sudo docker ps
* sudo docker run -itd nginx
* sudo docker ps
* ifconfig
* ip -a
* ip addr show
* sudo docker ps
* sudo docker exec -it e6fd9cbeda6c bash

