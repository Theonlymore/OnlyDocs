# Inventaire statique d'Ansible

Inventaire des **machines** et de leurs **variables**.

#### Permet d'indiquer et de **décrire l'infrastructure** :
- vos serveurs
- vos types de serveurs

#### Deux type d'instances :
- hosts
- groupes

#### Plusieurs formats :
- **ini** = plat
- **yaml** = plus homogène
- **json** = pour manipuler

Inventory = 
- fichier d'inventaire
- répertoire group_vars
- répertoire host_vars

### Le fichier d'inventaire 

- groupe racine == `all`
- groupe enfants
- Exemple :
  - un groupe parent1
    - groupes enfants : enfant1 et enfant2
      - "sous" enfant de enfant2 : enfant3
      - enfant1 = srv1 et srv2
      - enfant2 = srv3
      - parent1 = srv4
      - enfant3 = srv5
  

=== "inventory.ini"

    ``` ini
    [parent1]
    srv4
    [enfant1]
    srv1
    srv2
    [enfant2]
    srv3
    [enfant3]
    srv5
    [parent1:children]
    groupe1
    groupe2
    [enfant2:children]
    enfant3
    ```

=== "inventory.yaml"

    ``` yaml
    all:
      children:
        parent1:
          hosts:
            srv4:
          children:
            enfant1:
              hosts:
                srv1:
                srv2:
            enfant2:
              hosts:
                srv3:
            children
              enfant3:
                hosts:
                  srv5:
    ```




### Sources
- [xavki](https://gitlab.com/xavki/presentation-ansible-fr/-/tree/master/08-inventory-fichier-structure)