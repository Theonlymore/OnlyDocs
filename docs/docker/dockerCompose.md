# Docker compose

## Pourquoi 

- meilleure gestion des dépendances (réseau, volumes...)
- un service comprend 1 à plusieurs conteneurs
- comme pour dockerfile : partage facile, versionning....

## Installation 

```bash
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

## Principales commandes 

- un répertoire avec docker-compose.yml

- commandes similaires à docker (intuitives)


### Lancement du service :

- docker-compose build
	- construction uniquement des images

- docker-compose up
	- build et run des images

- docker-compose up -d
	- mode détaché (docker run -d)

## Gestion du service

- `Docker-compose ps `
- `docker-compose start `
- `docker-compose stop `
- `docker-compose rm `

## Exemple d'un `docker-compose.yml`

```yml
version: '3'

services:
  myfirstservice:
    image: alpine
    restart: always
    container_name: MyAlpine
    entrypoint: ps aux
```
### Source :
  
- [Xavki](https://gitlab.com/xavki/presentations-dockercompose)