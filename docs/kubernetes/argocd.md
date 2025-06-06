# Déployer OnlyDocs avec ArgoCD et Traefik

Cette page explique comment mettre en place le site avec ArgoCD et l'ingress controller Traefik.

## Construction de l'image

L'image Docker est désormais construite par une GitHub Action et poussée sur GitHub Container Registry. Le `Deployment` utilise donc l'image `ghcr.io/theonlymore/onlydocs:latest` lors du déploiement.

## Installation d'ArgoCD et de Traefik

Installez ArgoCD sur votre cluster Kubernetes puis déployez Traefik en tant qu'ingress controller.

## Déploiement du site

Les manifestes Kubernetes se trouvent dans le dossier `k8s/` de ce dépôt.
Créez l'application ArgoCD avec :

```bash
kubectl apply -f k8s/argocd-app.yaml
```

ArgoCD appliquera ensuite le `Deployment`, le `Service` et l'`Ingress` pour exposer le site via Traefik.
