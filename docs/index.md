# OnlyDocs

## Pourquoi 

Cela me permet de noter facilement les choses.

## Comment

### Outil 

MkDocs est un outil en python qui me permet de faire passer mes fichiers markdown en fichier web (html, jjjcss,..)

### Serveur
J'utilise Aws avec un lien entre le service de stockage S3 et le CDN Cloudfront

### Nom de domaine

Route 53 de aws me permet de router le trafique qui arrive sur mon domaine.

### Interne et mise en ligne
J'utilise github pour le versioning des docs/code.

Pour mettre à jour les docs j'utilise une github action personnalisée qui lance mkdocs (pour pouvoir crées les fichiers web), par la suite les fichiers crés par mkdocs sont synchronisés avec S3 et pour finir la github action demande à cloudfront de mettre à jours le cache.

La github action est lancée à chaque mise à jour de la branche principal du répo github.

### Coût

95% des coûts sont du au nom de domaine (le reste stockage et CDN), le site me coûte environ 0,5 euro par mois.

Nom de domaines : 13 euros par ans.
- Ils étaient possibles d'avoir un domaine à un coût plus faible voire nul mais j'ai opté pour ce nom de domaine via route 53 d'aws

Coût final
- Routage : 0,5 euro par mois
- Nom de domaine 13 euros divisés par 12 mois cela fait 1,1 euro par mois
- Total : 1,6 euro par mois 

#### Bilan

Pour payer le moins chère possible il faudrait passé par un autre acteur qu'Aws pour le nom de domaine.



