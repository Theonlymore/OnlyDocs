# Fail2ban

Fichiers de config

- `/etc/fail2ban/fail2ban.conf`
- `/etc/fail2ban/jail.conf`

## Unban ip

Commande :

- `fail2ban-client set YOURJAILNAMEHERE unbanip IPADDRESSHERE`

## Diagnostic

### Status des règles

- `fail2ban-client status`

### Status d'une règle

- `fail2ban-client status sshd`


### Sources

- [doc.ubuntu](https://doc.ubuntu-fr.org/fail2ban)
- [unban ip](https://serverfault.com/questions/285256/how-to-unban-an-ip-properly-with-fail2ban)