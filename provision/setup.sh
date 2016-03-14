#!/bin/bash
#export DEBIAN_FRONTEND=noninteractive

#echo "Provisioning virtual machine..."
#apt-get update
#apt-get upgrade -y

#echo "Force Locale"
#echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
#locale-gen en_US.UTF-8

#echo "Installing Git"
#apt-get install git -y > /dev/null
 
#echo "Installing Nginx"
#apt-get install nginx -y > /dev/null

#echo "Updating PHP repository"
#apt-get install python-software-properties build-essential -y > /dev/null
#add-apt-repository ppa:ondrej/php5 -y > /dev/null
#apt-get update > /dev/null

#echo "Installing PHP"
#apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null
 
#echo "Installing PHP extensions"
#apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

#echo "Installing HHVM"
#apt-get update
#apt-get install python-software-properties  -y --force-yes
#add-apt-repository ppa:mapnik/boost
#wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
#echo deb http://dl.hhvm.com/ubuntu precise main | sudo tee /etc/apt/sources.list.d/hhvm.list
#apt-get update
#apt-get install hhvm-nightly -y --force-yes
#apt-get install screen vim -y --force-yes

#echo "Configuring HHVM"
#/usr/share/hhvm/install_fastcgi.sh
#/etc/init.d/nginx restart
#/etc/init.d/hhvm restart
#update-rc.d hhvm defaults
#service hhvm restart

#echo "Installing Composer"
#curl -sS https://getcomposer.org/installer | php
#mv composer.phar /usr/local/bin/composer

#echo "Installing Laravel and Laravel Envoy"
#composer global require "laravel/installer=~1.1"
#composer global require "laravel/envoy=~1.0"
#echo 'export PATH="$PATH:~/.composer/vendor/bin"' >> ~/.bashrc

#echo "Preparing MySQL"
#apt-get install debconf-utils -y > /dev/null
#debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234" 
#debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

#echo "Installing MySQL"
#apt-get install mysql-server -y > /dev/null

#echo "Installing Postgres"
#apt-get -y install postgresql postgresql-contrib

echo "Configuring Nginx"
cp /vagrant/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
service nginx restart > /dev/null

#echo "Installing NodeJs, npm, bower, gulp, grunt and pm2"
#curl -sL https://deb.nodesource.com/setup | bash -
#apt-get install -y nodejs
#apt-get install -y build-essential
#apt-get install npm
#npm install -g bower
#npm install -g gulp
#npm install -g grunt-cli
#npm install -g pm2



