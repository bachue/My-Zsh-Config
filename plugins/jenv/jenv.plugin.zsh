if [ -n $(which jenv) ]; then
    eval "$(jenv init - zsh)"
fi

if [ -d "$HOME/.jenv/bin" ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
fi
