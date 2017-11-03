# 2.1.6    Ensure rsh server is not enabled (Scored)
class ciscentos6::benchmark::2_1_6 {
  if $cis_benchmark_2_1_6 == 'failed' {   # remediate
    exec {'chkconfig rexec off':
      command => "chkconfig rexec off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P rexec | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'chkconfig rlogin off':
      command => "chkconfig rlogin off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P rlogin | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'chkconfig rsh off':
      command => "chkconfig time-stream off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P rsh | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.6 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.6 : $cis_benchmark_2_1_6")
  }
}
