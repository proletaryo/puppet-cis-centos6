# 4.1.16    Ensure system administrator actions (sudolog) are collected (Scored)
class ciscentos6::benchmark::4_1_16 {
  if $cis_benchmark_4_1_16 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $line = '-w /var/log/sudo.log -p wa -k actions'
    $lineregex = '^-w\\s+/var/log/sudo.log\\s+-p\\s+wa\\s+-k\\s+actions'
    exec {"4_1_16":
      command => "echo $line >> $filepath",
      path    => "/bin:/sbin",
      unless  => "grep -P $lineregex $filepath",
    } ->
    notify{ "CIS Benchmark 4.1.16 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.16 : $cis_benchmark_4_1_16")
  }
}
