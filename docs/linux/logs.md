# Log : Message de texte horodaté

Ces informations sont utile pour diagnostiquer et monitorer les services.


# [Syslog](https://www.rfc-editor.org/rfc/rfc5424)

Syslog est utilisé sur **3** couches :

1. "syslog content" : Le contenu du message
2. "syslog application" : Le nom de l'application qui a généré le message (generation, interpretation, stockage)
3. "[syslog transport](https://www.rfc-editor.org/rfc/rfc5424)" : Le protocole utilisé pour l'envoi et la réception de logs.

Sous cette forme : 

```
 +---------------------+    +---------------------+
 |  content            |    |  content            |
 |---------------------|    |---------------------|
 |  syslog application |    |  syslog application | (originator,
 |                     |    |                     |  collector, relay)
 |---------------------|    |---------------------|
 |  syslog transport   |    |  syslog transport   | (transport sender,
 |                     |    |                     | (transport receiver)
 +---------------------+    +---------------------+
           ^                          ^
           |                          |
            --------------------------
```



### Path | Où sont stocké les logs

Les logs system sont stocké dans le répertoire `/var/log/`
Dans ce dossier il y a : 
- `auth.log` : Log des authentification
- `kernel.log` : Log du noyau
- `syslog` : Log des services
- `deamon.log` : Log des démons
...

### Commande pratique pour naviguer dans les logs depuis le terminal

| Commande | Description |
| --- | --- |
| `grep "error" /var/log/syslog` | Recherche les lignes contenant le mot "error" dans le fichier syslog |
| `grep "error" /var/log/` | wc | Compte le nombre de lignes contenant le mot "error" dans le fichier syslog |
| `tail -n 10 /var/log/syslog` | Affiche les 10 dernières lignes du fichier syslog et suit les modifications |

## Classification des logs de log

Niveau | Utilisation
--- | --- 
auth | Utilisé pour des évènements concernant la sécurité ou l'authentification à travers des applications d'accès (type SSH)
authpriv | Utilisé pour les messages relatifs au contrôle d'accès
daemon | Utilisé par les différents processus systèmes et d'application
kern | Utilisé pour les messages concernant le kernel
mail | Utilisé pour les évènements des services mail
user | Par défaut quand aucun n'est spécifié
local7 | Utilisé pour les messages du boot
`*` | Désigne tous les éléments
none | Ne désigne aucun élément

## [Niveau des logs](https://www.rfc-editor.org/rfc/rfc5424#section-6.2.1)

| Log Level | Signification |
| --- | --- |
| Emerg | urgence, système inutilisable |
| Alert | intervention immédiate nécessaire |
| Crit | erreur système critique |
| Err | erreur de fonctionnement |
| Warning | avertissement |
| Notice | évènement normaux devant être signalés |
| Info | pour information |
| Debug | message de déboguage |


## Serveur rsyslog

Exemple d'infra :

```
PC1    PC2    PC3
 |      |      |
 +------+------+
        |
     RSyslog
```

### Configuration serveur rsyslog

- `/etc/rsyslog.conf` : Fichier de configuration de rsyslog

Il faut décommenter la lignes de connecte de logs sur le port UDP 514 (défault) :

```
# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="514")
```

Ensuite restart rsyslog : `sudo systemctl restart rsyslog`


### Configuration client rsyslog

Il faut maintenant configurer les logs qu'il faut envoyé sur le serveur rsyslog.

- `/etc/rsyslog.d/50-default.conf` : Fichier de configuration de rsyslog

```
auth,authpriv.* @192.168.10.10:514
```

### Bonne pratique

Mettre en place du filtrage via ip source sur le firewall de la machine afin de ne pas recevoir des logs de n'importe qui.

## Logrotate

Logrotate eset un service qui permet de gérer la rotation et compression des logs.

### Configuration

- `/etc/logrotate.conf` : Fichier de configuration de logrotate


### Autres | Diagnostic

[Journalctl](https://www.malekal.com/comment-utiliser-journalctl-pour-voir-lire-journaux-linux-systemd/)

- `journalctl` : Affiche les logs du noyau

### Sources

- [Malekal](https://www.malekal.com/quels-sont-les-journaux-linux-var-log-et-comment-les-lire/)
- [yt YvesRougy 1 general log](https://www.youtube.com/watch?v=A3gnXcmzSWI) et [partie 2 plus technique](https://www.youtube.com/watch?v=46amJkJQBnk)
- [loggy.com](https://www.loggly.com/ultimate-guide/linux-logging-basics/)
- [openclassrooms - Thomas Roccia](https://openclassrooms.com/fr/courses/1750566-optimisez-la-securite-informatique-grace-au-monitoring/7144797-collectez-des-logs-avec-rsyslog-sous-linux)
- [malekal](https://www.malekal.com/rsyslog-logrotate-gerer-les-logs-et-journaux-linux/)