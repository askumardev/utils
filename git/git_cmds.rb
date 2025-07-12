## Installation & config steps:
* sudo apt install git
* git --version

* git config --global user.name "ask***rdev"
* git config --global user.email "ask***r.dev@***look.com"
* git config --list

* mkdir $HOME/.ssh
* chmod 700 $HOME/.ssh
* cd ~/.ssh
* ssh-keygen -o -t rsa -C "ask***r.dev@outlook.com"
* cat id_rsa.pub
* Copy the above token an place in github account under Settings/SSH and GPG keys

First commit commands
Create a repo without selecting Readme.md
Fill details like repo name and description
echo "# exApp" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/askumardev/exApp.git
git push -u origin main

If authentication error comes use ssh instead of https in git
* git remote -v
* git remote set-url origin git@github.com:ask***rdev/****.git
---------------------------------------------------------------

# Remove branch remotely and locally
Use to remove branch remotely:
* git push origin --delete income_networth
====================================================
Use to remove branch locally
* git branch -D powerbi_public_token
-----------------------------------------------------

## to check logs:
* git log
* git shortlog
* git shortlog -s
* git log --stat

## Git remote commands::
* git remote -v
* git remote set_url origin https://github.com/username/repo.git


Brad Cmds:
------------
GH_TOKEN=514572567d8e6d20261f4a2f46f440ee9187fe39 flash_flow --no-merge

tail -f log/flash_flow.log
-------------------------------------------------------------------------------
git tags are to be created on master
git tag  --> to list all existing tags
git tag v1.4 --> tag creation
git push origin v1.4 --> pushing tag
