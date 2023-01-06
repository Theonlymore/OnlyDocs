# GPO

## Diagnostique GPO 

Voir les GPO active ;

- cmd: `gpresult`

Forcer activation de GPO :

- cmd: `gpupdate /force`
### Changer les politique de mot de passe.

- Editeur de gestion des stratégies de groupe.
- `configOrdi/ParaWindows/ParaSecu/StratéDeCompte/StratMdp`

### Installation de package msi

- `configUser/ParaLogi/InstallLogi`


Type de déploiement :

![DeploiementDeLogiciel](./images/DeploiementLogiciel.jpg)

 

Publié :

- Il ne s'installe pas automatiquement. L'utilisateur peut installer le logiciel s'il en a besoin.

Attribué :

- Installation automatique

Source :

- [Support-microsoft](https://docs.microsoft.com/fr-FR/troubleshoot/windows-server/group-policy/use-group-policy-to-install-software)