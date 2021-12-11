# Playbooks

Un playbook est un fichier au format **YAML**. Ce dernier va donner une **liste** d'instructions. Ces instructions sont passées à Ansible dans **l'ordre de leur déclaration**. L'avantage par rapport au mode ad hoc(ligne de commande) est que vous aurez ainsi tout décrit dans un **fichier**, y compris l'**enchaînement des opérations**.

## Exemple d'un playbook d'un serveur web Apache

```yaml title="playbook.yml"---
# WEB SERVER

- hosts: web # Nom 
  become: true # Activer l'élevation de privilège 

  tasks:
  - name: install apache and php last version
    apt:
      name:
        - apache2
        - php
        - php-mysql
      state: present
      update_cache: yes 

  - name: Donner les droits sur le dossier http
    file:
      path: /var/www/html
      state: directory
      mode: '0755'

  - name: remove default index.html
    file:
      path: /var/www/html/index.html
      state: absent

  - name: upload web app source
    copy:
      src: app/
      dest: /var/www/html/

  - name: ensure apache service is start
    service:
      name: apache2
      state: started
      enabled: yes


```

- Playbook commence par un tiret car il s'agit d'une liste de play.
- Un play est un dictionnaire yaml
- La section `hosts` est obligatoire. Toutes les autres sont *falcutatives* !
- La section `tasks` peut être remplacée ou complétée par une section roles et des sections `pre_tasks` `post_tasks`
- Les `handlers` sont des tâches conditionnelles qui s’exécutent à la fin (post traitements conditionnels comme le redémarrage d’un service

## Ordre d'exécution

1. pre_tasks
2. roles
3. tasks
4. post_tasks
5. handlers

Les rôles ne sont pas des tâches à proprement parler mais un ensemble de tâches et ressources regroupées dans un module, un peu comme une librairie dans le développement. 

## Bonnes pratique

- Toujours mettre un name: qui décrit lors de l’exécution la tâche en cours : un des principes de l’Infrastructure-as-Code est l’intelligibilité des opérations.
- Utiliser les arguments au format YAML (sur plusieurs lignes) pour la lisibilité, sauf s’il y a peu d’arguments

Pour valider la syntaxe il est possible d’installer et utiliser `ansible-linter` sur les fichiers YAML.

## Variables ANSIBLE

Ansible utilise en arrière plan un dictionnaire contenant de nombreuses variables.

Pour s’en rendre compte on peut lancer :
`ansible <hote_ou_groupe> -m debug -a "msg={{ hostvars }}"` 

Ce dictionnaire contient en particulier:

- des variables de configuration ansible (ansible_user par exemple)
- des facts c’est à dire des variables dynamiques caractérisant les systèmes cible (par exemple ansible_os_family) et récupéré au lancement d’un playbook.

### Définition des variables :

- La section `vars:` du playbook.
Un fichier de variables appelé avec `var_files:`
- L’inventaire : variables pour chaque machine ou pour le groupe.
- Dans des dossier extension de l’inventaire `group_vars`, `host_bars`
- Dans le dossier `defaults` des rôles (cf partie sur les rôles)
- Dans une tâche avec le module `set_facts`.
A runtime au moment d’appeler la CLI ansible avec `--extra-vars "version=1.23.45 other_variable=foo"`


## Modules : 

https://docs.ansible.com/ansible/2.9/modules/file_module.html#file-module

### Sources :

- [cours.hadrienpelissier.fr](https://cours.hadrienpelissier.fr/01-ansible/cours2/#remarques-de-syntaxe)
- [Devopssec](https://devopssec.fr/article/executez-premieres-commandes-ansible)