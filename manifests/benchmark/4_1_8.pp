# 4.1.8    Ensure login and logout events are collected (Scored)
  if ! defined(Exec['line1']) {
    if defined('$cis_benchmark_4_1_8') {
      if $cis_benchmark_4_1_8 == 'failed' {   # remediate
        $line1 = '-w /var/log/lastlog -p wa -k logins'
        $line2 = '-w /var/run/faillock/ -p wa -k logins'
        exec {'line1':
          command => "echo $line1 >> /etc/audit/audit.rules",
          path    => "/bin:/sbin",
          unless  => "grep -P $line1 /etc/audit/audit.rules",
        }
        exec {'line2':
          command => "echo $line2 >> /etc/audit/audit.rules",
          path    => "/bin:/sbin",
          unless  => "grep -P $line2 /etc/audit/audit.rules",
          require => Exec['line1'],
        }
      }
      else {
        notice( "CIS Benchmark 4.1.8 : $cis_benchmark_4_1_8")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.8':
      benchmark_number => '4.1.8',
      benchmark_status => $cis_benchmark_4_1_8,
    }
  }
}
