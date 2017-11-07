# 4.1.7    Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
class ciscentos6::benchmark::4_1_7 {
  if $cis_benchmark_4_1_7 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $line = '-w /etc/selinux/ -p wa -k MAC-policy'
    $lineregex = '^-w\\s+/etc/selinux/\\s+-p\\s+wa\\s+-k\\s+MAC-policy'
    exec {"4_1_7":
      command => "echo $line >> $filepath",
      path    => "/bin:/sbin",
      unless  => "grep -P $lineregex $filepath",
    } ->
    notify{ "CIS Benchmark 4.1.7 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.7 : $cis_benchmark_4_1_7")
  }
}
