# Ansible Vault

Permet de chiffrer des mot de passe, clé api, ssh, ...
Afin de par exemple de pas leak un mot de passe via github


`ansible-playbook -i stagingInv vps.yml --ask-vault-pass --step`