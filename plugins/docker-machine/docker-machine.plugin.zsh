if [ -x "`which docker-machine`" ]; then
    shellinit="$(docker-machine env docker-vm 2>/dev/null)"
    if [ "$?" = "0" ]; then
        eval "$shellinit"
    fi
fi
