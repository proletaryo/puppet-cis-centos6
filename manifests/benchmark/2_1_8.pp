# 2.1.8    Ensure telnet server is not enabled (Scored)
class ciscentos6::benchmark::2_1_8 {
  if $cis_benchmark_2_1_8 == 'failed' {   # remediate
    exec {'2_1_8 chkconfig telnet off':
      command => "chkconfig telnet off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P telnet | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.8 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.8 : $cis_benchmark_2_1_8")
  }
}
