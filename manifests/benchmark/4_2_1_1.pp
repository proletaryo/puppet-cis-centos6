# 4.2.1.1    Ensure rsyslog Service is enabled (Scored)
  if ! defined(Exec['enable rsyslog']) {
    if defined('$cis_benchmark_4_2_1_1') {
      if $cis_benchmark_4_2_1_1 == 'failed' {   # remediate
        exec {'enable rsyslog':
          command => "chkconfig rsyslog on",
          path    => "/bin:/sbin",
        }
      }
      else {
        notice( "CIS Benchmark 4.2.1.1  : $cis_benchmark_4_2_1_1")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.2.1.1':
      benchmark_number => '4.2.1.1',
      benchmark_status => $cis_benchmark_4_2_1_1,
    }
  }
}
