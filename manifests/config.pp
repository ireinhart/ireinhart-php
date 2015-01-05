class php::config inherits php {

  class { 'composer':
    auto_update  => true,
    command_name => 'composer',
    target_dir   => '/usr/local/bin',
    require      => Package['php5-cli'],
  }

#  exec { "run composer":
#    unless  => "ls /vagrant/SRC/composer.json",
#    cwd      => '/vagrant/SRC/',
#    command  => 'composer update && composer install',
#    timeout => 1800,
#    path    => '/bin:/usr/bin:/usr/local/bin',
#    require => Class['composer']
#  }

  class { 'php::config::mysqlserver':
        password => $php::mysql_password,
        sqlfile => $php::mysql_sqlfile,
  }

  include php::config::apache
  include php::config::xdebug
  include php::config::timezone
}
