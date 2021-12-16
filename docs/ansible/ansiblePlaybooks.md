# Playbooks

Un playbook est un fichier au format **YAML**. Ce dernier va donner une **liste** d'instructions. Ces instructions sont passées à Ansible dans **l'ordre de leur déclaration**. L'avantage par rapport au mode ad hoc(ligne de commande) est que vous aurez ainsi tout décrit dans un **fichier**, y compris l'**enchaînement des opérations**.



- Un play est un dictionnaire **yaml**
- La section `hosts` est obligatoire. Toutes les autres sont *falcutatives* !
- La section `tasks` peut être remplacée ou complétée par une section roles et des sections `pre_tasks` `post_tasks`
- Les `handlers` sont des tâches conditionnelles qui s’exécutent à la fin (post traitements conditionnels comme le redémarrage d’un service
## Exemple d'un playbook d'un serveur web Apache

```yaml title="playbook.yml"
---
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

  - name: remove default /var/www/html
    file:
      path: /var/www/html/*
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

## Ordre d'exécution

1. pre_tasks
2. roles
3. tasks
4. post_tasks
5. handlers

#### Rôles

Les **rôles** ne sont pas des tâches à proprement parler mais un **ensemble de tâches** et ressources regroupées dans un module, un peu comme une librairie dans le développement. 

## Bonnes pratique

- Toujours mettre un **name**: qui décrit lors de l’exécution la tâche en cours : un des principes de l’Infrastructure-as-Code est l’intelligibilité des opérations.
- Utiliser les arguments au format YAML (sur plusieurs lignes) pour la lisibilité, sauf s’il y a peu d’arguments

Pour valider la syntaxe il est possible d’installer et utiliser `ansible-linter` sur les fichiers YAML.

## Utilisation 

- `ansible-playbook -i inventory playbook.yml`

Commande `ansible-playbook`avec options :

| Options               | Description                                                     |
| --------------------- | --------------------------------------------------------------- |
| -i                    | inventory                                                       |
| -l                    | limit > spécifier un/des groupes ou serveurs ou patterns        |
| -u                    | user                                                            |
| -b                    | become > sudo                                                   |
| -k                    | password de ssh (à éviter)                                      |
| -K                    | password sudo                                                   |
| -C                    | check > dry run                                                 |
| -D diff               | > afficher les différences avant/après les actions du playbooks |
| --ask-vault           | prompt pour le password vault                                   |
| --vault-password-file | passer le vault password par un fichier                         |
| --syntax-check        | vérifier la syntax                                              |
| -e                    | surcharger n'importe quelle variable                            |
| -f                    | nombre de processus parallèle                                   |
| --flush-cache         | éviter l'utilisation du cache                                   |
| --step                | une tâche à la fois ( confirmation)                             |
| --start-at-task       | commencer à une tâche spécifique                                |
| --list-tasks          | liste des tâches qui sont être lancer                           |

## Modules : 

https://docs.ansible.com/ansible/2.9/modules/file_module.html#file-module

### Sources :

- [cours.hadrienpelissier.fr](https://cours.hadrienpelissier.fr/01-ansible/cours2/#remarques-de-syntaxe)
- [Devopssec](https://devopssec.fr/article/executez-premieres-commandes-ansible)
- [xavki](https://gitlab.com/xavki/presentation-ansible-fr/-/blob/master/11-premier-playbook/slides.md)