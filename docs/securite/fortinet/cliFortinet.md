# Cli sur Forti 

| Nom                 | Description             |
| ------------------- | ----------------------- |
| Liste les baux dhcp | execute dhcp lease-list |
 Les ip des interfaces|`sh sys interface` |

## Impossible de superviser un forti depuis une certain IP

Après de long recherche et tests et créant des "zone" snmp. Je n'ai pas réussi à trouver la solution malgré de nombreuse heure de recherche.

Malgré mon égo, j'ai du faire un ticket à notre préstataire (après 1 mois de discussion avec eux) et ils ont trouvé la solution.

Il s'agissait d'un problème de "trusthost" sur le forti (il ne faisait pas confiance à l'ip de supervision).

```bash
# config system admin
(admin) # edit admin
(admin) # set trusthost4 10.10.198.0/24
```



## [Forti reset sans mot de passe](https://community.fortinet.com/t5/FortiGate/Technical-Tip-Resetting-a-lost-Admin-password/ta-p/197045)

1. Ce connecter en cable console (etre en cli)
2. debrancher le forti 10 sec puis le rebrancher
3. Il propose des choses et choisir restore backup (default)



### Sources
- [FortinetCLI](FortiWebCLI.pdf)
- [geekstuff.org](https://geekstuff.org/ping-options-fortigate/)
- [resetForti](https://community.fortinet.com/t5/FortiGate/Technical-Tip-Resetting-a-lost-Admin-password/ta-p/197045)
