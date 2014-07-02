dnsmasq_start () {
    sudo launchctl start homebrew.mxcl.dnsmasq
}
dnsmasq_stop () {
    sudo launchctl stop homebrew.mxcl.dnsmasq
}
dnsmasq_restart () {
    dnsmasq_stop
    dnsmasq_start
}
