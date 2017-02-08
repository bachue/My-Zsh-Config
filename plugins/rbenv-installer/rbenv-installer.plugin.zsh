if [ ! -d "$HOME/.rbenv" ]; then
    install_rbenv() {
        if [ -d "$HOME/.rbenv" ]; then
            echo 'rbenv installed.' >&2
        else
            git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
            git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
            git clone https://github.com/sstephenson/rbenv-default-gems.git $HOME/.rbenv/plugins/rbenv-default-gems
            git clone https://github.com/sstephenson/rbenv-gem-rehash.git $HOME/.rbenv/plugins/rbenv-gem-rehash
            git clone https://github.com/rkh/rbenv-update.git $HOME/.rbenv/plugins/rbenv-update
            git clone https://github.com/tpope/rbenv-aliases.git $HOME/.rbenv/plugins/rbenv-aliases
            git clone https://github.com/bachue/rbenv-gemdir.git $HOME/.rbenv/plugins/rbenv-gemdir
            git clone https://github.com/andorchen/rbenv-china-mirror.git $HOME/.rbenv/plugins/rbenv-china-mirror
            echo "bundler" > $HOME/.rbenv/default-gems
            export PATH=$HOME/.rbenv/bin:$PATH
            eval "`$HOME/.rbenv/bin/rbenv init -`"
            rbenv alias --auto
            gem sources --remove http://rubygems.org/
            gem sources --add https://gems.ruby-china.org/
        fi
    }
fi

