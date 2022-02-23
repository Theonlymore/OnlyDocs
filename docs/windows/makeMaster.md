# Master d'un PC

## Pourquoi

La création d'un Master permet permet par exemple au entreprises d'avoir une image machine type (avec Office, ERP, ...)


### Sysprep

`sysprep /oobe /generalize /shutdown /unattend=fichier.xml`

- `/oobe` : permet d'avoir  l'écran de configuration initiale dans lequel, il est possible de personnaliser les informations sur le système d'exploitation.
- `/generalize` : permet le déploiement de Windows sur d’autre type de matériel (il supprime pilote, identifiant unique, ...)
- `/shutdown` : permet d'étendre le pc après le sysprep
- `/unattend=` : Liste les paramètres à lancer au démarage après le sysprep.

### Rendre sont image moins lourd

Supprimer :
- **profils** `système > Paramètres avancés du système > Paramètres système avancés > [Profil ds utilisateurs > Paramètres]
- **temp** : `Windows + R` > `cleanmgr`
- `c:/Windows/Temp`
- `c:/Windows/SoftwareDistribution` (net stop wuauserv & dosvc )



### Sources

- [docs.microsoft](https://docs.microsoft.com/fr-fr/windows-hardware/manufacture/desktop/sysprep--generalize--a-windows-installation?view=windows-11)
- [Unattend](https://www.windowsafg.com/win10x86_x64_uefi.html)