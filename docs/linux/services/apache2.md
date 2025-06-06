# Apache2

## Https letsencrypt sur serveur web Apache2

### Prérequis 

Avoir installer apache2

### Création site

Crée un Virtualhost dans un nouveau fichier dans le dossier :  `/etc/apache2/sites-availadble/`

- `vim 001-docs.rocheralexandre.com.conf`

```bash
<Virtualhost *:80>
    ServerName docs.rocheralexandre.com #Nom de domaine du serveur
    DocumentRoot /var/www/html/ #Dossier source du site
</Virtualhost>
```

Pour les futures tests, mettre un `index` dans `DocumentRoot`

- `touch "rocherAlexandreWeb" > /var/www/html/index.html`

Activation du site web :

- `a2ensite 001-docs.rocheralexandre.com.conf`
- `service apache2 restart`

### Mise en place du ssl

#### Prérequis

- Nom de domaine valide
- Accès à la zone dns du nom de domaine

#### Mise en place

Installation du paquet qui permet la création du certificat :

- `apt install certbot`
  
Création du certificat :

- `certbot -d docs.rocheralexandre.com certonly --manual --preferred-challenge dns`
  
Répondre aux questions, certbot demande crée un champ txt sur sont le dns, le faire.

Après vérifications accepté :

Certificat dans le dossier : `/etc/letsencrypt/live/docs.rocheralexandre.com-001/`

#### Création d'une virtualhost pour mis en place ssl

- `vim /etc/apache2/sites-available/002-docs.rocheralexandre.com.conf`
  
```bash
<Virtualhost *:443>
    ServerName docs.rocheralexandre.com
    DocumentRoot /var/www/html/

    SSLEngin on
    SSLCertificateFile /etc/apache2/certs/alex.crt
    SSLCertificateKeyFile /etc/apache2/certs/alex.key #clée privé ssl
    SSLCertificateChainFile  /etc/apache2/certs/alex.chain # mettre la chain ici
</Virtualhost>
```

Nous devons maintenant crée le dossier `certs` dans `/etc/apache2/`

- `mkdir /etc/apache2/certs`

Mettre le certificat et la clé privé dans le dossier "certs"

- `cp /etc/letsencrypt/live/docs.rocheralexandre.com-001/cert.pem /etc/apache2/certs/alex.crt`
- `cp /etc/letsencrypt/live/docs.rocheralexandre.com-001/privkey.pem /etc/apache2/certs/alex.key`

Activation des module/site apache2 :

- `a2enmod ssl`
- `a2enmod rewrite`
- `a2ensite 002-docs.rocheralexandre.com`
- `service apache2 restart`



Source : 
- [Les Tutos de Processus](https://www.youtube.com/watch?v=uG_bRjqUzFM)
- [digiCert](https://www.digicert.com/kb/ssl-support/apache-multiple-ssl-certificates-using-sni.htm)