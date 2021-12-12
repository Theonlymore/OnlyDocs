# ssh

## Installation : 

```
=== "Serveur"

    ``` bash
    $apt install openssh-client
    ```

=== "Client"

    ``` bash
    $apt install openssh-server
    ```
``` 

## Crée une clé ssh

Client : 

1. `ssh-keygen -t rsa -b 4096`
2. La clé privé et publique est générer dans le dossier dans lequel vous êtes.

Serveur :

1. Mettre la clé publique générer par le client dans le fichier : `/root/.ssh//authorized_keys`
   1. 
 



## Sources

- [Phoenixnap](https://phoenixnap.com/kb/generate-ssh-key-debian-10)
- [linuxize.com](https://linuxize.com/post/how-to-set-up-ssh-keys-on-debian-10/)