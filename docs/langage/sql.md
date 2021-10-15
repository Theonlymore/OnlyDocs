# SQL

Localisation de base de donnée

## Connexion et exécution de script

 Connexion à une base de donnée (via console linux)

- `mysql -u user -p`

Connexion à une base de donnée distante

- `mysql -u user -p -h < IP serveur Mysql >`

Quitter Mysql

- `quit`

Exécuter un script .sql

- `SOURCE chemin/Ficher.sql`

## Gestion des bases de données

Créer une Base de données

- `CREATE DATABASE nameDB;`

Afficher les bases de données existantes

- `SHOW DATABASES;`

Utiliser une base de données

- `USE nameDB;`

Effacer une base de données

- `DROP DATABASE nameDB;`

## Gestion des tables

Créer une table

- `CREATE TABLE nomTable;`

Afficher les tables existantes

- `SWOW TABLES;`

Afficher la structure d'une table 

- `DESCRIBE  nomDeLaTable;`

Effacer une table

- `DROP TABLE nomDeLaTable;`


## Utilisateurs / Permission

Créer utilisateur :

- `CREATE USER 'test'@'localhost' IDENTIFIED BY 'newpassword';`

Touts les permission sur une base de donnée :

- `GRANT ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';`


### Modifier une table 

- `ALTER  TABLE nomDeLaTable RENAME AS nouveauNomDeLaTable;`
- `ALTER  TABLE nomDeLaTable ADD  nomDeLaColonne   TypeDeValeurs;`
- `ALTER  TABLE  nomDeLaTable DROP  COLUMN  nomDeLaColonne;`










### Sources :

- [sql.sh](images/commandeSql.pdf)
- [w3schools](images/QuelquesCommandesMySQL.pdf)
- [rackspace](https://docs.rackspace.com/support/how-to/create-and-edit-users-in-mysql/)

