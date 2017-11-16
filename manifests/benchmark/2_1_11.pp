# 2.1.11    Ensure xinetd is not enabled (Scored)
class ciscentos6::benchmark::2_1_11 {
  if $cis_benchmark_2_1_11 == 'failed' {   # remediate
    exec {'2_1_11 chkconfig xinetd off':
      command => "chkconfig xinetd off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P xinetd | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.11 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.11 : $cis_benchmark_2_1_11")
  }
}
