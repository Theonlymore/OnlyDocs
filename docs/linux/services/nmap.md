# NMAP

Nmap permet de le scanne de port et permet d'identifier les ports ouverts, les services, l'os, ...

### Scan ping d'un réseau 

* `nmap -sn -T4 -n 10.1.0.0/16 -oX range10-2.xml`

**Explication :**

* `-sn` : Scan de ping.
* [`-T4`](https://www.explainshell.com/explain?cmd=nmap+-T4+-A+-p-+-v+10.10.10.29) : Type de ping : 10ms max par scan.
* `-oX range.xml` : sortir les données données par nmap dans un fichier xml.

*Pour connaître la progression du scan faire : `espace` *

Pour avoir les adresse mac en output, il faut **être dans le même réseau**

## Diagnostique 

Savoir vers quelle machine le scan va être fait : `-sL (Scan liste)`

## Les types de réponse 

| Réponse    | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| Open       | Le port ouvert, il répond                                      |
| Closed     | Le port répond mais il n'y a pas d'application derrière        |
| Filtered   | Un filtre empeche d'atteindre le port.                         |
| Unfiltered | Ne sais pas si le port est ouvert ou fermé mais ACK fonctionne |


### Sources

- Man nmap
- [Docs officiel NMAP](https://nmap.org)
