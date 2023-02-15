# Les bases avec docker 

## Démarrage d'un conteneur

> docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]

Quelque options :

- `-i` Garder le STDIN ouvert (même si pas attaché), sur ubuntu par défault cela lance sur bash
- `-t` Allouer un pseudo au terminal
- `-p` Configurer le port
- `-d` Conteneur en tâche de fond ( mode deamon)
- `-v`Lier un volume au conteneur ex :`docker run -it -v /local/:/conteneur/ ubuntu`
- `-c` Crée un partage de ressource cpu (limite,quota,etc...)
- `-e` Forcer Docker à utiliser Variable d'environnement définie
- `--name` Choisir un nom au conteneur afin de l'identifier via ce nom a la place de l'id ex : `docker run -it --name jean-alexandre ubuntu`
- `--dns` DNS personnalisé
- `--net="<mode>"` Définir le type de réseau : Bridge,none,container et host
Rentrer dans un conteneur : 
- `docker exec -ti nomConteneur bash`

## Installation 

[DocsOfficielDocker-installDebian](https://docs.docker.com/engine/install/debian/)

## Monitoring basique

- [ctop.sh](https://ctop.sh/)

### Source

- [Tech2tech](https://www.tech2tech.fr/debuter-avec-docker-les-bases/)
- [Devopssec](https://devopssec.fr/article/decouverte-et-installation-de-docker)


