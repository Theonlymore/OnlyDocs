# S3 Glacier

## Installation de [Aws CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip #apt install zip
sudo ./aws/install
``` 

## [Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) Aws cli

```bash
$aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: eu-west-3
Default output format [None]: yaml
```

## [Cli completion](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html) :

```bash
$ find / -name aws_completer
# /usr/local/aws-cli/v2/2.2.41/dist/aws_completer

$ complete -C '/usr/local/bin/aws_completer' aws
```

## Commande basique S3 Glaicer sur le cli aws


- Liste des "vaults" :

```bash
$aws glacier list-vaults --account-id -
```


- Demande de l'inventaire du "Vault" (cela peux prendre plus de 5 heure) : 

```bash
aws glacier initiate-job --account-id - --vault-name my-vault --job-parameters '{"Type": "inventory-retrieval"}'
```
