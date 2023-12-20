# Utilisez une image PHP de base
FROM php:latest

# Installez les dépendances nécessaires pour Laravel
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Installez Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définissez le répertoire de travail
WORKDIR /var/www/html

# Copiez le fichier composer.json séparément pour permettre une mise en cache efficace de l'installation des dépendances
COPY composer.json composer.lock /var/www/html/

# Copiez le reste des fichiers de votre application
COPY . /var/www/html

# Installez les dépendances de Composer
RUN composer install --optimize-autoloader --no-scripts --no-cache

# Exécution des commandes Laravel
RUN php artisan key:generate

CMD ["php", "artisan", "serve", "--host=127.0.0.1", "--port=8000"]
