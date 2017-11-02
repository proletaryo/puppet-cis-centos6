# 4.1.2    Ensure auditd service is enabled (Scored)
  if ! defined(Exec['enable auditd']) {
    if defined('$cis_benchmark_4_1_2') {
      if $cis_benchmark_4_1_2 == 'failed' {   # remediate
        exec {'enable auditd':
          command => "chkconfig auditd on",
          path    => "/bin:/sbin",
        }
      }
      else {
        notice( "CIS Benchmark 4.1.2 : $cis_benchmark_4_1_2")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.2':
      benchmark_number => '4.1.2',
      benchmark_status => $cis_benchmark_4_1_2,
    }
  }
}
