# Sommaire I. Rappel sur les sept couches OSI
- Les différentes couches du modèle
- Les 7 couches
- La couche physique
- La couche liaison de données
- La couche réseau
- Couche transport
- La couche session
- La couche présentation
- La couche application
- II. Les utilitaires de connectivité
- Le dysfonctionnement ou la mauvaise configuration du protocole TCP/IP
- Ping (un acronyme de Packet internet groper)
- La commande IPCONFIG
- Le Protocole de Résolution d'Adresse (ARP)
- 2.2. Les problèmes de média
- 2.3. Les problèmes de résolution de noms
- La résolution de noms et le fichier <hosts>
- 2.4. Les problèmes de performance de réseau
- La commande Tracert
- La commande Netstat
- La commande Nbtstat
- 2.5. Résumé des commandes

- 3 III. Diagnostiquer et tester les couches OSI
- 3.1. Utilisation d’une approche structurée du dépannage
- 3.2. Test sur la base des couches OSI
- Dépannage de la couche 1 à l’aide des témoins lumineux
- Dépannage de la couche 3 à l’aide de la commande ping
- Dépannage de la couche 7 à l’aide de la commande Telnet
- IV. Rappel sur les commandes de dépannage des routeurs Cisco
- 4.1. Commande show ip route
- 4.2. Les commandes debug
- 4.3. Commande show Controller
- 4.4. Les commandes show ip protocols et show ip route
- 4.5. La commande traceroute
- 4.6. La commande show cdp
- 4.7. La commande show interfaces
- 4.8. Dépannage de la liaison série
- Présentation des communications série
- ETCD/ETTD
- Protocole HDLC
- Dépannage d'une interface série
- Le protocole PPP

## 4 I. Rappel sur les sept couches OSI

La couche physique s'occupe de la transmission des bits de façon brute sur un canal de communication. Cette couche doit garantir la parfaite transmission des données

## 5 La couche liaison de données

Son rôle est un rôle de "liant" : elle va transformer la couche physique en une liaison a priori dégagé d'erreurs de transmission pour la couche réseau. Elle fractionne les données d'entrée de l'émetteur en trames, transmet ces trames en séquence et gère les trames d'acquittement renvoyées par le récepteur. Rappelons que pour la couche physique, les données n'ont aucune signification particulière. La couche liaison de données doit donc être capable de reconnaître les frontières des trames.

## 6 La couche réseau

C'est la couche qui permet de gérer le sous-réseau, le routage des paquets sur ce sous-réseau et l'interconnexion des différents sous-réseaux entre eux. Au moment de sa conception, il faut bien déterminer le mécanisme de routage et de calcul des tables de routage (tables statiques ou dynamiques...).
La couche réseau contrôle également l'engorgement du sous réseau, mais cela peut être délicat.

## 7 Couche transport

Cette couche est responsable du bon acheminement des messages complets au destinataire. Le rôle principal de la couche transport est de prendre les messages de la couche session, de les découper s'il le faut en unités plus petites et de les passer à la couche réseau, tout en s'assurant que les morceaux arrivent correctement de l'autre côté. Cette couche effectue donc aussi le réassemblage du message à la réception des morceaux.

## 8 Couche transport

Cette couche est responsable du bon acheminement des messages complets au destinataire. Le rôle principal de la couche transport est de prendre les messages de la couche session, de les découper s'il le faut en unités plus petites et de les passer à la couche réseau, tout en s'assurant que les morceaux arrivent correctement de l'autre côté. Cette couche effectue donc aussi le réassemblage du message à la réception des morceaux.

9 Cette couche est également responsable de l'optimisation des ressources du réseau : en toute rigueur, la couche transport crée une connexion réseau par connexion de transport requise par la couche session, mais cette couche est capable de créer plusieurs connexions réseau par processus de la couche session pour répartir les données, par exemple pour améliorer le débit. A l'inverse, cette couche est capable d'utiliser une seule connexion réseau pour transporter plusieurs messages à la fois grâce au multiplexage. Dans tous les cas, tout ceci doit être transparent pour la couche session.

10 Cette couche est également responsable du type de service à fournir à la couche session, et finalement aux utilisateurs du réseau : service en mode connecté ou non, avec ou sans garantie d'ordre de délivrance, diffusion du message à plusieurs destinataires à la fois... Cette couche est donc également responsable de l'établissement et du relâchement des connexions sur le réseau.

11 Un des tous derniers rôles à évoquer est le contrôle de flux.
C'est l'une des couches les plus importantes, car c'est elle qui fournit le service de base à l'utilisateur, et c'est par ailleurs elle qui gère l'ensemble du processus de connexion, avec toutes les contraintes qui y sont liées.
L'unité d'information de la couche réseau est le message.

## 12 La couche session

Cette couche organise et synchronise les échanges entre tâches distantes. Elle réalise le lien entre les adresses logiques et les adresses physiques des tâches réparties. Elle établit également une liaison entre deux programmes d'application devant coopérer et commande leur dialogue (qui doit parler, qui parle...). Dans ce dernier cas, ce service d'organisation s'appelle la gestion du jeton. La couche session permet aussi d'insérer des points de reprise dans le flot de données de manière à pouvoir reprendre le dialogue après une panne.

## 13 La couche présentation

Cette couche s'intéresse à la syntaxe et à la sémantique des données transmises : c'est elle qui traite l'information de manière à la rendre compatible entre tâches communicantes. Elle va assurer l'indépendance entre l'utilisateur et le transport de l'information.
Typiquement, cette couche peut convertir les données, les reformater, les crypter et les compresser.

## 14 La couche application

Cette couche est le point de contact entre l'utilisateur et le réseau. C'est donc elle qui va apporter à l'utilisateur les services de base offerts par le réseau, comme par exemple le transfert de fichier, la messagerie...

## 15 Résumé des commandes de diagnostique

Netstat
Affiche des statistiques relatives au protocole et des informations sur les connexions TCP actuelles.
Nslookup
Exécute des requêtes DNS et en affiche les résultats.
Ping
Envoie des messages ICMP (Internet Control Message Protocol) Echo ou ICMPv6 (Internet Control Message Protocol for IPv6) de demande d'écho afin de tester l'accessibilité.
Route
Permet d'afficher les tables de routage IPv4 et IPv6 et de modifier la table de routage IPv4.

## 16 Tracert Service SNMP Pathping Telnet

Envoie des messages ICMP ou ICMPv6 de demande afin de déterminer l'itinéraire réseau emprunté par les paquets IPv4 ou IPv6 pour parvenir à une destination précise.
Service SNMP
Fournit des informations de statut ainsi que des statistiques aux systèmes de gestion SNMP (Simple Network Management System).
Pathping
Telnet
Teste l'établissement de la connexion TCP entre deux nœuds.

## 17 Diagnostiquer et tester les couches OSI

Les tests de base d'un réseau doivent être effectués séquentiellement, selon l’ordre des couches du modèle de référence OSI. Il est préférable de commencer par la couche 1, jusqu’à la couche 7 si nécessaire. Au niveau de la couche 1, cherchez à identifier des problèmes simples, tels que des cordons d’alimentation déconnectés d’une prise murale. Les problèmes les plus fréquents sur les réseaux IP proviennent d’erreurs dans le système d’adressage. Il est important de vérifier la configuration des adresses avant de passer aux autres étapes de configuration.

## 18 Recherche et correction du problème

Les étapes de ce modèle sont les suivantes:
Étape 1:
Collecte de toutes les données disponibles et analyse des causes d’échec
Étape 2:
Localisation du problème au sein d’un segment de réseau, d’une unité , ou au niveau utilisateur
Étape 3:
Liaison du problème à un matériel ou à un logiciel spécifique au sein de l’unité, du compte réseau d’un utilisateur
Étape 4:
Recherche et correction du problème
Étape 5:
Confirmation de la résolution du problème.
Étape 6:
Rédaction d’une documentation sur le problème et sa solution

## 19 Test sur la base des couches OSI

La phase de test doit commencer au niveau de la couche 1 du modèle OSI, jusqu’à la couche 7 si nécessaire.
Les erreurs identifiées au niveau de la couche 1 peuvent être les suivantes:

## 20 Câbles rompus

Câbles déconnectés
Câbles raccordés à des ports inappropriés
Connexions instables
Câbles inappropriés pour la tâche à accomplir (les câbles console, les câbles croisés et les câbles droits doivent être employés à bon escient)
Problèmes d’émetteur-récepteur
Problèmes de câblage ETCD
Problèmes de câblage ETTD
Unités hors tension

## 21 Interfaces série configurées de façon incorrecte

Les erreurs identifiées au niveau de la couche 2 peuvent être les suivantes:
Interfaces série configurées de façon incorrecte
Interfaces Ethernet configurées de façon incorrecte
Ensemble d’encapsulation inapproprié (HDLC est utilisé par défaut pour les interfaces série)
Fréquence d’horloge inappropriée pour les interfaces série
Problèmes de carte réseau .

## 22 Protocole de routage non activé Protocole de routage incorrect activé

Les erreurs identifiées au niveau de la couche 3 peuvent être les suivantes:
Protocole de routage non activé
Protocole de routage incorrect activé
Adresses IP incorrectes
Masques de sous-réseau incorrects
Si des erreurs apparaissent sur le réseau, le processus de test basé sur les couches OSI doit être déclenché. La commande ping est utilisée pour tester la connectivité au niveau de la couche 3. La commande telnet peut être utilisée au niveau de la couche 7 pour vérifier le logiciel de la couche application entre des stations source et de destination.

## 23 Dépannage de la couche 1 à l’aide des témoins lumineux

Les témoins lumineux sont utiles au dépannage. La plupart des interfaces ou des cartes réseau comportent des témoins lumineux qui indiquent si la connexion est valide. Ces témoins lumineux sont souvent appelés voyants de liaison. L’interface peut également disposer de témoins lumineux pour indiquer si le trafic est en cours de transmission (TX) ou reçu (RX). Si l’interface comporte des témoins lumineux indiquant que la connexion n’est pas valide, mettez l’unité hors tension et replacez la carte d’interface. Un voyant de liaison peut également indiquer une mauvaise connexion ou l’absence de liaison à cause d’un câble inapproprié ou défectueux.
Vérifiez que tous les câbles sont connectés aux ports appropriés. Vérifiez que toutes les interconnexions sont raccordées au bon emplacement à l’aide du câble et de la méthode appropriés. Vérifiez que tous les ports de concentrateur et de commutateur sont associés au réseau VLAN ou au domaine de collision approprié, et que les options de Spanning Tree correspondantes, entre autres, sont définies correctement.

## 24 Vérifiez que le câble approprié est utilisé

Vérifiez que le câble approprié est utilisé. Un câble croisé peut être requis pour des connexions directes entre deux commutateurs ou concentrateurs, ou entre deux hôtes, tels que des PC ou des routeurs. Vérifiez que le câble de l’interface source est correctement connecté et en bon état. En cas de doute sur la connexion, replacez le câble et vérifiez la sécurité de la connexion. Essayez de remplacer le câble par un câble de travail connu. Si ce câble est connecté à une prise murale, utilisez un testeur de câble pour vérifier que la prise est correctement raccordée.
Vérifiez également le type, la connexion et la configuration de tout émetteur-récepteur utilisé. Si le remplacement du câble ne résout pas le problème, essayez de remplacer l’émetteur-récepteur si vous en utilisez un.
Assurez-vous également que l’unité est bien sous tension. Contrôlez toujours les composants de base avant d’exécuter des diagnostics ou de tenter un dépannage plus complexe

## 25 Dépannage de la couche 3 à l’aide de la commande ping

La commande ping utilise le protocole ICMP (Internet Control Message Protocol) pour vérifier la connexion matérielle et l’adresse logique au niveau de la couche réseau .
Le tableau de la figure indique les différents types de message ICMP. Il s’agit d’un mécanisme de test des plus élémentaires pour la connectivité du réseau.

27 Dans la figure, la cible de la commande ping a répondu correctement aux cinq datagrammes envoyés. Les points d'exclamation (!) indiquent chaque écho réussi. Si votre écran affiche un ou plusieurs points (.) au lieu de points d’exclamation, cela signifie que le délai d'attente de l'application du routeur a expiré (ou encore, a été dépassé) pendant qu'elle attendait un écho de paquet de la cible précisée dans la commande ping.

## 28 La commande suivante active un outil de diagnostic qui est utilisé pour vérifier la connectivité:

Router#ping [protocole] {hôte | adresse}
La commande ping teste les connexions du réseau en envoyant des requêtes d’écho ICMP à un hôte cible et en écoutant les réponses. La commande ping vérifie le nombre de paquets envoyés, le nombre de réponses reçues et le pourcentage de paquets perdus. Elle vérifie également le temps nécessaire pour que les paquets atteignent leur destination et pour que les réponses soient reçues. Ces informations permettent de contrôler la communication entre une station de travail et d’autres hôtes, et si des données ont été perdues.
Il est intéressant d’utiliser la commande ping lorsque le réseau fonctionne correctement pour voir comment s’exécute cette commande dans des conditions normales et disposer d’un modèle de comparaison lors du dépannage

## 29 Dépannage de la couche 7 à l’aide de la commande Telnet

L’utilitaire Telnet est un protocole de terminal virtuel qui fait partie de la pile de protocoles TCP/IP. Il permet de vérifier le logiciel de la couche application entre les stations d’origine et de destination Il s’agit du mécanisme de test le plus complet qui soit. L’utilitaire Telnet est normalement utilisé pour connecter des unités distantes, collecter des informations et exécuter des programmes.
L’application Telnet fournit un terminal virtuel pour la connexion aux routeurs exécutant TCP/IP. Dans le cadre du dépannage, il est utile de vérifier qu’une connexion peut être établie à l’aide de Telnet. Cela prouve qu’au moins une application TCP/IP est capable d’établir une connexion de bout en boutUne connexion Telnet réussie indique que l'application de couche supérieure, ainsi que les services des couches inférieures, fonctionnent correctement

30 Si une commande Telnet vers un serveur donné échoue à partir d’un hôte, essayez de vous connecter à partir d’un routeur et de plusieurs autres unités. Lors des tentatives de connexion via Telnet, si aucune invite de connexion n’apparaît, vérifiez ce qui suit:
Une recherche DNS inverse sur l’adresse du client peut-elle être trouvée ? De nombreux serveurs Telnet n’autorisent pas les connexions à partir d’adresses IP qui ne disposent pas d’entrées DNS. Il s’agit d’un problème fréquent pour les adresses DHCP dans lesquelles l’administrateur n’a pas ajouté d’entrées DNS pour les groupes DHCP
Il est possible qu’une application Telnet ne puisse pas négocier les options appropriées et ne se connecte donc pas. Sur un routeur Cisco, ce processus de négociation peut être visualisé à l’aide de la commande debugtelnet. .
Il est possible que l’utilitaire Telnet soit désactivé ou ait été déplacé vers un port autre que 23 sur le serveur de destination.