# Nagios 

Installation : [ici](https://leblogdolivyeahh.wordpress.com/2020/07/29/debian-10-installation-de-nagios/)


Dossier de configuration : `/usr/local/nagios/etc`
## Utilisation

Fichier de configuration général : `/usr/local/nagios/etc/nagios.cfg`

Création de ma commande : 

```bash title="commands.cfg"
define command {

    command_name    check_snmp_Alex
    command_line    $USER1$/check_snmp -H $HOSTADDRESS$ -c $ARG1$ -v 1 -o $ARG2$ $ARG3$ 
}
```



exemple

Supperviser un port de switch

1. Trouver l'OID : "ifOperStatus.10001"
   1. Test :  `snmpwalk -v 1 -c private 192.168.1.231 IF-MIB::ifOperStatus.10001`
   2. Convertir avec `check_snmp` : `./check_snmp -H 192.168.1.231 -R 1 -C private -o ifOperStatus.10001`

Crée une commande personnalisé dans `commande.cfg`et création de l'objet dans `switchAlex.cfg` :

=== "commande.cfg"

    ```bash 
    define command {

        command_name    check_snmp_Alex
        command_line    $USER1$/check_snmp -H $HOSTADDRESS$ -c $ARG1$ -v 1 -o $ARG2$ -R $ARG3$
    }
    ```


=== "switchAlex.cfg"

    ```bash 
    # Define the switch that we'll be monitoring

    define host {

        use                     generic-switch                      ; Inherit default values from a template
        host_name               GroupeBSwitch                     ; The name were giving to this switch
        alias                   GroupeBSwitch               ; A longer name associated with the switch
        address                 192.168.1.231 
        hostgroups              switches                            ; Host groups this switch is associated with
    }



    ###############################################################################
    #
    # HOST GROUP DEFINITIONS
    #
    ###############################################################################

    # Create a new hostgroup for switches

    define hostgroup {

        hostgroup_name          switches                            ; The name of the hostgroup
        alias                   Network Switches                    ; Long name of the group
    }



    ###############################################################################
    #
    # SERVICE DEFINITIONS
    #
    ###############################################################################

    # Create a service to PING to switch



    # Monitor uptime via SNMP




    # Commande personnalise pour check port 1 switch

    define service {

        use                     generic-service                     ; Inherit values from a template
        host_name               GroupeBSwitch
        service_description     Port 1 Link Status
        check_command           check_snmp_Alex!private!ifOperStatus.10001!1
    }

    ```


Crée une community :

```ios
snmp-server community private RO #crée community prive

```

Supprimé une community :

```ios
no snmp-server community private RO
```




- [Doc Cisoc](https://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/7282-12.html)
- [acipia.fr](https://www.acipia.fr/support/faq/protocole-snmp-switch-cisco/)

