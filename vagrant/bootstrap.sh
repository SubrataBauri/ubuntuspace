#!/bin/bash

echo "Provisioning virtual machine..."
echo "=========================================="
echo "Updating Ubuntu"
sudo apt-get update > /dev/null
sudo apt-get upgrade > /dev/null

# Git
#echo "Installing Git"
#sudo apt-get install git -y > /dev/null

# Apache
echo "Installing Apache"
sudo apt-get install apache2 -y > /dev/null

# PHP
echo "Updating PHP repository"
sudo apt-get install python-software-properties -y > /dev/null
sudo add-apt-repository ppa:ondrej/php -y > /dev/null
sudo apt-get update > /dev/null

#echo "Installing PHP"
sudo apt-get install php7.1 -y > /dev/null

#echo "Installing PHP extensions"
## The following line is not tested
# sudo apt-get install php7.1-common php7.1-dev php5-cli php7.1-fpm -y > /dev/null
sudo apt-get install -y libapache2-mod-php7.1 php7.1-cli php7.1-common php7.1-mbstring -y > /dev/null
sudo apt-get install -y php7.1-gd php7.1-intl php7.1-xml php7.1-mysql -y > /dev/null
sudo apt-get install -y php7.1-mcrypt php7.1-zip php7.1-bcmath php7.1-xdebug -y > /dev/null
sudo apt install php7.1-curl -y > /dev/null
sudo apt install php7.1-soap -y > /dev/null
sudo a2enmod rewrite
sudo service apache2 restart

echo "Creating xdebug log directory: /var/log/xdebug"
sudo mkdir /var/log/xdebug > /dev/null
echo "Changing xdebug log directory owner to www-data"
sudo chown www-data:www-data /var/log/xdebug > /dev/null

echo "Installing xdebug"
sudo pecl install xdebug > /dev/null
#echo "Configuring xdebug"
#sudo cp /var/www/html/config/php.ini /etc/php5/apache2/php.ini > /dev/null
sudo service apache2 restart > /dev/null
echo "Xdebug installation completeted"

# MySQL 
echo "Preparing MySQL"
sudo apt-get install debconf-utils -y > /dev/null
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySQL"
sudo apt-get install mysql-server-5.6 -y > /dev/null
sudo apt-get install mysql-server -y -f > /dev/null
sudo apt-get install -y mysql-client > /dev/null


# Apache Configuration
echo "Configuring Apache"
cp /var/www/html/config/servername.conf /etc/apache2/conf-available/servername.conf > /dev/null
sudo a2enconf servername > /dev/null
cp /var/www/html/config/dir.conf /etc/apache2/mods-enabled/dir.conf > /dev/null
sudo service apache2 restart > /dev/null

# Install Git
echo "Installing Git"
sudo apt-get install git -y > /dev/null

# Installing Composer
echo "Installing Composer"
sudo curl -sS https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/local/bin/composer > /dev/null

# Installing Node
echo "Installing Node"
sudo curl -sL https://deb.nodesource.com/setup | sudo bash - > /dev/null
sudo sudo apt-get install -y nodejs > /dev/null
sudo npm install npm -g

echo "Installing Bower"
sudo npm install bower -g > /dev/null

echo "Installing Gulp"
sudo npm install Gulp -g > /dev/null


echo "Finished provisioning."
