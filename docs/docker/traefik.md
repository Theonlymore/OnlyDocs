# Traefik

Traefik est un reverse proxy/répartiteur de charge, OpenSource et gratuit.

Docker-compose de base pour traefik.

```yaml
version: "3.3"

services:

  traefik:
    image: "traefik:v2.5"
    container_name: "traefik"
    command:
      #- "--log.level=DEBUG"
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
    ports:
      - "80:80"
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock:ro"

  whoami:
    image: "traefik/whoami"
    container_name: "simple-service"
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.whoami.rule=Host(`whoami.localhost`)"
      - "traefik.http.routers.whoami.entrypoints=web"
```

En cours

### Sources
- [doc.traefik](https://doc.traefik.io/traefik/)
- [wiki-tech](https://wiki-tech.io/Conteneurisation/Docker/Traefik)
- [xavki](https://www.youtube.com/watch?v=6CFjKvPheCU)
- [devoxxFR](https://www.youtube.com/watch?v=QvAz9mVx5TI)
