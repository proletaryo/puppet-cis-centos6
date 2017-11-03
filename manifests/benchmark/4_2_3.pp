# 4.2.3    Ensure rsyslog or syslog-ng is installed (Scored)
class ciscentos6::benchmark::4_2_3 {
  if $benchmark_status == 'failed' {   # remediate
    package { 'rsyslog':
      ensure => 'installed',
    } ->
    notify{ "CIS Benchmark 4.2.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.2.3 : $cis_benchmark_4_2_3")
  }
}
