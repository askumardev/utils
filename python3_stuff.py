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

psql -U postgres
create database DJAppdb;
\l

python manage.py startapp testDB
python3 manage.py makemigrations
python3 manage.py migrate


