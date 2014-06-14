function absolute() {
    ruby -e "if ARGV.size == 1 then puts(File.absolute_path(ARGV[0])) else STDERR.puts(%(usage: absolute relative_path)); exit! end" $*
}
