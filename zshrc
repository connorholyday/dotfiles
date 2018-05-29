# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export XDEBUG_CONFIG="idekey=VSCODE"

# Path to your oh-my-zsh installation.
export ZSH=/Users/connorholyday/.oh-my-zsh

# Theme
ZSH_THEME=""

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gitfast
  git-extras
  brew
  npm
  composer
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Enable pure prompt
autoload -Uz promptinit
promptinit
prompt pure

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR="nvim"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias tower="gittower ."

# Setup FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Export highway
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/usr/local/opt/php@7.0/bin:$PATH"
export PATH="/usr/local/opt/php@7.0/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PHP_AUTOCONF="/usr/local/bin/autoconf"
