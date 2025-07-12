 1777  sudo apt-get update

 1779  sudo systemctl status apache2
 1780  sudo apt install apache2
 1781  sudo systemctl status apache2
 
 1782  sudo apt install php7.4-common php7.4-cli php7.4-mysql php7.4-mbstring php7.4-xml -y

 1784  sudo apt install php8.0
 1785  sudo apt install software-properties-common
 1786  sudo add-apt-repository ppa:ondrej/php
 1787  sudo apt-get update
 1788  sudo apt install php8.0
 1789  curl -sS https://getcomposer.org/installer | php
 1790  mv composer.phar /usr/local/bin/composer
 1791  sudo mv composer.phar /usr/local/bin/composer
 1792  chmod +x /usr/local/bin/composer
 1793  composer --version
 1794  cd /var/www/html
 1795  pwd
 1796  composer create-project laravel/laravel lara_app
 1797  sudo chown -R ubuntu:ubuntu /var/www/html
 1798  sudo chmod -R 755 /var/www/html

 1800  sudo service apache2 restart

 1802  sudo apt install php8.1
 1803  composer create-project laravel/laravel lara_app
 1804  cd ..

 1806  php --ini
 1807  composer --ignore-platform-req=ext-xml
 1808  composer create-project laravel/laravel first-laravel9
 1809  composer create-project -s laravel/laravel first-laravel9
 1810  composer update --ignore-platform-reqs
 1811  composer install --ignore-platform-reqs
 1812  curl -sS https://getcomposer.org/installer | php\nmv composer.phar /usr/local/bin/composer
 1813  curl -sS https://getcomposer.org/installer | php\nsudo mv composer.phar /usr/local/bin/composer
 1814  composer install --ignore-platform-reqs
 1815  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
 1816  composer diagnose
 1817  php -v
 1818  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
 1819  composer --version
 1820  clear
 1821  composer create-project laravel/laravel exApp
 1822  composer install --ignore-platform-reqs
 1823  composer install
 1824  subl .
 1825  composer install
 1826  sudo apt-get install php-xml
 1827  composer install
 1828  cd ..
 1829  composer create-project laravel/laravel exApp
 1830  composer --version
 1831  php -v
 1832  cd etc/php
 1833  cd etc
 1834  ls
 1835  php -i | grep 'php.ini'
 1836  vi /etc/php/8.1/cli/php.ini
 1837  composer create-project laravel/laravel exApp
 1838  sudo apt search php-xml
 1839  php -m
 1840  vi /etc/php/8.1/cli/php.ini
 1841  composer install
 1842  php -v
 1843  sudo apt-get install php-xml
 1844  sudo service apache2 restart
 1845  composer install
 1846  composer update --ignore-platform-reqs
 1847  sudo apt-get install php-dom
 1848  sudo apt-get install php8.1-xml
 1849  composer install
 1850  composer update --ignore-platform-reqs
 1851  php artisan serve
 1852  psql
 1853  psql -U postgres
 1854  subl .
 1855  php artisan migrate:install
 1856  sudo apt-get install php8.1-pgsql
 1857  php artisan migrate:install
 1858  sudo apt-get install php8.1-pgsql
 1859  psql -U postgres
 1860  php artisan migrate:install
 1861  php artisan serve
 1862  php artisan migrate:install
 1863  sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add\n
 1864  sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'\n
 1865  sudo apt install pgadmin4

