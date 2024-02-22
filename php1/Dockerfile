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

# Copie les fichiers de l'application
COPY . /var/www/html

# Copie les fichiers composer.json et composer.lock dans le répertoire de travail
COPY composer.json composer.lock ./

# Installe les dépendances Composer sans exécuter de scripts
RUN composer install

# Rend le script d'entrée exécutable et ajuste les permissions
RUN chmod +x entrypoint.sh

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 755 /var/www/html/storage

# Expose le port pour FPM
EXPOSE 9000

# Utilise le script d'entrée comme point d'entrée
ENTRYPOINT ["./entrypoint.sh"]
