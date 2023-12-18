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
        libpcap-dev

RUN docker-php-ext-install pdo_mysql zip mbstring exif pcntl bcmath opcache

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copier les fichiers source
COPY . /var/www/html

# Exécution des commandes Laravel
CMD ["php", "artisan", "migrate:fresh", "--seed", "--host=0.0.0.0", "--port=9000"]
