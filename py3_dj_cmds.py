python3 -V ==> Python 3.6.9
sudo apt install python3-django

django-admin --version  || python3 -m django --version ==> 1.11.11
sudo apt install python3-pip
pip3 install psycopg2-binary

django-admin startproject myDjSite
cd myDjSite
sudo apt-get install python3-venv
python3 -m venv env
. env/bin/activate
deactivate

psql -U postgres
create database DJAppdb;
\l

python manage.py startapp testDB
python3 manage.py makemigrations
python3 manage.py migrate
-----------------------------------
# DJApps

* python3 -V
* python3 -m django --version
* pip3 --version
* django-admin --version
* python3 -m pip install --user --upgrade pip
* python3 -m pip --version
* python3 -m pip install --user virtualenv

* python3 -m venv env
* source env/bin/activate
* django-admin --version

* which python3
* pip3 install django
* django-admin --version
* python3 -V

* mkdir DJApps
* cd DJApps
* django-admin startproject djApp
* ls
* cd djApp
* subl .
* python3 manage.py runserver
* deactivate
* python3 manage.py collectstatic
