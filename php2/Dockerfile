# Use the official PHP image
FROM php:latest

# Install required dependencies for Laravel
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Copy the composer files separately for better caching
COPY composer.json composer.lock /var/www/html/

# Install Composer dependencies
RUN composer install --optimize-autoloader --no-scripts --no-cache

# Copy the rest of the application files
COPY . /var/www/html

