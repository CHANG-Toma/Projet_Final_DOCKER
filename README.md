## TP Final - Projet Docker

## Membres du groupe:
- CHANG Toma
- RIMANI Ilies
- GARCHI Adam

## Objectif :
Créer une configuration Docker Compose pour lancer deux services Nginx, deux services PHP et une base de données MySQL. Le projet consiste à exécuter le même site deux fois avec une base de données partagée.

## Note Docker
- Docker compose up -d

- Toutes les dépendances de l'application Laravel sont automatisées via un point d'entrée exécuté via le Dockerfile des services PHP (voir entrypoint.sh pour le script).

## Les conteneurs Nginx

Serveur 1 : (Nginx1)

- via Traefik : localhost:8081

Serveur 2 : (Nginx2) 

- via Traefik : localhost:8082

## Les utilisateurs créés

- Mail : nginx1@gmail.com | password : 12345678
- Mail : nginx2@gmail.com | password : 87654321

## Pour vérifier MySQL

- docker exec -it Projetfinaldocker mysql -u root -p
- USE Projetfinaldocker;
- SHOW TABLES;
