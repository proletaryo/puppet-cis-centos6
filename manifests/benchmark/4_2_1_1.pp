# 4.2.1.1    Ensure rsyslog Service is enabled (Scored)
class ciscentos6::benchmark::4_2_1_1 {
  if $cis_benchmark_4_2_1_1 == 'failed' {   # remediate
    exec {'4_2_1_1 enable rsyslog':
      command => "chkconfig rsyslog on",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 4.2.1.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.2.1.1  : $cis_benchmark_4_2_1_1")
  }
}
