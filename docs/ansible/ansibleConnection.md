# Les types de connexion avec Ansible

Mettre le  mots de passe dans le `inventory`

```ini title="inventory"
ipOuNomDns ansible_ssh_user=root ansible_ssh_pass=P@ssw0rd
```

## Avec une clé SSH

Mettre une lien vers la clé ssh dans le fichier `inventory`

```ini title="inventory"
ipOuNomDns ansible_ssh_user=root ansible_ssh_private_key_file=~/.ssh/mykey1.pem
```

Bien mettre les bon droit sur la clé afin d'éviter une erreur : `chmod 600 sshkey` 

### Sources
- [Zigarn - stackOverFlow](https://stackoverflow.com/questions/44734179/specifying-ssh-key-in-ansible-playbook-file)
