# OnlyDocs

Bonjour, je vous souhaite la bienvenue sur mon site de documentation ! Vous trouverez ici mes notes sur les technologie que j'utilise ou apprends.



N'hésitez pas à me contacter via Discord (Alex_#7263) si des information son incorrect ou àposer des questions ! 

Merci pour votre visite.


## Comment

### Outil 

MkDocs est un outil en python qui me permet de faire passer des fichiers markdown en fichier web(html, css,..)

### Serveur

J'héberge mes sites sur serveur virtuel heberger par [Contabo](https://contabo.com/).


### Versioning et mise en ligne

J'utilise github pour herberger le [versioning](https://github.com/Theonlymore/OnlyDocs "Lien github vers le versioning du site") des docs/code.

Pour mettre à jour m'a docs, j'utilise une [github action](https://github.com/Theonlymore/MkdocsToS3 "Lien vers le fork de la github action que j'ai modifié") qui lance mkdocs pour créer les fichiers web envoyer ensuite en SFTP sur mon serveur.
