# Les rôles ansible

Les rôles permet de **simplifier l'écriture** de Playbooks ainsi que les rendre plus **facile à lire**.

Ansible les définies dans une structure.

Un rôle Ansible possède une structure de répertoires définie avec **huit répertoires standards principaux**. Vous devez inclure au moins un de ces répertoires dans chaque rôle.

Par exemple :

```bash
# playbooks
site.yml
webservers.yml
fooservers.yml
roles/
    common/
        tasks/
        handlers/
        library/
        files/
        templates/
        vars/
        defaults/
        meta/
    webservers/
        tasks/
        defaults/
        meta/
```

## La création de rôles

La structure des répertoires des rôles est essentielle pour créer un nouveau rôle, nous utiliserons la commande `ansible-galaxy` pour **créer le squelette de notre rôle** automatiquement :

```bash
ansible-galaxy init [ROLE NAME]
```

**Structure**

```bash
test-role
├─── defaults
│      └──────── main.yml
├─── files
├─── handlers
│      └──────── main.yml
├─── meta
│      └──────── main.yml
├─── tasks
│      └──────── main.yml
├─── templates
├─── tests
│      ├──────── inventory
│      └──────── test.yml
└─── vars
│      └──────── main.yml
└─── README.md
```

Caractéristiques de l'arborescence d'un rôle :

- `tasks` : contient la liste principale des tâches à exécuter par le rôle.
- `handlers` : contient les handlers ( *tâches inactives qui ne sont déclenchées à la demande* ), qui peuvent être utilisés par ce rôle ou même en dehors de ce rôle.
- `defaults` : variables par défaut pour le rôle.
- `vars` : d'autres variables pour le rôle.
- `files` : contient des fichiers qui peuvent être déployés via ce rôle.
- `templates` : contient des modèles (jinja2) qui peuvent être déployés via ce rôle.
- `meta` : définit certaines métadonnées pour ce rôle.
- `README` .md: inclut une description générale du fonctionnement de votre rôle.
- `test` : contient notre playbook (on peut cependant déposer notre playbook à la racine du projet ou dans un dossier sous un nom différent).

Exemple d'un playbook :

```yml title="playbookRole.yml"
---

# WEB SERVER
- hosts: web
  become: true
  vars_files: vars/main.yml

  roles:
    - web

# DATABASE SERVER
- hosts: db
  become: true
  vars_files: vars/main.yml

  roles:
	- database
```

## Ansible Galaxy

Ansible galaxy est une plateforme Web où les utilisateurs peuvent partager leurs rôles Ansible.

**Ne pas oublier de documenter le rôles dans le README**

Meta donner d'un rôle :

```yml title="meta/main.yml"
galaxy_info:
  role_name:
  author: 
  description: 
  company: 
  license: 
  min_ansible_version:
  platforms:
  galaxy_tags:
dependencies: []
```

Les rôles nous permet d'avoir un playbook plus modulable et plus simple à lire.

### Sources
- [redhat](https://ansible.github.io/workshops/exercises/ansible_rhel/1.7-role/README.fr.html)
- [devopssec](https://devopssec.fr/article/roles-ansible)