# 4.1.9    Ensure session initiation information is collected (Scored)
class ciscentos6::benchmark::4_1_9 {
  if $cis_benchmark_4_1_9 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $line = [
      '-w /var/run/utmp -p wa -k session',
      '-w /var/log/wtmp -p wa -k session',
      '-w /var/log/btmp -p wa -k session'
    ]
    $lineregex = [
      '^-w\\s+/var/run/utmp\\s+-p\\s+wa\\s+-k\\s+session',
      '^-w\\s+/var/log/wtmp\\s+-p\\s+wa\\s+-k\\s+session',
      '^-w\\s+/var/log/btmp\\s+-p\\s+wa\\s+-k\\s+session'
    ]
    define 4_1_9 {
      exec {"4_1_9 $title":
        command => "echo ${line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${lineregex[$title]} $filepath",
      }
    }
    4_1_9 { [0, 1, 2]: } ->
    notify{ "CIS Benchmark 4.1.9 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.9 : $cis_benchmark_4_1_9")
  }
}
