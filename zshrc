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
plugins=(absolute autojump battery brew brew-cask bundler colored-man colorize copydir cp encode64 extract gem git git-pickaxe jsontools load-rbenv load-rvm mongodb osx postgres pry rake rake-fast rbenv redis redis-cli rsync ruby ruby-functions sbcl sublime subla thor urltools vundle)

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    plugins=($plugins rvm)
fi

export PATH=$ZSH_CUSTOM/bin:/usr/local/bin:/usr/local/sbin:$PATH

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PROMPT=${PROMPT/\%c/\%~} # Output current path rather than pwd name

unsetopt correct_all

zstyle ':completion:*:commands' rehash 1

fpath=($ZSH_CUSTOM/.zsh-completions/src $fpath)

autoload -U compinit
compinit
