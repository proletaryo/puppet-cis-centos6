# 5.1.1    Ensure cron daemon is enabled (Scored)
class ciscentos6::benchmark::5_1_1 {
  if $cis_benchmark_5_1_1 == 'failed' {   # remediate
    exec {'enable crond':
      command => "chkconfig crond off",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 5.1.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 5.1.1  : $cis_benchmark_5_1_1")
  }
}
