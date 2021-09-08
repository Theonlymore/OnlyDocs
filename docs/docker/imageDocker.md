# Introduction

Cette documentation à pour but de créer vos propres images avec le Dockerfile, et pusher vos images vers le Hub Docker.

### Quequ'une images Docker ?

 Une image Docker est composé de plusieurs couches, ces couches contiennent l'application ainsi que les fichiers binaires et les bibliothèques requises.

 Exemple des couches pour créer une image d'un serveur web :

 - Une couche OS
 - Une couche Apache pour démarrer le seveur web.
 - Une couche php 
 - Une couche Mysql

Schéma de l'image :

![Schéma image lamp](image/dockerImageLamp.jpg)

## Les différentes instructions du Dockerfile

Inscructions Dockerfile les plus utiliser :

-  `FROM` : Définit l'image de base qui sera utilisée par les instructions suivantes.
- `LABEL` : Métadonnées de l'image ( auteur par exemple)
- `ARG` : Variablies tempodraires utilisables dans le Dockerfile.
- `ENV` : Variable d'environnements utilisables dans le Dockerfile et le conteneur.
- `RUN` : Exécute des commandes Linux ou Windows lors de la création de l'image.
- `COPY` : Permet de copier des fichiers depuis notre machine locale vers le conteneur Docker.
- `ADD` : Même chose que COPY mais prend en charge des liens ou des archives (si le format est reconnu, alors il sera décompressé à la volée).
- `ENTRYPOINT` : [Docs](https://aws.amazon.com/fr/blogs/france/demystifier-entrypoint-et-cmd-dans-docker/)
- `WORKDIR` : Définit le répertoire de travail qui sera utilisé pour le lancement des commandes CMD et/ou ENTRYPOINT et ça sera aussi le dossier courant lors du démarrage du conteneur.
- `WORKDIR` : Définit le répertoire de travail qui sera utilisé pour le lancement des commandes CMD et/ou ENTRYPOINT et ça sera aussi le dossier courant lors du démarrage du conteneur.
- `EXPOSE` : Expose un port.
- `VOLUMES` : Crée un point de montage qui permettra de persister les données.
- `USER` : Désigne quel est l'utilisateur qui lancera les prochaines instructions RUN, CMD ou ENTRYPOINT (par défaut c'est l'utilisateur root).


## Source 

- [Devopssec](https://devopssec.fr/article/creer-ses-propres-images-docker-dockerfile)
- [wiki-tech.io](https://wiki-tech.io/Conteneurisation/Docker/Image)
- [docs.docker.com](https://docs.docker.com/engine/reference/builder/)

EN cours