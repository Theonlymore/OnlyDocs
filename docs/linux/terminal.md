# Terminal

## Mon terminal 

### ~/.bashrc


```bash
```

```bash title=".bashrc"
# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt


# Même ~/.bashrc utiliser le bashrc du user pour quand on sudo
alias rootsudo='sudo -u root bash --rcfile ~/.bashrc'
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
