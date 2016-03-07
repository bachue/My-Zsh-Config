if [ -x "`which docker-machine`" ]; then
    shellinit="$(docker-machine env 2>/dev/null)"
    if [ "$?" = "0" ]; then
        eval "$shellinit"
    fi
fi
