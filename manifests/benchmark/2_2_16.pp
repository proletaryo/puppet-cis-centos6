# 2.2.16    Ensure NIS Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_16 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig ypserv off':
      command => "chkconfig ypserv off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P ypserv | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.16 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.16 : $cis_benchmark_2_2_16")
  }
}
