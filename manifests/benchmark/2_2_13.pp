# 2.2.13    Ensure HTTP Proxy Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_13 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig squid off':
      command => "chkconfig squid off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P squid | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.13 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.13 : $cis_benchmark_2_2_13")
  }
}
