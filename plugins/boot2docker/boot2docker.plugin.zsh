if [[ -x "`which boot2docker`" ]]; then
    $(boot2docker shellinit 2>/dev/null)
    alias startdocker='boot2docker start && `boot2docker shellinit 2>/dev/null`'
fi
