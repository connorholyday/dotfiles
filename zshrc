# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/connorholyday/.oh-my-zsh

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
source ~/.bash_aliases.local

# Enable pure prompt
autoload -Uz promptinit
promptinit
prompt pure

export EDITOR="nvim"

function gpr {
  # `git pull --rebase` with automatic stash and attempt to restore
  MOD_COUNT=$(git status --porcelain --untracked-files=no | wc -l)
  if [ $MOD_COUNT -gt 0 ]; then
    if git stash save "git pull --rebase stash" && git pull --rebase && git stash apply && git stash drop; then
      echo "Success";
    else
      echo
      echo
      echo "WARNING: Something failed! Read the above!"
    fi
  else
    git pull --rebase
  fi
}

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Export highway

export PATH="/usr/local/sbin:$PATH"
export PHP_AUTOCONF="/usr/local/bin/autoconf"
