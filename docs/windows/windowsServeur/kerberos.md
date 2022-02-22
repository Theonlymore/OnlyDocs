# Kerberos

Kerberos est un protocole d'authentification réseau qui repose sur un mécanisme de chiffrement symétrique.

Chargé de :
- Authentifier
- Autoriser
- Surveiller
Les utilisateurs

**Kerberos permet le Single Sing-On (SSO).**

Le fonctionnement générale du protocole est simple :

Le principe de fonctionnement général est simple. L’utilisateur s’authentifie auprès du **service d’authentification** (le vigile). Celui-ci lui **donne un ticket d’accès prouvant qu’il s’est authentifié** (un badge). L’utilisateur se rend auprès du service de gestion des tickets. Il demande un accès au service de fichiers par exemple. Grâce au badge donné par le vigile le **service de ticket sait que l’utilisateur s’est bien authentifié**. Il va donc lui remettre un ticket d’accès au service de fichier. L’utilisateur peut maintenant aller voir le service de fichier avec son ticket. Le service lui donnera accès aux ressources correspondantes à ses autorisations.

### Sources
- [Wikipedia](https://fr.wikipedia.org/wiki/Kerberos_(protocole)
- [devensys.com](https://blog.devensys.com/kerberos-principe-de-fonctionnement/)