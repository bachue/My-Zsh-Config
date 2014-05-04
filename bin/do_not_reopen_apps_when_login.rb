#!/usr/bin/env ruby

require 'fileutils'

target = "#{__dir__}/clear_login_windows.sh"

File.open(target, 'w') do |f|
  f.puts <<-CONTENT
#!/bin/bash
rm /Users/*/Library/Preferences/ByHost/com.apple.loginwindow.*
  CONTENT
end


FileUtils.chmod 0755, target

puts "sudo defaults write com.apple.loginwindow LoginHook #{target}"
puts `sudo defaults write com.apple.loginwindow LoginHook #{target}`
