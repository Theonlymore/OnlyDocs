# Powershell

Langage de script destiné aux systèmes Windows  et plus particulèrement aux serveurs.

Organisation :

Les commandes de powershell sont appelées des *cmdlets*. Elles sont pour la plupart concstituée de la manière suivante : `verbe`, `tiret`, `nom` : ( `verbe-nom` ).

Aides sur un cmdlet : `Get-Help cmdlet -Detailed | more`

Listes :

- Liste de `cmdlet` : `Get-command -commandtype cmdlet`
- Liste de `Verb` : `Get-Command -Verb write`
- Liste de `nom` : `Get-command -Nnoun object`
- Liste personnaliser : `Get-command write-*`

## Fondamentaux

### Variables

Commancent par `$`.
Il y a des variables systèmes, des variables à définir vous même.

Exemple de commande lier au variables.

String dans un variable :

- `$maVariable= 'Bonjour le monde'`

Analyser un objet / variable

- `$maVariable | get-Member

Mettre string en maj

- `$maVariable.toUpper()

Nombre charactère

- `$maVariable.length`


## Gestion des fichiers

Lister fichier qui finis par :

- `ls /windows/*.ini`

## Pipe

Lien entre les commandes, matérialisé par `|`.

### Exemple :

Cette commande liste tout les fichiers dans le dossier c:/windows et les écrits dans le fichier monWindows.txt

- `Get-ChildIten c:\windows | set-content monWindows.txt`



Sources :

- [Docs CCC](images/Powershell.pdf)