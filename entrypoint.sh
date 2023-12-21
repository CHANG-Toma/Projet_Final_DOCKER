#!/bin/bash

# Attend que la base de données soit prête
echo "En attente de la base de données..."
sleep 10

# Exécute les commandes Laravel si le fichier artisan existe
if [ -f artisan ]; then
    php artisan key:generate
    php artisan migrate:fresh --seed
else
    echo "Pas de fichier artisan"
fi

# Lance php-fpm
exec php-fpm
