# == Class: puppet::master::service
#
# Defines the services for a puppetmaster.
#
# === Examples
#
#  class { 'puppet::master::service': }
#
# === Authors
#
# Christian Haeusler <christian.haeusler@md-systems.ch>
#
# === Copyright
#
# Copyright 2013 MD Systems.
#
class puppet::master::service {
  service { 'puppetmaster':
    ensure => running,
  }
}
