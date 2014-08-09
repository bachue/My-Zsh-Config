export EDITOR=vi
export VIM_APP_DIR=/Applications

if [ -x "`which go`" -a -d "$HOME/Projects/go_projects" ]; then
    export GOPATH=$HOME/go_projects
fi
