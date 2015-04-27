# Path to your customized zsh configuration.
ZSH_CUSTOM=$HOME/.zsh-config

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(absolute autojump battery brew brew-cask colored-man colorize copydir cp docker dnsmasq encode64 extract git-pickaxe go go_env rbenv-installer jsontools mongodb dockerport osx pry rake rake-fast rbenv redis-cli rsync ruby-functions sbcl sshtunnel sublime thor urltools vundle zsh-reload zsh-syntax-highlighting)

export PATH=$ZSH_CUSTOM/bin:/usr/local/bin:/usr/local/sbin:$PATH
if [ -d "$ZSH_CUSTOM/man" ]; then
    export MANPATH=$ZSH_CUSTOM/man:$MANPATH
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PROMPT=${PROMPT/\%c/\%~} # Output current path rather than pwd name

unsetopt correct_all

zstyle ':completion:*:commands' rehash 1

fpath=($ZSH_CUSTOM/.zsh-completions/src $fpath)

autoload -U compinit
compinit

# Add more ulimit
ulimit -S -n 4096
