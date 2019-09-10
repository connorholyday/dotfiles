# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/connor/.oh-my-zsh

ZSH_THEME=""

export NVM_LAZY_LOAD=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  zsh-nvm
  git
  gitfast
  git-extras
  brew
  npm
  docker
  composer
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

# Enable prompt
eval "$(starship init zsh)"

export EDITOR="nvim"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --glob "!.git/*"'

# Export highway

export PATH="/usr/local/sbin:$PATH"
export PHP_AUTOCONF="/usr/local/bin/autoconf"
