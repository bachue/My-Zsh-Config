function start-httpserver() {
    if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
        bash -c "source '$HOME/.rvm/scripts/rvm' && rvm use 2; ruby -run -e httpd . $*"
    fi
}

function disasm() {
    ruby -e "puts RubyVM::InstructionSequence.compile(File.read('$1')).disasm"
}
