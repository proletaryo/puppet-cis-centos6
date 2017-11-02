# 2.1.10    Ensure rsync service is not enabled (Scored)
class ciscentos6::benchmark::2_1_10 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig rsync off':
      command => "chkconfig rsync off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P rsync | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.10 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.10 : $cis_benchmark_2_1_10")
  }
}
