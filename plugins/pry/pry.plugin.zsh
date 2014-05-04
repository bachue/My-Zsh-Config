pry () {
  pry_with_bundler () {
    bundle exec pry $@
  }

  pry_with_rvm () {
    `rvm gemdir`/bin/pry $@
  }

  pry_with_system () {
    /usr/bin/pry $@
  }

  if [ -e ./config/environment.rb ]; then
    if [ -e Gemfile.lock ] && grep -q pry Gemfile.lock; then
      pry_with_bundler -r ./config/environment $@ 
    elif [ "`command -v rvm`" != "" ] && [ -e "`rvm gemdir`/bin/pry" ]; then
      pry_with_rvm -r ./config/environment $@
    elif [ -e "/usr/bin/pry" ]; then
      pry_with_system -r ./config/environment $@
    else
      echo 'pry not found' > /dev/stderr
    fi
  elif [ "`command -v rvm`" != "" ] && [ -e "`rvm gemdir`/bin/pry" ]; then
    pry_with_rvm $@
  elif [ -e "/usr/bin/pry" ]; then
    pry_with_system $@
  else
    echo 'pry not found' > /dev/stderr
  fi
}
