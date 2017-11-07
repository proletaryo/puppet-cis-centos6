# 4.1.15    Ensure changes to system administration scope (sudoers) is collected (Scored)
class ciscentos6::benchmark::4_1_15 {
  if $cis_benchmark_4_1_15 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $line = [
      '-w /etc/sudoers -p wa -k scope',
      '-w /etc/sudoers.d -p wa -k scope'
    ]
    $lineregex = [
      '^-w\\s+/etc/sudoers\\s+-p\\s+wa\\s+-k\\s+scope',
      '^-w\\s+/etc/sudoers.d\\s+-p\\s+wa\\s+-k\\s+scope'
    ]
    define 4_1_15 {
      exec {"4_1_15 $title":
        command => "echo ${line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${lineregex[$title]} $filepath",
      }
    }
    4_1_15 { [0, 1]: } ->
    notify{ "CIS Benchmark 4.1.15 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.15 : $cis_benchmark_4_1_15")
  }
}
