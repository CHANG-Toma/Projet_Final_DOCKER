FROM php:8.1-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    nodejs \
    npm \
    git && \
    docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /stock
COPY ./entrypoint.sh /stock/entrypoint.sh

RUN chmod +x /stock/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "/stock/entrypoint.sh"]
