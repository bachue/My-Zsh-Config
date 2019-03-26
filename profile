#!/bin/bash

ZSH_CUSTOM=$HOME/.zsh-config

if [ -d "$ZSH_CUSTOM/man" ]; then
    export MANPATH=$ZSH_CUSTOM/man:$MANPATH
fi

export PATH="$HOME/.cargo/bin:$PATH"
