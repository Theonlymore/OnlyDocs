# DHCP - **Dynamic Host Configuration Protocol**

Avantages :

- Propagation rapide des informations
- Réduction des erreurs
- Centralisation du réseau

Inconvénients :

- Ouvert à toute demande (par défaut n'importe qui peut crée un serveur dhcp sur le réseau)
- Vulnérabilité accrue aux attaques DOS

## Il contient

- Adresse IP
- Un masque
- Une durée de baie

=== "Obtention d'un bail - **DORA**"

    ``` md
    - **D**iscover - **D**emande
    - **O**ffer - **O**ffre
    - **R**equest - **R**éponse (acceptation du bail)
    - **A**cknowledge - **A**cceptation du bail
    ```

=== "Renouvellement du bail - **RA**"

    ``` md
    à 3/4 de la durée de bail :
    - **R**equest - **R**éponse
    - **A**cknowledge - **A**cceptation
    ```
=== "Résiliation du bail - **R**"

    ``` md
    - **R**elease - **R**éponse
    ```


