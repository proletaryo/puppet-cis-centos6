# 4.1.16    Ensure system administrator actions (sudolog) are collected (Scored)
class ciscentos6::benchmark::4_1_16 {
  if defined('$cis_benchmark_4_1_16') {
    if $cis_benchmark_4_1_16 == 'failed' {   # remediate
      $line1 = '-w /var/log/sudo.log -p wa -k actions'
      exec {'line1':
        command => "echo $line1 >> /etc/audit/audit.rules",
        path    => "/bin:/sbin",
        unless  => "grep -P $line1 /etc/audit/audit.rules",
      }
      notify{ "CIS Benchmark 4.1.16 : remediated":
        require => Exec['line1'],
        loglevel => notice,
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
