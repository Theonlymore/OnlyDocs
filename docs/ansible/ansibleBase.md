# Les bases sur Ansible

## Les principales commandes d'Ansible



| Outils           | Description | Exemple |
| ---------------- | ----------- | ----- |
| [`ansible`](https://docs.ansible.com/ansible/latest/cli/ansible.html) | Permet d'exécuter un simple **module** Ansible sur un **inventaire** mode ad-hoc(en ligne de commandes)| `ansible all -m ping`|
| [`ansible-console`](https://docs.ansible.com/ansible/latest/cli/ansible-console.html) | Ouvre une **console** interactive permettant de lancer **plusieurs actions sur un inventaire**. | Commands classique |
| [`ansible-config`](https://docs.ansible.com/ansible/latest/cli/ansible-config.html) | Affiche l'ensemble des paramètres Ansible. `list`: affiche la liste complète des options d'Ansible  à disposition. `dump`: affiche la configuration dans le contexte actuel. `view`: affiche le contenu d'un fichier de configuration Ansible | `ansible-config[list|dump|view]` |
| [`ansible-playbook`](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html) | Exécute un **playbook** Ansible sur un **inventaire**. | `ansible-playbook playbook.yml` |
| [`ansible-vault`](https://docs.ansible.com/ansible/latest/cli/ansible-vault.html)| Permet de chiffrer des données qui ne doivent pas être divulgué | 
| [`ansible-inventory`](https://docs.ansible.com/ansible/latest/cli/ansible-inventory.html)| Affiche les données d'un inventaire Ansible | ` ansible-inventory -i inventory --graph`|
| [`ansible-galaxy`](https://docs.ansible.com/ansible/latest/cli/ansible-galaxy.html)| Permet d'installer des roles et des collections Ansible |  |
| [`ansible-doc`](https://docs.ansible.com/ansible/latest/cli/ansible-doc.html)| Permet d'obtenir de l'aide pour utiliser Ansible. Plutôt pratique pour se guider. |`ansible-doc ping`. |

## [Inventaire](ansibleInventory.md)

L'inventaire statique sous **Ansible** est un fichier au format INI,Yaml ou Json.

```ini title="inventaire.ini"
[web]
server1
[db]
server2
``` 

Plusieurs connexion ssh possible :
- user+password
- ssh key

Pour ma pars j'utilise use+password, je change donc le fichier `inventaire.ini` en :

```ini title="inventaire.ini"
[web]
server1 ansible_ssh_user=root ansible_ssh_pass=password
[db]
server2

[db:vars]
ansible_ssh_user=root 
ansible_ssh_pass=password
```

Il est maintenant possible de lancer des commande Ansible : `ansible -i inventaire.ini -m ping web`

```json
172.69.0.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

La commande a fonctionné avec succès. Cet exemple est assez simple mais pour des tâches plus évoluées nous allons faire appel au [**playbook**](ansiblePlaybooks.md) (livre de recette) d’Ansible.

## DEBUG

Permet de débugger un script Ansible en voyant chaque étade de la commande.
 
```console
ansible-playbook -i Inv playbook.yml --step -vvv
```
### Sources
- [blog.stephane-robert](https://blog.stephane-robert.info/post/ansible-inventaire-static-precedence-tips/)

test
