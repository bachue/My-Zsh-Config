if [[ -n "`which ruby`" ]]; then
    alias start-httpserver='ruby -run -e httpd .'
    function disasm() {
        ruby -e "puts RubyVM::InstructionSequence.compile(File.read('$1')).disasm"
    }
fi
