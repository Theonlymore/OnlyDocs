# Active directory

## AGDLP

La méthode AGDLP est un principe de gestion des droits d'accès aux ressources partagées d'une entreprise, préconisé par Microsoft.

![AGDLP](images/agdlp.jpg)

## Nommenclature des groupes

- Groupe Domain Local : `DSG`
- Groupe Global : `GSG` 

### Global

- `Orga`: Organisation
- `Status` : Statut
- `Geo` : Géographie
- `Service` : Service

Exemple : `GSG_Service_Productions`

Optionnel : `U` ou `C` pour le computer ou user

### Local 

- `WR` : Write et read
- `R` : Read
- `CL` : Controle total
- `noAccess` : Aucun accès

Exemple : `DSG_Sharefile_Share1_Productions-RW`

- `Sharefile` : type de ressource
  - `Server`
  - `Application`
  -` SharePrint`
- `Share1` : Serveur
- `Productions` : Nom du partage

Optionnel : `u` ou `c` pour le computer ou user

## Aide autres

Dans utilisateurs et ordinateurs > affichage > fonctionnalité avancé

Maintenant on peux voir tout les attributs de l'objet : par exemple sur un utilisateur on peux voir :
- pwdLastSet : indique la date et l'heure à laquelle le mot de passe de l'utilisateur a été modifié pour la dernière fois
- BadPwdCode : Nombre de fois ou cela a échoué.

Lancer explorateur depuis autre user : `runas /user:domaine\user explorer.exe`

### Exemple :

![exempleAgdp](images/agdlpExemple.png)
