FROM php:7.4-fpm

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y \
        git \
        unzip \
        libzip-dev \
        libonig-dev \
        libxml2-dev \
    && docker-php-ext-install pdo_mysql zip mbstring exif pcntl bcmath opcache \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY . /var/www/html

RUN composer install --optimize-autoloader --no-scripts

CMD ["php-fpm"]

COPY . /var/www/html

RUN composer install --optimize-autoloader --no-scripts \
    && php artisan key:generate \
    && php artisan migrate:fresh --seed

CMD ["php-fpm"]
