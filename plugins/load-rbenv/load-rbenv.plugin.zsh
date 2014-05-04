if [[ -s "$HOME/.rbenv/bin" ]]; then
    PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi
