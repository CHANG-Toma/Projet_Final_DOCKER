FROM php:8.1-fpm

# Installe les dépendances requises pour Laravel et les extensions PHP pour MySQL
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

# Installe Composer globalement
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Défini le répertoire de travail
WORKDIR /var/www/html

# Copie les fichiers de l'application Laravel
COPY . /var/www/html/

# Copie les fichiers composer.json et composer.lock dans le répertoire de travail
COPY ../Laravel/composer.json ../Laravel/composer.lock /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose le port pour FPM
EXPOSE 9000

# Utilise le script d'entrée comme point d'entrée
ENTRYPOINT ["/var/www/html/entrypoint.sh"]
