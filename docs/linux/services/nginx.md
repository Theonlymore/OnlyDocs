# NGINX

NGINX est un serveur Web et un reverse proxy.

## Installation

- `apt install nginx`

## Configuration

- `nginx.conf`
    - Fichier de configuration globale du serveur.
- `mime-types`
Fichier configuration des sites web
- `/etc/nginx/sites-available/`


## Fichier configuration des sites

Répertoire : `/etc/nginx/sites-available/`


De sites-available à sites-enabled : `ln -s /etc/nginx/sites-available/001-rocheralexandre.com /etc/nginx/sites-enabled/`


## Reverse proxy

- ` vim /etc/nginx/sites-available/01-www.example.com.conf`

install : 

nginx, php7.3, php-fpm




## Reverse proxy

dans : `/etc/nginx/sites-available/01-www.example.com.conf`

```bash
upstream alex_wordpress{ # nom du serveur
    server 127.0.0.1:8080; # ip et port du serveur à 
}

upstream backend_apache{
    server 127.0.0.1:7080;
}

server {
    listen    80;
    server_name    www.example.com example.com;

    location /jenkins {
        include proxy_params;
        proxy_pass http://backend_jenkins;
    }

    location / {
        include proxy_params;
        proxy_pass http://backend_apache;
    }
}
```

### Explication 

upstream backend_jenkins{}

- définit un bloc “upstream” dont le nom est backend_jenkins. Ce bloc contient les adresses des serveurs de backend. Si plusieurs adresses sont configurées (une directive server par ligne), nginx va automatiquement répartir la charge entre ces serveurs

server {}

- c’est l’équivalent du <VirtualHost /> d’Apache, c’est dans ce bloc que vous allez configurer votre site

listen

- spécifie l’IP et le port correspondant

server_name

- précise les domaines valables pour ce site. Plusieurs domaines peuvent être précisés, séparés par des espaces

location /jenkins {}

- précise les règles qui s’appliquent aux adresses qui commencent par “/jenkins” (après le nom de domaine) comme http://www.example.com/jenkins

proxy_pass http://backend_jenkins;

- indique d’agir en tant que proxy et de transmettre les requêtes avec le protocole http vers les serveurs définis dans le bloc upstream “backend_jenkins”

include proxy_params;

- inclut les directives présentes dans le fichier /etc/nginx/proxy_params

### Pourquoi proxy_params

Le fichier  `proxy_params`  contient les directives les plus courantes pour les proxy web. Elles indiquent les entêtes HTTP à transmettre.

Cela permet à apache de savoir qu'un proxy lui transmet les requêtes et ainsi de connaître la véritable IP des clients.

### Source

- [doc.ubuntu](https://doc.ubuntu-fr.org/nginx)
- [openClassRooms-reverseProxy](https://openclassrooms.com/fr/courses/1733551-gerez-votre-serveur-linux-et-ses-services/5236081-mettez-en-place-un-reverse-proxy-avec-nginx)