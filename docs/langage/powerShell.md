# Powershell

Langage de script destiner aux systèmes Windows et plus particulèrement aux serveurs.

## Organisation 

Les commandes de powershell sont appelées des *cmdlets*. Elles sont pour la plupart concstituée de la manière suivante : `verbe`, `tiret`, `nom` : ( `verbe-nom` ).

Aides sur un cmdlet : `Get-Help cmdlet -Detailed | more`

Listes :

- Liste de `cmdlet` : `Get-command -commandtype cmdlet`
- Liste de `Verb` : `Get-Command -Verb write`
- Liste de `nom` : `Get-command -Nnoun object`
- Liste personnaliser : `Get-command write-*`


## Variables

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


## Tableau 

| Commandes | Description |
| ---- | ---- |
| `$data = @('Zero','One','Two','Three')`| Initialiser un tableau |
| `$data = 'Zero','One','Two','Three'` | Autre façon d'initialiser un tableau | 
| `$data[0]` | Afficher premier élement |
| `$data[1]` | Afficher deuxième élement |

### Table de hachage

Une table de hachage est une structure de données, à l’instar d’un tableau, sauf que vous stockez chaque valeur (objet) à l’aide d’une clé. 

### Arguments sur un script

| Commandes | Description |
| -----|--- |
| `$arg[0]` | 1er paramètre du script | 
| `$arg[1]`| 2ème paramètre du script |

Exemple

| Script | 1er paramètre | 2ème paramètre |
| ----|----|---|
./script.ps1 | hosts | c:\windows |
| | `$arg[0]` | `$arg[1]`|


## Gestion des fichiers

Lister fichier qui finis par :

- `ls /windows/*.ini`

## Pipe

Lien entre les commandes, matérialisé par `|`.

### Variable `$_`

Il s'agit de la variable correspondant à la valeur actuelle dans le pipeline.


### Exemple :

Cette commande liste tout les fichiers dans le dossier c:/windows et les écrits dans le fichier monWindows.txt

- `Get-ChildIten c:\windows | set-content monWindows.txt`

## Les filtres

Grâce aux pipeline, il est possible de filtrer le résultat de certaines commandes.



| Commandes principale et c'est alias |
| ----- |
| get-service &#124; **where-object** {$_.status -eq 'stopped'} |
| get-service &#124; **where** {$_.status -eq 'stopped'} |
| get-service &#124; **?** {$_.status -eq 'stopped'} |



Sources :

- [Docs CCC](images/Powershell.pdf)