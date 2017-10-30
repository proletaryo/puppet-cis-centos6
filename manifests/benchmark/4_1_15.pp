# 4.1.15    Ensure changes to system administration scope (sudoers) is collected (Scored)
  if ! defined(Exec['line1']) {
    if defined('$cis_benchmark_4_1_15') {
      if $cis_benchmark_4_1_15 == 'failed' {   # remediate
        $line1 = '-w /etc/sudoers -p wa -k scope'
        $line2 = '-w /etc/sudoers.d -p wa -k scope'
        exec {'line1':
          command => "echo $line1 >> /etc/audit/audit.rules",
          path    => "/bin",
          unless  => "grep -P $line1 /etc/audit/audit.rules",
        }
        exec {'line2':
          command => "echo $line2 >> /etc/audit/audit.rules",
          path    => "/bin",
          unless  => "grep -P $line2 /etc/audit/audit.rules",
          require => Exec['line1'],
        }
      }
      else {
        notice( "CIS Benchmark 4.1.15 : $cis_benchmark_4_1_15")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.15':
      benchmark_number => '4.1.15',
      benchmark_status => $cis_benchmark_4_1_15,
    }
  }
}
