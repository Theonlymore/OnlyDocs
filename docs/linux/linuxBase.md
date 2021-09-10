# Base linux :

Commande de systeme :

- `reboot`	Redémarre
- `shutdown` -now	Éteint sans délais
- `systemctl` (start/stop/restart/status) <service>	Démarre/Arrête/Redémarre/Affiche le statut d’un service
- `hostname` Affiche le nom d’hôte de la machine
- `hostname` -I	Affiche l’adresse IP de l’hôte
- `date`	Afficher la date et l’heure du système
- `cal`	Affiche le calendrier du mois
- `whoami`	Affiche où nous sommes connecté en tant que qui
- `screenfetch`	Affiche les informations systèmes (nécessite le paquet screenfetch)



## Permission 

Voir les droits sur les fichiers du dossier : `ls -l`

### Schéma du fonctionnement des droits les fichiers.

![Droits linux](image/linuxDroits.png)

Les droits peuvent être définit en octal : 4 pour read, 2 pour write, 1 pour execute : [ r w x] [ r - x] [ - - -] => 750

### Manipulation des droits

- `chmod [-R] <droits> <fichiers>` : Changement des droits
- `chown` : Change de propriétaire
- `chgrp` : Change le groupe du propriétaire.

## Gestion des paquets

- `apt-get update` : Mets à jour la liste des paquets depuis
/etc/apt/sources.list
- `apt-get upgrade` Mets à jour le système.
- `apt install <paquet>` Installe le paquet
- apt-get remove <paquet> Désinstalle le paquet. 
- `apt-get remove <paquet> -- purge` Désinstalle complètement le paquet.
- `apt-cache show <paquet>` Donne des Informations sur le paquet.
- `apt-cache search <paquet>` Recherche un paquet.
- `apt-cache depends <paquet> `Recherche les dépendances d’un paquet.
- `apt-get clean` Vide le cache disque des paquets

## Les processus

- `ps` Affiche les processus en cours d’exécution. 
- `pstree` Affiche l’arborescence des processus. 
- `top` Affiche les processus en temps réel.
- `ctrl + c` Arrête un processus.
- `kill` Termine un processus. 
- `uname -a` Affiche le nom de la machine, le noyau,...
- `uptime` Affiche l'heure d'allumage, la charge, ...
- `w`	Affiche les utilisateurs actuellement connectés en SSH (date/heure/IP)
- `last reboot`	Afficher l’historique des redémarrages





