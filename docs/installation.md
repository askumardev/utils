Sublime text3 installation:
•	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
•	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
•	sudo apt-get update
•	sudo apt-get install sublime-text

Curl Installation:   
•	sudo apt-get install curl

 Chromium Installation:   
•	sudo apt install chromium-browser

Bundler Installation: 
•	gem info bundler
•	gem install bundler

Ruby Installation:
•	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
•	curl -sSL https://get.rvm.io | bash -s stable --ruby
•	source /home/satish/.rvm/scripts/rvm
•	rvm get stable --autolibs=enable
•	rvm version
•	rvm list
•	rvm --default use 3.0.0

Node Installation:
•	sudo apt install gcc g++ make
•	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
•	sudo apt-get install -y nodejs
•	sudo apt-get install gcc g++ make
•	curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
•	echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
•	sudo apt-get update && sudo apt-get install yarn
•	node --version
•	yarn –version

Rails Installation:
•	gem update --system
•	gem info bundler
•	gem -v
•	gem install rails
•	rails –version

Postgres Installation:
•	sudo apt-get update
•	sudo apt-get install postgresql postgresql-contrib
•	sudo apt-get install libpq-dev
•	gem install pg
•	sudo apt update
•	sudo apt install pgadmin3 

Postgres user/db setup:
•	 psql -U postgres
•	sudo -u postgres createuser <username>
To change password:
•	Open a new terminal
•	sudo -u postgres psql
•	CREATE DATABASE yourdbname;
•	CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
•	GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
•	if getting the error:	FATAL: Peer authentication failed for user "postgres"
•	sudo nano /etc/postgresql/9.5/main/pg_hba.conf

•	sudo service postgresql restart

Git Installation:
•	sudo apt update
•	sudo apt install git
•	git config --global color.ui true
•	git config --global user.name "****4"
•	git config --global user.email "****4@***mail.com"
•	ssh-keygen -t rsa -b 4096 -C "****4@***mail.com"
•	cat ~/.ssh/id_rsa.pub
•	copy the sshkey from the terminal and goto https://github.com/settings/keys and under  



click new ssh and paste an save.

Git Commit and code push:
•	git init
•	git add README.md
•	git commit -m "first commit"
•	git branch -M main
•	git remote add origin git@github.com:****4/my_WP_App.git
•	git push -u origin main
•	git status
•	git add .
•	git commit -m "Adding all files"
•	git push -u origin main

Remove git,rvm ruby:
•	sudo apt-get purge ruby rubygems 
•	which ruby
•	gem env
•	sudo apt-get purge runit
•	sudo apt-get purge git-all
•	sudo apt-get purge git
•	sudo apt-get autoremove
•	sudo apt update
•	sudo apt-get remove libappstream3
•	sudo apt remove ruby
•	sudo apt autoremove
•	sudo apt remove ruby
•	 rvm list
•	rvm implode
•	which rails
•	sudo gem cleanup

Rails app creation: 
•	rails new myApp -d postgresql (creates app with webpacker)
•	rails new todoAppApi -d postgresql --skip-webpack-install –skip-javascript (creates app without webpacker)

Database yml:
development:
  adapter: postgresql
  encoding: unicode
  database: todo_App_Api_dev
  pool: 5
  username: postgres
  password: postgres

test:
  adapter: postgresql
  encoding: unicode
  database: todo_App_Api_test
  pool: 5
  username: postgres
  password: postgres
