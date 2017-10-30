# 4.2.2.1    Ensure syslog-ng service is enabled (Scored)
  if ! defined(Exec['enable rsyslog']) {
    if defined('$cis_benchmark_4_2_2_1') {
      if $cis_benchmark_4_2_2_1 == 'failed' {   # remediate
        exec {'enable rsyslog':
          command => "chkconfig syslog-ng off",
          path    => "/bin",
        }
      }
      else {
        notice( "CIS Benchmark 4.2.2.1  : $cis_benchmark_4_2_2_1")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.2.2.1':
      benchmark_number => '4.2.2.1',
      benchmark_status => $cis_benchmark_4_2_2_1,
    }
  }
}
