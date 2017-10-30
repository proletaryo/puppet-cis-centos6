# 4.2.4    Ensure permissions on all logfiles are configured (Scored)
  if ! defined(Exec['set log permissions']) {
    if defined('$cis_benchmark_4_2_4') {
      if $cis_benchmark_4_2_4 == 'failed' {   # remediate
        exec {'set log permissions':
          command => "find /var/log -type f -exec chmod g-wx,o-rwx {} +",
          path    => "/bin",
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
  else {
    ciscentos6::common::just_relay_fact_value { '4.2.4':
      benchmark_number => '4.2.4',
      benchmark_status => $cis_benchmark_4_2_4,
    }
  }
}
