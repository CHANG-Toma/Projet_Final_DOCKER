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
    git \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Installe Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Défini le répertoire de travail
WORKDIR /var/www/html

# Copie les fichiers composer
COPY composer.json composer.lock /var/www/html/

# Installe les dépendances Composer
RUN composer install --optimize-autoloader --no-scripts --no-dev --no-cache

# Copie le reste des fichiers de l'application
COPY . /var/www/html

# Copie le fichier .env.example vers .env si .env n'existe pas
RUN if [ ! -f .env ]; then cp .env.example .env; fi

# Générer la clé d'application
RUN php artisan key:generate

# Donner les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html \
    && chmod -R 777 /var/www/html/storage

# Expose le port pour FPM
EXPOSE 9000

# Point d'entrée pour démarrer les services
CMD ["php-fpm"]
