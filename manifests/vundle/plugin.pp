define vim::vundle::plugin(
  $source = $name,
  $comment = "Vundle plugin ${name}",
  $args = {},
  $target = '/etc/vim/vimrc',
) {
  concat::fragment { "vundle_${name}":
    ensure  => present,
    target  => $::vim::conf_file,
    order   => '020',
    content => template('vim/vundle_plugin.erb'),
  }
}
