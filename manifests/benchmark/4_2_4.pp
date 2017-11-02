# 4.2.4    Ensure permissions on all logfiles are configured (Scored)
class ciscentos6::benchmark::4_2_4 {
  if defined('$cis_benchmark_4_2_4') {
    if $cis_benchmark_4_2_4 == 'failed' {   # remediate
      exec {'set log permissions':
        command => "find /var/log -type f -exec chmod g-wx,o-rwx {} +",
        path    => "/bin:/sbin",
      }
      notify{ "CIS Benchmark 4.2.4 : remediated":
        require => Exec['set log permissions'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 4.2.4  : $cis_benchmark_4_2_4")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
