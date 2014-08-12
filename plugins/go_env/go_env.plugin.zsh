if [[ -x "`which go`" ]]; then
    create_go_project() {
        TARGET=$1
        if [[ -z "$TARGET" ]]; then
            echo "Usage: create_go_project project_name" 1>&2
            return
        fi

        echo "Create Go Project at $TARGET"

        mkdir -p $TARGET &&
        cd $TARGET &&
        mkdir src bin pkg &&
        export GOPATH=$GOPATH:`pwd` &&
        echo "Environment GOPATH set" || echo "Create Project $TARGET Failed" 1>&2
    }

    GOROOT=`go env GOROOT`
    if [ -n "$GOROOT" ]; then
        export PATH=$GOROOT/bin:$PATH
    fi

    if [ -z "$DEFAULT_GOPATH" ]; then
        export DEFAULT_GOPATH=$HOME/Projects/go_projects
    fi

    if [ -d "$DEFAULT_GOPATH" ]; then
        export GOPATH=$DEFAULT_GOPATH
        export PATH=$DEFAULT_GOPATH/bin:$PATH
    else
        echo "WARNING: \$DEFAULT_GOPATH $DEFAULT_GOPATH is not existed, Please create it and reset \$GOPATH" 1>&2
    fi
fi
