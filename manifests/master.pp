# == Class: puppet::master::install
#
# Installs and configures a puppetmaster.
#
# === Variables
#
# [*fqdn*]
#   The fqdn is used to configure the node to be an agent to itself.
#
# === Examples
#
#  class { 'puppet::master': }
#
# === Authors
#
# Christian Haeusler <christian.haeusler@md-systems.ch>
#
# === Copyright
#
# Copyright 2013 MD Systems.
#
class puppet::master {
  class {'stdlib': }

  class {'puppet':
    puppetserver => $::fqdn,
  }
  class {'puppet::master::install':
    stage => setup,
  }
  class {'puppet::master::config':
    stage => setup,
  }
  class {'puppet::master::service': }
  class {'puppetdb': }
  class {'puppetdb::master::config': }

  Class['puppet::master::install']->Class['puppet::master::config']
  Class['puppet::master::install']->Class['puppet::master::service']
  Class['puppet::master::config']~>Class['puppet::master::service']
}
