# 4.1.8    Ensure login and logout events are collected (Scored)
class ciscentos6::benchmark::4_1_8 {
  if $cis_benchmark_4_1_8 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $line = [
      '-w /var/log/lastlog -p wa -k logins',
      '-w /var/run/faillock/ -p wa -k logins'
    ]
    $lineregex = [
      '^-w\\s+/var/log/lastlog\\s+-p\\s+wa\\s+-k\\s+logins',
      '^-w\\s+/var/run/faillock/\\s+-p\\s+wa\\s+-k\\s+logins'
    ]
    define 4_1_8 {
      exec {"4_1_8 $title":
        command => "echo ${line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${lineregex[$title]} $filepath",
      }
    }
    4_1_8 { [0, 1]: } ->
    notify{ "CIS Benchmark 4.1.8 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.8 : $cis_benchmark_4_1_8")
  }
}
