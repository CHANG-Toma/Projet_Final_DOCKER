## TP Final - Projet Docker Compose

## Objectif :
Créer une configuration Docker Compose pour lancer deux services Nginx, deux services PHP et une base de données MySQL. Le projet consiste à exécuter le même site deux fois avec une base de données partagée.

## Note Docker
Docker compose up -d

## Les conteneurs Nginx

Serveur 1 : 

- via Traefik : localhost/nginx1 
- via le port : localhost:8081

Serveur 2 : 
- via Traefik : localhost/nginx2
- via le port : localhost:8082

## Les utilisateurs créés

Ne pas oublier d'exécuter : npm run dev

- Mail : nginx1@gmail.com | password : 12345678
- Mail : nginx2@gmail.com | password : 87654321

## Pour vérifier MySQL

- docker exec -it Projetfinaldocker mysql -u root -p
- USE Projetfinaldocker;
- SHOW TABLES;
