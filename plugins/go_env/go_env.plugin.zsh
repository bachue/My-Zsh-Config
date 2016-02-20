if [[ -x "`which go`" ]]; then
    GOROOT=`go env GOROOT`
    if [ -n "$GOROOT" ]; then
        export PATH=$GOROOT/bin:$PATH
    fi

    if [ -z "$DEFAULT_GOPATH" ]; then
        export DEFAULT_GOPATH=$HOME/GoEnv
    fi

    if [ -d "$DEFAULT_GOPATH" ]; then
        export GOPATH=$DEFAULT_GOPATH
        export PATH=$DEFAULT_GOPATH/bin:$PATH
    else
        echo "WARNING: \$DEFAULT_GOPATH $DEFAULT_GOPATH is not existed, Please create it and reset \$GOPATH" 1>&2
    fi
fi
