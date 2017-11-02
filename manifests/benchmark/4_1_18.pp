# 4.1.18    Ensure the audit configuration is immutable (Scored)
class ciscentos6::benchmark::4_1_18 {
  if defined('$cis_benchmark_4_1_18') {
    if $cis_benchmark_4_1_18 == 'failed' {   # remediate
      $line1 = '-e 2'
      exec {'line1':
        command => "echo $line1 >> /etc/audit/audit.rules",
        path    => "/bin:/sbin",
        unless  => "grep -P $line1 /etc/audit/audit.rules",
      }
      notify{ "CIS Benchmark 4.1.18 : remediated":
        require => Exec['line1'],
        loglevel => notice,
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
