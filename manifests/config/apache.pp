class php::config::apache {

  include 'apache2'

  realize(Apache2::Module['rewrite'])

  apache2::module { ['php5']:
    ensure  => present,
    require => Class[php::install],
  }

  # Setups the virtual host
  file { '/etc/apache2/sites-available/php-site.conf':
    source  => 'puppet:///modules/php/site.conf',
    notify  => Service['apache2'],
    require => Class['apache2'],
  }
  apache2::site{ 'php-site.conf':
    ensure  => 'present',
    require => File['/etc/apache2/sites-available/php-site.conf']
  }
}
