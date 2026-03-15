

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

