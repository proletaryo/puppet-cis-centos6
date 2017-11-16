# 2.1.9    Ensure telnet server is not enabled (Scored)
class ciscentos6::benchmark::2_1_9 {
  if $cis_benchmark_2_1_9 == 'failed' {   # remediate
    exec {'2_1_9 chkconfig tftp off':
      command => "chkconfig tftp off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P tftp | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.9 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.9 : $cis_benchmark_2_1_9")
  }
}
