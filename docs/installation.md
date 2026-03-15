This guide explains how to install and configure the following tools:

Sublime Text

Curl

Chromium

Ruby (RVM)

Bundler

Node.js

Rails

PostgreSQL

Git

1. Sublime Text Installation
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
2. Curl Installation
sudo apt-get install curl
3. Chromium Installation
sudo apt install chromium-browser
4. Bundler Installation

Check if bundler is installed:

gem info bundler

Install bundler:

gem install bundler
5. Ruby Installation (Using RVM)

Import RVM keys:

gpg --keyserver hkp://keys.gnupg.net --recv-keys \
409B6B1796C275462A1703113804BB82D39DC0E3 \
7D2BAF1CF37B13E2069D6956105BD0E739499BDB

Install RVM and Ruby:

curl -sSL https://get.rvm.io | bash -s stable --ruby

Load RVM:

source /home/satish/.rvm/scripts/rvm

Update RVM:

rvm get stable --autolibs=enable

Check versions:

rvm version
rvm list

Set default Ruby version:

rvm --default use 3.0.0
6. Node.js Installation

Install build tools:

sudo apt install gcc g++ make

Install Node.js:

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

Install Yarn:

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" \
| sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install yarn

Check versions:

node --version
yarn --version
7. Rails Installation

Update RubyGems:

gem update --system

Check gem version:

gem -v

Install Rails:

gem install rails

Verify Rails installation:

rails --version
8. PostgreSQL Installation
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libpq-dev

Install PostgreSQL Ruby gem:

gem install pg

Install pgAdmin:

sudo apt update
sudo apt install pgadmin3
9. PostgreSQL User and Database Setup

Login to PostgreSQL:

psql -U postgres

Create user:

sudo -u postgres createuser <username>

Open PostgreSQL shell:

sudo -u postgres psql

Create database:

CREATE DATABASE yourdbname;

Create user with password:

CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';

Grant privileges:

GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
Fix Peer Authentication Error

If you see:

FATAL: Peer authentication failed for user "postgres"

Edit configuration:

sudo nano /etc/postgresql/9.5/main/pg_hba.conf

Restart PostgreSQL:

sudo service postgresql restart
10. Git Installation
sudo apt update
sudo apt install git

Configure Git:

git config --global color.ui true
git config --global user.name "yourname"
git config --global user.email "youremail@example.com"

Generate SSH key:

ssh-keygen -t rsa -b 4096 -C "youremail@example.com"

View SSH key:

cat ~/.ssh/id_rsa.pub

Copy the key and add it to GitHub:

https://github.com/settings/keys

Click New SSH Key and paste the key.

11. Git Commit and Push Code

Initialize repository:

git init

Add README:

git add README.md

Commit:

git commit -m "first commit"

Set main branch:

git branch -M main

Add remote repository:

git remote add origin git@github.com:username/my_WP_App.git

Push code:

git push -u origin main

Further commits:

git status
git add .
git commit -m "Adding all files"
git push -u origin main
12. Removing Git, Ruby, and RVM

Remove Ruby packages:

sudo apt-get purge ruby rubygems

Check Ruby location:

which ruby

Check gem environment:

gem env

Remove runit:

sudo apt-get purge runit

Remove Git:

sudo apt-get purge git-all
sudo apt-get purge git

Clean unused packages:

sudo apt-get autoremove

Update system:

sudo apt update

Remove Ruby completely:

sudo apt remove ruby
sudo apt autoremove

Remove RVM:

rvm implode

Check Rails:

which rails

Clean gems:

sudo gem cleanup
13. Rails Application Creation

Create Rails app with Webpacker:

rails new myApp -d postgresql

Create Rails API app without Webpacker:

rails new todoAppApi -d postgresql --skip-webpack-install --skip-javascript
14. database.yml Configuration
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