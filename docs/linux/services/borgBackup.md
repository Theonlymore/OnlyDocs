# Borg

Borg est un outil de sauvegard incrémentielle simple mais très puissant écrit en Python.

Borg fait des sauvegard découpé en une multitude de tronçons et Borg ne sauvegard que les tronçons qui ont été modifiés depuis la dernière sauvegrade.

## Particularités

- **Optimisation de l'espace de disque** grace à la sauvegard incrémentielle.
- **Vitesse** 
- **Chiffrement des données**, Toutes les données peuvent êtres chiffrer avec l'AES 256-bit
- **Compression** Toutes les données peuvent être compressées
- **Sauvegard hors site via SSH**
- **Sauvegardes montables comme un simple système de fichier**

## Utilisation en ligne de commande

| Commande | Description | Description supplémentaires |
| ----     | ----  | ----- |
| borg init -e none /path | Création d'un dépot pour gérer les sauvegardes | "-e none" signifie pas de chiffrement de la sauvegarde |
| borg create /path-to-repo::FileArchive ~/src ~/Documents | borg create -v --stats



### Sources
- [Doc de BorgBackup](https://borgbackup.readthedocs.io/en/stable/usage/general.html)
- [Doc.ubuntu](https://doc.ubuntu-fr.org/borgbackup)