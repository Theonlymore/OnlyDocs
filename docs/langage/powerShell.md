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

### Variable `$_`

Il s'agit de la variable correspondant à la valeur actuelle dans le pipeline.

### Input variable 

`Read-Host`  permet d'input une variable.

```powershell
$nom = Read-Host -Prompt 'Entre ton nom de famille'
$prenom = Read-Host -Prompt 'Entre ton prénom'
Write-Host "Bonjour, '$prenom' '$nom'" 
```

Cache l'input pour un mots de passe par exemple :

```powershell
$adminPassword = Read-Host -AsSecureString -Prompt 'Entre ton mots de passe administrateur'
```
## Tableau 

| Commandes                               | Description                          |
| --------------------------------------- | ------------------------------------ |
| `$data = @('Zero','One','Two','Three')` | Initialiser un tableau               |
| `$data = 'Zero','One','Two','Three'`    | Autre façon d'initialiser un tableau |
| `$data[0]`                              | Afficher premier élement             |
| `$data[1]`                              | Afficher deuxième élement            |

### Table de hachage

Une table de hachage est une structure de données, à l’instar d’un tableau, sauf que vous stockez chaque valeur (objet) à l’aide d’une clé. 

### Arguments sur un script

| Commandes | Description              |
| --------- | ------------------------ |
| `$arg[0]` | 1er paramètre du script  |
| `$arg[1]` | 2ème paramètre du script |

Exemple

| Script       | 1er paramètre | 2ème paramètre |
| ------------ | ------------- | -------------- |
| ./script.ps1 | hosts         | c:\windows     |
|              | `$arg[0]`     | `$arg[1]`      |


## Gestion des fichiers

Lister fichier qui finis par :

- `ls /windows/*.ini`

## Pipe

Lien entre les commandes, matérialisé par `|`.


### Exemple :

Cette commande liste tout les fichiers dans le dossier c:/windows et les écrits dans le fichier monWindows.txt

- `Get-ChildIten c:\windows | set-content monWindows.txt`

## Les filtres

Grâce aux pipeline, il est possible de filtrer le résultat de certaines commandes.



| Commandes principale et c'est alias                           |
| ------------------------------------------------------------- |
| get-service &#124; **where-object** {$_.status -eq 'stopped'} |
| get-service &#124; **where** {$_.status -eq 'stopped'}        |
| get-service &#124; **?** {$_.status -eq 'stopped'}            |


## Lecture de Csv

`ipcsv` est l'alias d'`Importe-csv`

#### Importation d'un CSV :

```powershell
Import-Csv -Path ".\EtudiantBTS.csv" -Delimiter ";"
```

Import-Csv :
`-Path` : Ou se trouve le fichier csv
`-Delimiter` : Quel élément délimite les arguments
`-Encoding` : à regarder si il y a des accents ou autres
`-Header` : Permet de choisir un titre précis

Importé le CSV : le mettre dans une variable puis listé chaque ligne

```powershell
$csv = Import-Csv -Path ".\EtudiantBTS.csv" -Delimiter ";" # jfkfjsskjk

foreach ($Ligne in $csv) {
    Write-Host $Ligne # mettre "$Ligne.phone" pour afficher tout les numéro de téléphone pour chaque ligne du fichier csv
}
```


#### Exploitation du fichier Csv

Sources :

- [Docs CCC](images/Powershell.pdf)
- [it-connect.fr](https://www.it-connect.fr/comment-lire-le-contenu-dun-fichier-csv-avec-powershell/)