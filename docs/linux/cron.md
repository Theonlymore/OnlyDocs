# Fonctionnement de Cron

## C'est quoi Cron

Cron permet d'exécuter automatiquement des scripts,commandes ou logiciels à une date et heure précise ou selon un cycle défini.
Tout les utilisateurs on un fichier crontab qui lui permet d'indiquer les actions à exécuter.

## Comment cela marche 

Les taches planifiée cron sont dans le dossier : `/etc/crontab` et `/etc/cron.d/`
Il est déconseillé de modifier directement le fichier /etc/crontab. Les tâches qui y sont définies sont implicitement exécutées par root.

## Autorisation d'utilisation de crontab

- Les fichiers `cron.deny` et `cron.allow` contiennent une liste de noms d'utilisateur, chaque ligne comportant un seul nom.
- Si `cron.allow` existe, seuls les utilisateurs figurant dans ce fichier peuvent créer, modifier, afficher ou supprimer des fichiers crontab.
- Si `cron.allow` n'existe pas, tous les utilisateurs peuvent soumettre des fichiers crontab, à l'exception de ceux qui figurent dans `cron.deny`.
- Si ni `cron.allow` ni `cron.deny` n'existent, les privilèges de superutilisateur sont requis pour exécuter la commande crontab .

Exemple fichier : `cron.deny` ou `cron.allow`

```bash
root
username1
username2
username3
```



## Les commandes crontab 


- Afficher les actions : `crontab -l`
- Supprimer toutes les actions : `crontab -r`
- Editer les actions : `crontab -e` ( après il demande quel éditeur de texte choisir)

## La syntaxes de crontab

Format schématique de la syntaxe d'un **crontab**
```bash
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  user command to be executed
```

Exemple plus parlant :

```bash
mm hh jj MMM JJJ [user] tâche > log
```

- mm : minutes (00-59).
- hh : heures (00-23) .
- jj : jour du mois (01-31).
- MMM : mois (01-12 ou abréviation anglaise sur trois lettres : jan, feb, mar, apr, may, - jun, jul, aug, sep, oct, nov, dec).
- JJJ : jour de la semaine (1-7 ou abréviation anglaise sur trois lettres : mon, tue, wed, thu, fri, sat, sun).
- user (facultatif) : nom d'utilisateur avec lequel exécuter la tâche.
- tâche : commande à exécuter.
- log (facultatif) : redirection de la sortie vers un fichier de log. Si un fichier de log n'est pas spécifié, un mail sera envoyé à l'utilisateur local.

Dans chaque unité, nous pouvons utiliser les notations suivantes :
- 1-5 : les unités de temps de 1 à 5.
- */6 : toutes les 6 unités de temps (toutes les 6 heures par exemple).
- 2,7 : les unités de temps 2 et 7.

Quelque exemple :

**Bien vérifié que cron est lancé :  `/etc/init.d/cron status`** (problème eu dans Wls 2)

- Commande toute les 5 minutes : `*/5 * * * * echo "Je passe tout les minutes :)" >> $HOME/file`
- Exécution d'une commande toutes les minutes uniquement les lundis : `* * * * 1 /root/script/commandes-du-lundi.sh`

### Source : 
- [Vidéo de YvesRougyFR](https://www.youtube.com/watch?v=2Zqqlhc6bQE&t=8s)
- [Doc-ubuntu-fr.org](https://doc.ubuntu-fr.org/cron)
- [Linuxtricks](https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches)
- [Math-linux.com](https://www.math-linux.com/linux-2/commande-du-jour/article/ààprogrammation-des-actions-taches-regulieres-crontab)
- [Test de la valeur du crontab en ligne](https://crontab.guru/)

