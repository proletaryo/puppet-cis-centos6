# 4.1.16    Ensure system administrator actions (sudolog) are collected (Scored)
  if ! defined(Exec['line1']) {
    if defined('$cis_benchmark_4_1_16') {
      if $cis_benchmark_4_1_16 == 'failed' {   # remediate
        $line1 = '-w /var/log/sudo.log -p wa -k actions'
        exec {'line1':
          command => "echo $line1 >> /etc/audit/audit.rules",
          path    => "/bin",
          unless  => "grep -P $line1 /etc/audit/audit.rules",
        }
      }
      else {
        notice( "CIS Benchmark 4.1.16 : $cis_benchmark_4_1_16")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.16':
      benchmark_number => '4.1.16',
      benchmark_status => $cis_benchmark_4_1_16,
    }
  }
}
