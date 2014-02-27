# == Class: puppet::config
#
# Manages configuration for a puppet node.
#
# === Parameters
#
# Document parameters here.
#
# [*puppetserver*]
#   The fqdn of the puppet server.
#
# === Examples
#
#  This class should not be instantiated by its own. This will happen in the
#  class puppet.
#
# === Authors
#
# Christian Haeusler <christian.haeusler@md-systems.ch>
#
# === Copyright
#
# Copyright 2013 MD Systems.
#
class puppet::config (
  $puppetserver = "puppet.${::domain}"
) {

  file {'/etc/default/puppet':
      ensure => present,
      source => 'puppet:///modules/puppet/default/puppet',
  }

  Ini_setting {
    ensure  => present,
    path    => '/etc/puppet/puppet.conf',
  }

  ini_setting {'logdir':
    section => 'main',
    setting => 'logdir',
    value   => '/var/log/puppet',
  }

  ini_setting {'vardir':
    section => 'main',
    setting => 'vardir',
    value   => '/var/lib/puppet',
  }

  ini_setting {'ssldir':
    section => 'main',
    setting => 'ssldir',
    value   => '/var/lib/puppet/ssl',
  }

  ini_setting {'rundir':
    section => 'main',
    setting => 'rundir',
    value   => '/var/run/puppet',
  }

  ini_setting {'factpath':
    section => 'main',
    setting => 'factpath',
    value   => '$vardir/lib/facter',
  }

  ini_setting {'templatedir':
    section => 'main',
    setting => 'templatedir',
    value   => '$confdir/templates',
  }

  ini_setting {'pluginsync':
    section => 'agent',
    setting => 'pluginsync',
    value   => true,
  }

  ini_setting {'report':
    section => 'agent',
    setting => 'report',
    value   => true,
  }

  ini_setting {'server':
    section => 'agent',
    setting => 'server',
    value   => $puppetserver,
  }
}
