# Utilisation de la dernière version de PHP
FROM php:latest

# Définition du répertoire de travail
WORKDIR /var/www/html

# Mise en place des dépendances nécessaires
RUN apt-get update && \
    apt-get install -y \
        zip \
        unzip \
        curl \
        libzip-dev \
        libonig-dev \
        libexif-dev \
        libpcap-dev \
    && docker-php-ext-install pdo_mysql zip mbstring exif pcntl bcmath opcache \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copier uniquement le fichier de composition lors de la construction de l'image
COPY composer.json composer.lock /var/www/html/

# Installation des dépendances PHP
RUN composer install --optimize-autoloader --no-scripts --no-cache

# Copier le reste des fichiers source
COPY . /var/www/html

# Exécution des commandes Laravel
RUN php artisan key:generate

CMD ["php", "artisan", "serve", "--host=127.0.0.1", "--port=8000"]
