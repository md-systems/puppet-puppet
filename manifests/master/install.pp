# == Class: puppet::master::install
#
# Installs all packages needed for a puppet master
#
#
# === Examples
#
#  class { 'puppet::master::install': }
#
# === Authors
#
# Christian Haeusler <christian.haeusler@md-systems.ch>
#
# === Copyright
#
# Copyright 2013 MD Systems.
#
class puppet::master::install {
  package { 'puppetmaster':
    ensure => installed,
  }
}
