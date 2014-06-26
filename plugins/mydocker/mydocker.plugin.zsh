if [[ -x "`which boot2docker`" ]]; then
    if [[ "`boot2docker status`" = "running"  ]]; then
        export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
    fi

    alias lsdocker='docker images'
    alias psdocker='docker ps -a -q'
    alias killalldocker='docker stop `psdocker`'
    alias rmalldocker='docker rm `psdocker`'
fi
