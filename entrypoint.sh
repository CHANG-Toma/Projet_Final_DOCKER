#!/bin/bash

# Attendre un peu pour la bdd
echo "En attente de la base de données..."
sleep 5

# dépendances Composer seulement si le dossier vendor n'existe pas
if [ ! -d vendor ]; then
    echo "Installation des dépendances Composer..."
    composer install
fi

# dépendances Node.js seulement si nécessaire
if [ ! -d node_modules ]; then
    echo "Installation des dépendances Node.js..."
    npm cache clean --force
    npm install
fi

# commandes Laravel si le fichier artisan existe
if [ -f artisan ]; then
    echo "Configuration de Laravel..."
    php artisan key:generate
    php artisan migrate --seed # les migrations sans supprimer les tables
else
    echo "Pas de fichier artisan détecté."
fi

# Optimisation de l'autoloader Composer
echo "Optimisation de l'autoloader Composer..."
composer update
composer dump-autoload --optimize

# Construction des assets avec npm
echo "Construction des assets avec npm..."
npm run build

# Démarrage de php-fpm
echo "Le service PHP est désormais opérationnel ! :)"
exec php-fpm
