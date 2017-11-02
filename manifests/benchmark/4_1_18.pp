# 4.1.18    Ensure the audit configuration is immutable (Scored)
  if ! defined(Exec['line1']) {
    if defined('$cis_benchmark_4_1_18') {
      if $cis_benchmark_4_1_18 == 'failed' {   # remediate
        $line1 = '-e 2'
        exec {'line1':
          command => "echo $line1 >> /etc/audit/audit.rules",
          path    => "/bin:/sbin",
          unless  => "grep -P $line1 /etc/audit/audit.rules",
        }
      }
      else {
        notice( "CIS Benchmark 4.1.18 : $cis_benchmark_4_1_18")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.18':
      benchmark_number => '4.1.18',
      benchmark_status => $cis_benchmark_4_1_18,
    }
  }
}
