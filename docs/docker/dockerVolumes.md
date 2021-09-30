# Volume dans Docker 

## Localisation 

- `var/lib/docker/volumes/`

## Créer volume

- `docker volume create testVolume`

## Analyse de volume

- `docker volume inspect testVolume`

## Docker run avec volume 

Exemple :

- `docker run -tid -name web -p 8080:80 --mount source=testVolume,target=/usr/share/nginx/html nginx

### Source :

[xavki](https://www.youtube.com/watch?v=fNxHtOJsWSc)