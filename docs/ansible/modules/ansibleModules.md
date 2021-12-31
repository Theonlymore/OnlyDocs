# Les modules Ansible

Les modules Ansible sont donc des “morceaux de code” pour modifier l’état d’une propriété d’un hôte.

Par exemple (installer un paquet, copier un fichier, lancer un conteneur docker, ...) 

=== "ansible.builtin.apt"

    ``` yaml
    - name: Install the version '1.00' of package "foo"
      apt:
        name: 
        - python3
        - fail2ban
    ```

=== "ansible.builtin.copy"

    ``` yaml
    - name: Copy file with owner and permissions
      ansible.builtin.copy:
        src: /srv/myfiles/foo.conf
        dest: /etc/foo.conf
        owner: foo
        group: foo
        mode: '0644'
    ```

=== "docker_container_module"

    ``` yaml
    - name: Remove container from one network
      docker_container:
        name: sleepy
        networks:
          - name: TestingNet2
        purge_networks: yes
    ```


### Sources
- [goffinet.org](https://linux.goffinet.org/ansible/modules-ansible/)