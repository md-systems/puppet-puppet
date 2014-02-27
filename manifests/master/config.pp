# == Class: puppet::master::config
#
# Sets configuration for a puppet master.
#
# === Parameters
#
# [*certname*]
#   The domain name used for the certificate. Defaults to the fact $fqdn.
#
# === Examples
#
#  class { 'puppet::master::config':
#    certname => 'puppet@example.com',
#  }
#
# === Authors
#
# Christian Haeusler <christian.haeusler@md-systems.ch>
#
# === Copyright
#
# Copyright 2013 MD Systems.
#
class puppet::master::config (
  $certname = $::fqdn
) {

  file {'/etc/default/puppetmaster':
    ensure => present,
    source => 'puppet:///modules/puppet/default/puppetmaster',
  }

  Ini_setting {
    ensure  => present,
    section => 'master',
    path    => '/etc/puppet/puppet.conf',
  }

  ini_setting {'certname':
    setting => 'certname',
    value   => $certname,
  }

  ini_setting {'ausign':
    setting => 'ausign',
    value   => true,
  }

  ini_setting {'parser':
    setting => 'parser',
    value   => 'future',
  }

  if $::virtual == 'virtualbox' {
    ini_setting {'manifestdir':
      setting => 'manifestdir',
      value   => '/vagrant/manifests',
    }

    ini_setting {'modulepath':
      setting => 'modulepath',
      value   => '/vagrant/modules',
    }
  }

  file { '/etc/puppet/autosign.conf':
    ensure  => present,
    content => template('puppet/autosign.conf.erb'),
    owner   => 'puppet',
    group   => 'puppet',
  }
}
