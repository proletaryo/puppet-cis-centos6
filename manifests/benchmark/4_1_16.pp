# 4.1.16    Ensure system administrator actions (sudolog) are collected (Scored)
class ciscentos6::benchmark::4_1_16 {
  if $cis_benchmark_4_1_16 == 'failed' {   # remediate
    $line1 = '-w /var/log/sudo.log -p wa -k actions'
    exec {'line1':
      command => "echo $line1 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      unless  => "grep -P $line1 /etc/audit/audit.rules",
    } ->
    notify{ "CIS Benchmark 4.1.16 : remediated":
      require => Exec['line1'],
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.16 : $cis_benchmark_4_1_16")
  }
}
