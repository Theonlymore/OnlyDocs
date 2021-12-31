# Ansible et docker

Exemple d'un playbook qui utilise des modules docker pour lancer deux container.



=== "sansRolePlaybook"

    ``` yaml 
    ---
    # WEB SERVER

    - hosts: web
      become: true

      tasks:
      - name: install git,apt-transport-https,ca-certificates,curl,gnupg2,software-properties-common,wget
        apt:
          name:
          - git
          - apt-transport-https
          - ca-certificates
          - curl
          - gnupg2
          - software-properties-common
          - wget
          - python3-pip
          state: present
          update_cache: yes

      - name: Add Apt signing key from official docker repo
        apt_key:
          url: https://download.docker.com/linux/debian/gpg
          state: present

      - name: add docker official repository for Debian bullseye
        apt_repository:
          repo: "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable"
          state: present

      - name: install docker
        apt:
          name:
          - docker-ce
          - docker-ce-cli
          - containerd.io
          state: present
          update_cache: yes

      - name: Install docker avec python
        pip:
          name: docker

      - name: start portainer
        docker_container:
          name: Ansible_portainer
          image: cr.portainer.io/portainer/portainer-ce:2.9.3
          state: started
          restart: yes
          volumes:
          - "/var/run/docker.sock:/var/run/docker.sock"
          ports:
          - "80:9000"
      - name: start uptime
        docker_container:
          name: Ansible_uptime
          image: louislam/uptime-kuma
          state: started
          restart: yes
          ports:
          - "8000:3001"
    ```

=== "avecRolePlaybook"

    ``` yaml
    ---

    # docker.yml

      - hosts: web
        become: true

        roles:
          - name: igor_nikiforov.docker

        tasks:
          - name: cree dossier
            file:
              path: /root/dockerComp
              state: directory
          - name: copy Docker Compose files
            copy:
              src: file/{{ item }}
              dest: /root/dockerComp/{{ item }}
            loop:
            - docker-compose.yml

          - name: deploy Docker Compose stack
            docker_compose:
              project_src: /root/dockerComp/
              files:
              - docker-compose.yml

    ```



### Sources
- [Nickjj Github](https://github.com/nickjj/ansible-docker)
- [docs Ansible sur le module](https://docs.ansible.com/ansible/2.6/modules/docker_module.html)