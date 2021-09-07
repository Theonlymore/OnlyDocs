# Réseau dans docker

## Introduction

Pour que les conteneurs Docker puissent communiquer entre eux et aussi avec la machine hôte et les réseaux externes, une couche réseau doit être mise en place. 


## Les Différents type de réseau sur Docker
![Docker Networking](image/dockerNetworking.png "Docker networking - Source : towardsdatascience")

### Par défaut

Lors de l’installation de Docker, trois réseaux sont créés automatiquement. On peut voir ces réseaux avec la commande docker network ls. Un réseau de type bridge est créé :

```bash
#docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
32cd2d55155f        bridge              bridge              local
b7fe5d1b69a7        host                host                local
de5ae709fdcd        none                null                local
```

Le réseau Bridge est présent sur tous les hôtes Docker. Lors de la création d’un conteneur, si l’on ne spécifie pas un réseau particulier, les conteneurs sont connectés au Bridge **docker0**.




### Bridge / docker0

#### Approfondir sur le bridge dans docker
- https://blog.alphorm.com/reseau-docker-partie-1-bridge/






Source :
- https://wiki-tech.io/Conteneurisation/Docker/R%C3%A9seau
- https://blog.alphorm.com/reseau-docker-partie-1-bridge/



