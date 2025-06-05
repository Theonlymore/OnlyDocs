# OnlyDocs

## Pourquoi

Cela me permet de noter facilement les choses.

## Comment

### Outil

MkDocs est un outil en Python qui me permet de convertir mes fichiers Markdown en fichiers web (HTML, CSS, ...)

### Serveur
J'utilise AWS avec un lien entre le service de stockage S3 et le CDN CloudFront

### Nom de domaine

Route 53 d'AWS me permet de router le trafic qui arrive sur mon domaine.

### Interne et mise en ligne
J'utilise GitHub pour le [versioning](https://github.com/Theonlymore/OnlyDocs "Lien GitHub vers le versioning du site") des docs/code.

Pour mettre à jour les docs j'utilise deux GitHub Actions : une [personnalisée](https://github.com/Theonlymore/MkdocsToS3 "Lien vers le fork de la GitHub Action que j'ai modifiée") qui lance MkDocs (pour générer les fichiers web). Les fichiers créés sont ensuite synchronisés avec S3 et, pour finir, la [deuxième GitHub Action](https://github.com/chetan/invalidate-cloudfront-action "GitHub Action pour CloudFront") demande à CloudFront de mettre à jour le cache.

Ces GitHub Actions se lancent à chaque mise à jour de la branche principale du dépôt GitHub.

### Les Coûts

95 % des coûts proviennent du nom de domaine (le reste concerne le stockage et le CDN). Le site me coûte environ 0,5 € par mois hors prix du nom de domaine.

Nom de domaine : 13 € par an.
- Il était possible d'avoir un domaine à moindre coût, voire gratuit, mais j'ai opté pour ce nom de domaine via Route 53 d'AWS.

Coût final
- Routage : 0,5 € par mois
- Nom de domaine : 13 € divisés par 12 mois, soit 1,1 € par mois
- Total : 1,6 € par mois

#### Bilan

Pour payer le moins cher possible, il faudrait passer par un autre acteur qu'AWS pour le nom de domaine.

## Construire l'image Docker

Ce dépôt contient un `Dockerfile` vous permettant de créer l'image Docker du site sans utiliser d'image préconstruite. Après avoir cloné ce dépôt :

```bash
# Cloner le code depuis GitHub
git clone https://github.com/Theonlymore/OnlyDocs.git
cd OnlyDocs

# Construire l'image
docker build -t onlydocs:latest .

# (Optionnel) lancer le conteneur localement
docker run -p 8080:80 onlydocs:latest
```

Vous obtenez ainsi une image construite à partir du code source présent sur GitHub uniquement.
Si vous déployez via ArgoCD, le Job `k8s/build-image-job.yaml` s'occupe
également de construire cette image avant de lancer le site.
