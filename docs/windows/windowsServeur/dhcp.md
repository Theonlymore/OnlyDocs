# DHCP - **Dynamic Host Configuration Protocol**

Avantages :

- Propagation rapide des informations
- Réduction des erreurs
- Centralisation du réseau

Inconvénients :

- Ouvert à toute demande (par défaut n'importe qui peut crée un serveur DHCP sur le réseau)
- Vulnérabilité accrue aux attaques DOS

## Il contient

- Adresse IP
- Un masque
- Une durée de baie

=== "Obtention d'un bail - **DORA**"

    ``` markdown
    - **D**iscover - **D**emande
    - **O**ffer - **O**ffre
    - **R**equest - **R**éponse (acceptation du bail)
    - **A**cknowledge - **A**cceptation du bail
    ```

=== "Renouvellement du bail - **RA**"

    ``` markdown
    à 3/4 de la durée de bail :
    - **R**equest - **R**éponse
    - **A**cknowledge - **A**cceptation
    ```
=== "Résiliation du bail - **R**"

    ``` markdown
    - **R**elease - **R**éponse
    ```

## Configuration de l'étendue

- Nom : Lan_Serveur
- Une plage d'adresse IP : 192.168.0.1 - 192.168.0.254
- Exclusions : 192.168.0.5 - 192.168.0.5
- Un durée de bail : 2 jours

Ciblé une machine : réservation d'une ip pour une machine via son **adresse mac**

Gestion des options : 

- **Routeur** : 3 : Définit la passrelle par défaut
- **Serveur de noms de domaine** : 6 : Définit le serveur DNS
- **Nom de domaine DNS** : 12 : Définit le suffixe DNS




