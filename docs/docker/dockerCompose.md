# Docker compose

Docker Compose est un outil permettant de définir le comportement de vos conteneurs et d’exécuter des applications Docker à conteneurs multiples. La config se fait à partir d'un fichier YAML, et ensuite, avec une seule commande, vous créez et démarrez tous vos conteneurs de votre configuration.
## Pourquoi 

- Meilleure gestion des dépendances (réseau, volumes...)
- Un service comprend 1 à plusieurs conteneurs
- Comme pour dockerfile : partage facile, versionning....

## [Installation](https://docs.docker.com/compose/install/) 

Prendre la bonne version dans les releases.

```bash
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

Vérification 

```bash
docker-compose --version
```

## Principales commandes 

- `docker-compose up`
- `docker-compose create/start`

### Lancement de service :

- `docker-compose build`
	- construction uniquement des images

- `docker-compose up`
	- build et run des images

- `docker-compose up -d`
	- mode détaché (docker run -d)

## Gestion du service

- `docker-compose ps `
- `docker-compose start `
- `docker-compose stop `
- `docker-compose rm `

## Exemple d'un `docker-compose.yml`

```yml
version: '3.3'

services:
   db:
     container_name: mysql
     image: mysql:5.7
     volumes:
       - wp_db:/var/lib/mysql/
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
     networks:
     - wp

   wordpress:
     depends_on:
       - db
     container_name: wordpress
     image: wordpress:latest
     volumes:
       - wp_statics:/var/www/html/
     ports:
       - 8000:80
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
     networks:
     - wp


networks:
  wp:

volumes:
  wp_db:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /srv/wordpress/db
  wp_statics:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /srv/wordpress/statics

```

### Limitation de ressource 


```yml
service:
  image: nginx
  mem_limit: 512m
  mem_reservation: 128M
  cpus: 0.5
  ports:
    - "80:80"
```

### Scale 

`docker-compose scale container=10`

Cette commande lance 10 fois le container.

### Réseau dans docker-compose

Mettre le service dans un réseau qui existe déjà.

```yaml
services:
  # ...
networks:
  default:
    external: true
    name: my-pre-existing-network
```

### Source 
- [Xavki](https://gitlab.com/xavki/presentations-dockercompose)
- [Devopssec](https://devopssec.fr/article/gerez-vos-conteneurs-docker-compose#begin-article-section)
- [Baeldung limite Ram/cpu](https://www.baeldung.com/ops/docker-memory-limit)
- [dockerRun-->dockerCompose](https://www.composerize.com/)

#### -Cheat sheet
- [devhints.io](https://devhints.io/docker-compose)