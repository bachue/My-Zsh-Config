export EDITOR=vi
export VIM_APP_DIR=/Applications

LINUX_MANPATH="$HOME/Library/Application Support/Dash/Man Pages/Linux/man"
if [ -d "$LINUX_MANPATH" ]; then
    export MANPATH="$MANPATH:$LINUX_MANPATH"
fi
