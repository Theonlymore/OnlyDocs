# Les bases avec docker 

## Démarrage d'un conteneur

> docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]

Les options :

- `-i` Garder le STDIN ouvert (même si pas attaché), sur ubuntu par défault cela lance sur bash
- `-t` Allouer un pseudo au terminal
- `-p` Configurer le port
- `-d` Conteneur en tâche de fond ( mode deamon)
- `-v`Lier un volume au conteneur
<!-- https://www.tech2tech.fr/debuter-avec-docker-les-bases/ -->


exemple :
> volume : docker run -it -v /local/:/conteneur/ ubuntu