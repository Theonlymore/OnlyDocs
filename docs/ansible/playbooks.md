# Playbooks

Un sort de script Ansible :

## Structure d'un playbook

```yaml
--- 

- name: premier play # une liste de play (chaque play commence par un tiret)
  hosts: serveur_web # un premier play
  become: yes
  gather_facts: false # récupérer le dictionnaires d'informations (facts) relatives aux machines

  vars:
    logfile_name: "auth.log"

  var_files:
    - mesvariables.yml

  pre_tasks:
    - name: dynamic variable
      set_fact:
        mavariable: "{{ inventory_hostname + 'prod' }}" #guillemets obligatoires

  rôles:
    - flaskapp
    
  tasks:
    - name: installer le serveur nginx
      apt: name=nginx state=present # syntaxe concise proche des commandes ad hoc mais moins lisible

    - name: créer un fichier de log
      file: # syntaxe yaml extensive : conseillée
        path: /var/log/{{ logfile_name }} #guillemets facultatifs
        mode: 755

    - import_tasks: mestaches.yml

  handlers:
    - systemd:
        name: nginx
        state: "reloaded"

- name: un autre play
  hosts: dbservers
  tasks:
    ... 
```