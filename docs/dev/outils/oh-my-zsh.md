# Oh My ZSH
## Installation
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Plugins
Installation de **zsh-autosuggestions**
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Installation de **zsh-syntax-highlightning**
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Configurations
Modification du fichier `~/.zshrc` :
```bash title=".zshrc"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# Config Oh My ZSH
source $ZSH/oh-my-zsh.sh
```

### Ajout d'alias

Création du fichier `$ZSH/custom/aliases.zsh` :
!!! warning
    Pensez à supprimer la définition de l'alias **`nix-update`** dans le fichier `~/.zprofile` s'il est présent.
```bash title="aliases.zsh"
alias nix-update="nix flake update && sudo darwin-rebuild switch --flake ."

alias ls="eza --icons --git"
alias ll="ls -Al"

alias cat="bat"
```