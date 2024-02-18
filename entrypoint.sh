#!/bin/bash

# Attendre un peu pour la base de données
echo "En attente de la base de données..."
sleep 5

# Vérifie et installe les dépendances Composer seulement si le dossier vendor n'existe pas
if [ ! -d vendor ]; then
    echo "Installation des dépendances Composer..."
    composer install
fi

# Installe les dépendances Node.js seulement si nécessaire
if [ ! -d node_modules ]; then
    echo "Installation des dépendances Node.js..."
    npm cache clean --force
    npm i
    npm run build
fi

# Exécute les commandes Laravel si le fichier artisan existe
if [ -f artisan ]; then
    echo "Configuration de Laravel..."
    php artisan key:generate
    php artisan migrate --seed # Effectue les migrations sans supprimer les tables
else
    echo "Pas de fichier artisan détecté."
fi

# Démarrage de php-fpm
echo "ce service PHP est désormais opérationel ! :)"
exec php-fpm
