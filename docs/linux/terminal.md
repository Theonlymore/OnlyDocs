# Terminal

## Mon terminal 

Même ~/.bashrc utiliser le bashrc du user pour quand on sudo

```bash
sudo -u root bash --rcfile ~/.bashrc
```


## ZSH

install

apt install zsh

Avec "Oh-my-zsh"

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Mettre un autre themes :

vim ~/.zshrc
( exemple avec le thème "agnoster")
ZSH_THEME="agnoster"


### Souces
- [wiki-tech - papamica](https://wiki-tech.io/fr/Linux/D%C3%A9butant/Terminal)
