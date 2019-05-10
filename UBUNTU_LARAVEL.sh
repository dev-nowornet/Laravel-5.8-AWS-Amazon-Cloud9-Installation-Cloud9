# INSTALL COMPOSER:
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# INSTALL PHP NECESSARY COMPONENTS:
sudo apt-get install php7.2-mbstring
sudo apt-get install php-xml -y
sudo apt-get install php7.2-sqlite3 -y

# INSTALL LARAVEL:
composer create-project laravel/laravel
alias laravel="cd ~/environment/laravel"

# INSTALL WORKING NODE PACKAGES:
rm -rf ~/node_modules
laravel
npm install

# CREATE SQLITE DATABASE. CONFIGURE .ENV
touch  database/database.sqlite
printf '%s\n' ':%s/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_HOST=127.0.0.1/#  DB_HOST=127.0.0.1/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_PORT=3306/#  DB_PORT=3306/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_DATABASE=homestead/#  DB_DATABASE=homestead/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_USERNAME=homestead/#  DB_USERNAME=homestead/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_PASSWORD=secret/#  DB_PASSWORD=/g' 'x'  | sudo ex .env

# LAUNCH LARAVEL:
php artisan migrate
php artisan serve --port=8080
# from the AWS Cloud9 console menu choose Preview --> Preview Running Application
rm -rf ../UBUNTU_LARAVEL.sh
#Edited by Bretfelean Sorin Cristian








