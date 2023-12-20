# Dockerfile pour php2
FROM php:latest

WORKDIR /var/www/html

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

COPY code /var/www/html/

CMD ["php", "artisan", "migrate:fresh", "--seed", "--host=0.0.0.0", "--port=9000"]
