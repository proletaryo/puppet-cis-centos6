# 4.1.8    Ensure login and logout events are collected (Scored)
class ciscentos6::benchmark::4_1_8 {
  if $cis_benchmark_4_1_8 == 'failed' {   # remediate
    $line1 = '-w /var/log/lastlog -p wa -k logins'
    $line2 = '-w /var/run/faillock/ -p wa -k logins'
    exec {'line1':
      command => "echo $line1 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      unless  => "grep -P $line1 /etc/audit/audit.rules",
    } ->
    exec {'line2':
      command => "echo $line2 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      unless  => "grep -P $line2 /etc/audit/audit.rules",
    } ->
    notify{ "CIS Benchmark 4.1.8 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.8 : $cis_benchmark_4_1_8")
  }
}
