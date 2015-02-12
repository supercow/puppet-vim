# == Class: vim::vundle
#
# Manages base installa and config for Vundle
#
# === Parameters
#
# ** None **
#
class vim::vundle {

  file { ['/etc/vim','/etc/vim/bundle']:
    ensure => directory,
  }

  vcsrepo { '/etc/vim/bundle/vundle':
    ensure   => present,
    provider => 'git',
    source   => 'http://github.com/gmarik/vundle.git',
  }

  exec { 'install vundle plugins':
    command     => '/usr/bin/vim -i /dev/null +PluginInstall +qall 2>&1 > /dev/null',
    subscribe   => [Concat[$::vim::conf_file],Vcsrepo['/etc/vim/bundle/vundle']],
    environment => 'HOME=/dev/null',
    refreshonly => true,
  }

}
