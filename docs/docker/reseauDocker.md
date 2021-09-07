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

Le réseau Bridge est présent sur tous les hôtes Docker. Lors de la création d’un conteneur, si l’on ne spécifie pas un réseau particulier, le conteneur est connecté au Bridge **docker0**.

Lorsqu'un conteneurs utilisant le bridge est lancé, il est possible de voir avec `ip addr` l'interface : "docker0"

### Driver Bridge

Le réseau bridge est le plus couramment utilisé. Les conteneurs qui utilisent ce driver, ne peuvent communiquer qu’entre eux, cependant ils ne sont pas accessibles depuis l’extérieur si un mappage de port n'est pas mise en place.

Exemple de mappage de port avec run : `docker run -it -p 8000:5000 alpine` (`-p 8000:5000` permet de rediriger les paquets de l'hôte sur le port 8000 vers le port 5000 du conteneurs)

#### Schéma 
![Docker Bridge Network](image/dockerBridgeNetwork.jpg "Docker bridge schéma")

#### Approfondir sur le bridge dans docker
- https://blog.alphorm.com/reseau-docker-partie-1-bridge/


### Driver none

C’est le type de réseau idéal, si vous souhaitez interdire toute communication interne et externe avec votre conteneur, car votre conteneur sera dépourvu de toute interface réseau (sauf l’interface loopback).

### Driver host

Ce type de réseau permet aux conteneurs d’utiliser la même interface que l’hôte. Il supprime l’isolation réseau entre les conteneurs et seront par défaut accessibles de l’extérieur. Il prendra donc la IP que votre machine hôte.

### Driver overlay

> en cours

### Driver macvlan

Le driver macvlan permet d’attribuer une adresse MAC à un conteneur, le faisant apparaître comme un périphérique physique sur votre réseau. Le moteur Docker route le trafic vers les conteneurs en fonction de leurs adresses MAC.

- Alex : Pas totalement compris la notion 



## Manipulation du réseau dans Docker

Pour en savoir plus sur un driver : `network inspect bridge`

La commande pour créer un réseau Docker est la suivante :

```bash
docker network create --driver <DRIVER TYPE> <NETWORK NAME>
```

Dans cet exemple nous allons créer un réseau de type bridge nommé mon-bridge :

```bash
docker network create --driver bridge mon-bridge
```

On va ensuite lister les réseaux docker avec la commande suivante :

```bash
docker network ls
```

#### Résultat

```bash
NETWORK ID          NAME                     DRIVER              SCOPE
58b8305ce041        bridge                   bridge              local
91d7f01dad50        host                     host                local
ccdbdbf708db        mon-bridge               bridge              local
10ee25f56420        monimagedocker_default   bridge              local
6851e9b8e06e        none                     null                local
```

Il est possible de récolter des informations sur le réseau docker, comme par exemple la config réseau, en tapant la commande suivante :

```bash
[
    {
        "Name": "mon-bridge",
        "Id": "ccdbdbf708db7fa901b512c8256bc7f700a7914dfaf6e8182bb5183a95f8dd9b",
        ...
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.21.0.0/16",
                    "Gateway": "172.21.0.1"
                }
            ]
        },
        ...
        "Labels": {}
    }
]
```

#### Source :

- [wiki-tech.io](https://wiki-tech.io/Conteneurisation/Docker/R%C3%A9seau)
- [alphorm](https://blog.alphorm.com/reseau-docker-partie-1-bridge/)
- [devopssec](https://devopssec.fr/article/fonctionnement-manipulation-reseau-docker)



