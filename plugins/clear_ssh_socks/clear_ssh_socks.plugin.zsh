function clear_ssh_socks() {
    ruby -e 'Dir["/tmp/ssh_*"].select { |file| File.socket?(file) }.each { |file| File.unlink(file) }'
}
