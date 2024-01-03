#!/bin/bash

# Attend que la base de données soit prête
echo "En attente de la base de données..."
sleep 5

# Exécute les commandes Laravel si le fichier artisan existe
if [ -f artisan ]; then
    php artisan key:generate
    php artisan migrate --seed  # Modifié pour ne pas supprimer les tables existantes
else
    echo "Pas de fichier artisan"
fi

# Lance php-fpm
exec php-fpm
