# Déployer OnlyDocs avec ArgoCD et Traefik

Cette page explique comment mettre en place le site avec ArgoCD et l'ingress controller Traefik.

## Construction de l'image

ArgoCD peut construire l'image directement depuis ce dépôt grâce au fichier
`k8s/build-image-job.yaml`. Ce Job utilise Kaniko pour créer l'image et la
pousser dans un registre interne `registry.default.svc.cluster.local:5000`.

Le Job s'exécute en phase **PreSync** puis le `Deployment` démarre le conteneur
à partir de l'image fraîchement construite lorsque vous appliquez
`k8s/argocd-app.yaml`.

## Installation d'ArgoCD et de Traefik

Installez ArgoCD sur votre cluster Kubernetes puis déployez Traefik en tant qu'ingress controller.

## Déploiement du site

Les manifestes Kubernetes se trouvent dans le dossier `k8s/` de ce dépôt.
Créez l'application ArgoCD avec :

```bash
kubectl apply -f k8s/argocd-app.yaml
```

ArgoCD appliquera ensuite le `Deployment`, le `Service` et l'`Ingress` pour exposer le site via Traefik.
