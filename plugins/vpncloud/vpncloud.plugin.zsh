vpncloud_set_dns() {
ruby <<RUBY
  services = <<-EOF
    Wi-Fi
    云梯 日本1号 PPTP
    云梯 日本1号 L2TP
    云梯 日本2号 PPTP
    云梯 日本2号 L2TP
    云梯 日本3号 PPTP
    云梯 日本3号 L2TP
    云梯 美国1号 PPTP
    云梯 美国1号 L2TP
    云梯 美国2号 L2TP
    云梯 美国2号 PPTP
    云梯 美国3号 PPTP
    云梯 美国3号 L2TP
    云梯 美国4号 PPTP
    云梯 美国4号 L2TP
    云梯 美国5号 PPTP
    云梯 美国5号 L2TP
    云梯 新加坡1号 PPTP
    云梯 新加坡1号 L2TP
    云梯 新加坡2号 PPTP
    云梯 新加坡2号 L2TP
    云梯 香港1号 PPTP
    云梯 香港1号 L2TP
    云梯 香港2号 PPTP
    云梯 香港2号 L2TP
    云梯 台湾1号 PPTP
    云梯 台湾1号 L2TP
    云梯 英国1号 PPTP
    云梯 英国1号 L2TP
  EOF
  services.each_line do |service|
    system 'sudo', 'networksetup', '-setdnsservers', service.strip, '8.8.8.8', '8.8.4.4', '223.5.5.5', '223.6.6.6', '208.67.222.222', '208.67.220.220', '199.91.73.222', '178.79.131.110'
  end
RUBY
}
