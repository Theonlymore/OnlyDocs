# HSRP : Hot Stanbdy Router Protocol

Protocole propriétaire de **continuité de service** implémenté dans les routeurs Cisco.

HSRP sert à **augmenter la tolérance de panne** sur le réseau en **créant un routeur virtuel** à partir de 2 (ou plus) routeurs physique.


## Fonctionnement 

**HSRP** permet qu'un **routeur de secours** ( "spare" ) prenne immédiatement, de façon transparente, le relais dès qu'un problème physique apparaît sur le routeur principal.

En partageant une seule même adresse ip et mac, **plusieurs routeurs peuvent être considérés comme un seul routeur "virtuel"**. Les membres du groupe de ce routeur virtuel sont capables de s'échanger des messages d'état et des informations.

Le routeurs appartenant à un même groupe hsrp ("standby group") élisent un routeur primaire (active router) pour traiter les paquets à destination des adresse IP et mac du routeur virtuel. Un routeur secondaire (stadby router ) remplacera le rout primaire en cas de problème .

# Sécurité

- L'hsrp utilise pour s'authentifier un mot de passe qui passe en clair sur le réseau
- Multicast 

Solution :

- cisco utilise le md5 pour le hachage de mot de passe
- Vérification stricte des adresse ip