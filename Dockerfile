#Utilisation de la dernière version de php
FROM php:latest

#Définition du répertoire de travail
WORKDIR /var/www/html

#Mise en place des dépendances nécéssaires
RUN apt-get update && \
    apt-get install -y \
        docker-php-ext-install pdo_mysql zip mbstring exif pcntl bcmath opcache \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#on copie le code source dans le conteneur
COPY . /var/www/html

#Installation des dépendances PHP
RUN composer install --optimize-autoloader --no-scripts

CMD ["php-fpm"]

COPY . /var/www/html

RUN composer install --optimize-autoloader --no-scripts \
    && php artisan key:generate \
    && php artisan migrate:fresh --seed

CMD ["php-fpm"]
