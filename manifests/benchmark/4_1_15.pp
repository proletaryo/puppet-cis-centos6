# 4.1.15    Ensure changes to system administration scope (sudoers) is collected (Scored)
class ciscentos6::benchmark::4_1_15 {
  if $cis_benchmark_4_1_15 == 'failed' {   # remediate
    $line1 = '-w /etc/sudoers -p wa -k scope'
    $line2 = '-w /etc/sudoers.d -p wa -k scope'
    exec {'line1':
      command => "echo $line1 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      unless  => "grep -P $line1 /etc/audit/audit.rules",
    } ->
    exec {'line2':
      command => "echo $line2 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      unless  => "grep -P $line2 /etc/audit/audit.rules",
      require => Exec['line1'],
    } ->
    notify{ "CIS Benchmark 4.1.15 : remediated":
      require => Exec['line2'],
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.15 : $cis_benchmark_4_1_15")
  }
}
