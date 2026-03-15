# 🚀 Rails Development Environment Setup Guide

Complete guide to install a **Ruby on Rails development environment** on Ubuntu.

This document covers installation of:

- Sublime Text
- Curl
- Chromium
- Ruby (RVM)
- Bundler
- Node.js
- Rails
- PostgreSQL
- Git

---

# 📚 Table of Contents

- [Prerequisites](#-prerequisites)
- [Sublime Text Installation](#1-sublime-text-installation)
- [Curl Installation](#2-curl-installation)
- [Chromium Installation](#3-chromium-installation)
- [Bundler Installation](#4-bundler-installation)
- [Ruby Installation (RVM)](#5-ruby-installation-rvm)
- [Node Installation](#6-node-installation)
- [Rails Installation](#7-rails-installation)
- [PostgreSQL Installation](#8-postgresql-installation)
- [PostgreSQL User/DB Setup](#9-postgresql-userdb-setup)
- [Git Installation](#10-git-installation)
- [Git Commit and Push](#11-git-commit-and-push)
- [Removing Ruby / Git / RVM](#12-removing-ruby--git--rvm)
- [Rails App Creation](#13-rails-app-creation)
- [Database Configuration](#14-databaseyml)

---

# ⚙️ Prerequisites

Update system packages.

```bash
sudo apt update
sudo apt upgrade
```

---

# 1. Sublime Text Installation

```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" \
| sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install sublime-text
```

---

# 2. Curl Installation

```bash
sudo apt-get install curl
```

---

# 3. Chromium Installation

```bash
sudo apt install chromium-browser
```

---

# 4. Bundler Installation

Check bundler:

```bash
gem info bundler
```

Install bundler:

```bash
gem install bundler
```

---

# 5. Ruby Installation (RVM)

Import RVM keys:

```bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys \
409B6B1796C275462A1703113804BB82D39DC0E3 \
7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

Install RVM and Ruby:

```bash
curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Load RVM:

```bash
source ~/.rvm/scripts/rvm
```

Update RVM:

```bash
rvm get stable --autolibs=enable
```

Verify installation:

```bash
rvm version
rvm list
```

Set default Ruby:

```bash
rvm --default use 3.0.0
```

---

# 6. Node Installation

Install build tools:

```bash
sudo apt install gcc g++ make
```

Install NodeJS:

```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt-get install -y nodejs
```

Install Yarn:

```bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg \
| gpg --dearmor \
| sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] \
https://dl.yarnpkg.com/debian stable main" \
| sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install yarn
```

Verify:

```bash
node --version
yarn --version
```

---

# 7. Rails Installation

Update RubyGems:

```bash
gem update --system
```

Check gem version:

```bash
gem -v
```

Install Rails:

```bash
gem install rails
```

Verify Rails installation:

```bash
rails --version
```

---

# 8. PostgreSQL Installation

```bash
sudo apt-get update

sudo apt-get install postgresql postgresql-contrib

sudo apt-get install libpq-dev
```

Install PostgreSQL Ruby gem:

```bash
gem install pg
```

Install pgAdmin:

```bash
sudo apt update
sudo apt install pgadmin3
```

---

# 9. PostgreSQL User/DB Setup

Login to PostgreSQL:

```bash
psql -U postgres
```

Create user:

```bash
sudo -u postgres createuser <username>
```

Open PostgreSQL shell:

```bash
sudo -u postgres psql
```

Create database:

```sql
CREATE DATABASE yourdbname;
```

Create user with password:

```sql
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
```

Grant privileges:

```sql
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
```

---

## Fix Peer Authentication Error

If you see:

```
FATAL: Peer authentication failed for user "postgres"
```

Edit config:

```bash
sudo nano /etc/postgresql/9.5/main/pg_hba.conf
```

Restart PostgreSQL:

```bash
sudo service postgresql restart
```

---

# 10. Git Installation

```bash
sudo apt update
sudo apt install git
```

Configure Git:

```bash
git config --global color.ui true
git config --global user.name "yourname"
git config --global user.email "youremail@example.com"
```

Generate SSH key:

```bash
ssh-keygen -t rsa -b 4096 -C "youremail@example.com"
```

View SSH key:

```bash
cat ~/.ssh/id_rsa.pub
```

Add SSH key to GitHub:

https://github.com/settings/keys

---

# 11. Git Commit and Push

Initialize repository:

```bash
git init
```

Add README:

```bash
git add README.md
```

Commit:

```bash
git commit -m "first commit"
```

Set branch:

```bash
git branch -M main
```

Add remote:

```bash
git remote add origin git@github.com:username/repo.git
```

Push code:

```bash
git push -u origin main
```

Next commits:

```bash
git status
git add .
git commit -m "Adding all files"
git push
```

---

# 12. Removing Ruby / Git / RVM

Remove Ruby:

```bash
sudo apt-get purge ruby rubygems
```

Check Ruby location:

```bash
which ruby
```

Check gem environment:

```bash
gem env
```

Remove runit:

```bash
sudo apt-get purge runit
```

Remove Git:

```bash
sudo apt-get purge git-all
sudo apt-get purge git
```

Cleanup:

```bash
sudo apt-get autoremove
sudo apt update
```

Remove Ruby fully:

```bash
sudo apt remove ruby
sudo apt autoremove
```

Remove RVM:

```bash
rvm implode
```

Check Rails:

```bash
which rails
```

Cleanup gems:

```bash
sudo gem cleanup
```

---

# 13. Rails App Creation

Create Rails app with webpacker:

```bash
rails new myApp -d postgresql
```

Create API-only Rails app:

```bash
rails new todoAppApi -d postgresql --skip-webpack-install --skip-javascript
```

---

# 14. database.yml

```yaml
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
```

---
# Node.js Cleanup Commands

These commands remove Node.js installations and related files from the system.

```bash
sudo rm -rf /usr/local/bin/npm

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
```

---

# 💡 Tips

- Use **Markdown headings** for navigation.
- Keep commands inside **code blocks** for easy copying.
- Use **Table of Contents** in large documentation files.

---


