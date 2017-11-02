# 5.4.4    Ensure default user umask is 027 or more restrictive (Scored)
class ciscentos6::benchmark::5_4_4 {
  if defined('$cis_benchmark_5_4_4') {
    if $cis_benchmark_5_4_4 == 'failed' {   # remediate
      augeas { '/etc/bashrc':
        context => '/files/etc/bashrc',
        changes => 'set umask 027',
      }
      augeas { '/etc/profile':
        context => '/files/etc/profile',
        changes => 'set umask 027',
        require  => Augeas['/etc/bashrc'],
      }
      notify{ "CIS Benchmark 5.4.4 : remediated":
        require  => Augeas['/etc/profile'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 5.4.4 : $cis_benchmark_5_4_4")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
