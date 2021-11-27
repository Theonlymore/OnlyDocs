# OnlyDocs

## Pourquoi 

Ce site me permet d'accéder et de rendre publique les documentations que j’utilise ainsi que les partager.

## Comment

### Outil 

MkDocs est un outil en python qui me permet de faire passer mes fichiers markdown en fichier web (html, css,..)

### Serveur

J'héberge ce site web chez Aws grâce à un lien entre S3 (Stockage) et le CDN (Content Delivery Network) Cloudfront.

### Nom de domaine

Route 53 d'Aws me permet de gérer la zone dns du nom de domaine.
### Versioning et mise en ligne

J'utilise github pour le [versioning](https://github.com/Theonlymore/OnlyDocs "Lien github vers le versioning du site") des docs/code.

Pour mettre à jour les docs j'utilise deux github action, une [personnalisé](https://github.com/Theonlymore/MkdocsToS3 "Lien vers le fork de la github action que j'ai modifié") qui lance mkdocs (pour pouvoir créer les fichiers web), les fichiers créés par mkdocs sont ensuite synchronisés avec S3 et pour finir la [deuxième github action](https://github.com/chetan/invalidate-cloudfront-action "Github action pour cloudfront") demande à cloudfront de mettre à jour le cache.

La github action est lancée à chaque mise à jour de la branche principale ("fetch origin") du répo github.

### Les Coûts

95% des coûts sont du au nom de domaine (le reste stockage et CDN), le site me coûte environ 0,5 euro par mois hors prix de nom de domaine.

Nom de domaine : 13 euros par ans.
- Ils étaient possibles d'avoir un domaine à un coût plus faible voire nul mais j'ai opté pour ce nom de domaine via route 53 d'aws

Coût final
- Route53/Routage : 0,5 euro par mois
- Nom de domaine 13 euros divisés par 12 mois cela fait 1,1 euro par mois
- Total : 1,6 euro par mois 

### Bilan

Pour payer le moins chère possible il faudrait passé par un autre acteur qu'Aws pour le nom de domaine.