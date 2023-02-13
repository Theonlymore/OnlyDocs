# Bitlocker

Outil de chiffrement de disque intégré à Windows.

## Chiffrement et export de clé de chiffrement


**/!\ Attention /!\** : Il faut bien être en **administrateur** pour pouvoir chiffrer un disque.


1. Créé un dossier avec le nom du poste : `mkdir %computername%`

2. Vérifier qu'il n'est pas déjà chiffrer.

- `manage-bde -status C:`

3. Créer une clé de récupération.

- `manage-bde -protectors -add c: -RecoveryKey "c:\%computername%\recovery.key"`

Vérifier que la clé est bien créé. (Afficher les fichier cachés + **fichiers système**) 

4. Chiffrer le disque.

- `manage-bde -on C: -skipHardwareTest`

Vérifier le statut du chiffrement. `manage-bde -status`

## Déchinffrement d'une partition d'un poste

- `manage-bde -off C:`

Il faut ensuite supprimer les anciennes clés de récupération : `manage-bde -protectors -remove C:`

### Sources

- [docsMs](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde-protectors)