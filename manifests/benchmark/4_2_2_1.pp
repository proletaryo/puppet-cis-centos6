# 4.2.2.1    Ensure syslog-ng service is enabled (Scored)
class ciscentos6::benchmark::4_2_2_1 {
  if $cis_benchmark_4_2_2_1 == 'failed' {   # remediate
    exec {'enable syslog-ng':
      command => "chkconfig syslog-ng on",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 4.2.2.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.2.2.1  : $cis_benchmark_4_2_2_1")
  }
}
