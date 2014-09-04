anchor { 'begin': } ->

class { 'razor': } ->

class { 'postgresql::server': } ->

postgresql::server::db { 'razor_prd':
  user     => 'razor',
  password => postgresql_password('razor', 'mypass'),
  grant    => 'all',
} ->

file { '/opt/razor/config.yaml':
  ensure => 'link',
  target => '/opt/razor/config.yaml.sample',
} ->

exec { '/usr/local/bin/razor-admin -e production migrate-database':
  cwd         => '/opt/razor',
  # environment => [
  #   'TORQUEBOX_HOME=/opt/razor-torquebox',
  #   'JBOSS_HOME=/opt/razor-torquebox/jboss',
  #   'JRUBY_HOME=/opt/razor-torquebox/jruby'
  # ],
  # path        => '/opt/razor-torquebox/jruby/bin:/bin:/usr/bin:/usr/local/bin',
  # refreshonly => true
} ->

anchor { 'end': }