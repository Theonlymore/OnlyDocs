# Limitation des ressources sur les conteneurs

Dans un docker-compose :

| Limiter/réservation les ressources | Description |
| ---------------------- | ----------- |
| `--cpus` | Limite le nombre de CPU utilisé par le conteneur |
| `--memory` | Limite la mémoire utilisée par le conteneur |
| `--shm-size` | Limite la taille du segment mémoire partagé |
| `--blkio-weight` | Limite le poids du conteneur |
| `--blkio-weight-device` | Limite le poids du conteneur sur une ressource |
| `--blkio-device-read-bps` | Limite la vitesse de lecture du conteneur |
| `--blkio-device-write-bps` | Limite la vitesse d'écriture du conteneur |
| `--blkio-device-read-iops` | Limite la vitesse de lecture du conteneur |
| `--blkio-device-write-iops` | Limite la vitesse d'écriture du conteneur |
| `--device` | Limite le nombre de ressources utilisées par le conteneur |
| `--device-write-iops` | Limite la vitesse d'écriture du conteneur |
| `--kernel-memory` | Limite la mémoire utilisée par le conteneur |
| `--memory-reservation` | Limite la mémoire réservée par le conteneur |
| `--memory-swap` | Limite la mémoire swap du conteneur |
| `--memory-swappiness` | Limite la mémoire swap du conteneur |
| `--network` | Limite le nombre de réseau utilisé par le conteneur |
| `--pids` | Limite le nombre de processus du conteneur |
| `--pids-limit` | Limite le nombre de processus du conteneur |
| `--ulimit` | Limite le nombre de ressources utilisées par le conteneur |
| `--cpu-period` | Limite la durée de la période de calcul du conteneur |
| `--cpu-quota` | Limite le nombre de CPU utilisé par le conteneur |
| `--cpuset-cpus` | Limite le nombre de CPU utilisé par le conteneur |
| `--cpuset-mems` | Limite le nombre de mémoire utilisé par le conteneur |
| `--cpu-shares` | Limite le nombre de CPU utilisé par le conteneur |



Dans docker compose

    deploy:
      resources:
        reservations:
          cpus: "0.3"
          memory: "256M"
       