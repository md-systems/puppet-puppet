# == Class: puppet
#
# Installs and configures a puppet agent.
#
# === Variables
#
# [*puppetserver*]
#   The fqdn of the puppetmaster to connect with.
#
# === Examples
#
#  class { 'puppet':
#    $puppetserver = 'puppet.example.com',
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
class puppet (
  $puppetserver = "puppet.${::domain}"
) {
  package { 'puppet' :
    ensure => present,
  }

  class {'puppet::config':
    puppetserver => $puppetserver,
  }

  service { 'puppet':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }

  Package['puppet']->Class['puppet::config']~>Service['puppet']
}
