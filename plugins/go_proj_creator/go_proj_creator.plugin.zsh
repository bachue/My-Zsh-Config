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
        export GOPATH=`pwd` &&
        echo "Environment GOPATH set" || echo "Create Project $TARGET Failed" 1>&2
    }
fi
