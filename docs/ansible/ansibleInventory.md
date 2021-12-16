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

#### Inventory :
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
            children:
              enfant3:
                hosts:
                  srv5:
    ```

Passer un groupe à un autre groupe (avec et sans paterne) :

=== "inventory.yaml"

    ``` yaml
    all: 
    children:
        parent1:
        parent2:
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
        parent2:
        hosts:
            srv6:
            srv7:
            srv8:
            srv9:
    ```

=== "paterneInventory.yaml"

    ``` yaml
    all: 
    children:
        parent1:
        parent2:
        hosts:
            srv4:
        children:
            enfant1:
            hosts:
                srv[1:2]:
            enfant2:
            hosts:
                srv3:
            children
                enfant3:
                hosts:
                    srv5:
        parent2:
        hosts:
            srv[6:9]:
    ```


### Exemple pratique

-  couche commune > common
-  serveurs web nginx > webserver
-  bases de données > dbserver
-  applications dockerisées ou non > app / appdock

monitoring qui semble lié à toutes les machines users > monitoring

```yaml title="inventoryPratique.yaml"
all:
  children:
    common:
      children:
        webserver:
          hosts:
            srv[1:4]:
        dbserver:
          hosts:
            srv[5:6]:
        app:
          hosts:
            srv[7:10]:
        appdock:
          hosts:
            srv[11:15]:
    monitoring:
      children:
        common:
```

### Sources
- [xavki](https://gitlab.com/xavki/presentation-ansible-fr/-/tree/master/08-inventory-fichier-structure)