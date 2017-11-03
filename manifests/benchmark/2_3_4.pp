# 2.3.4    Ensure telnet client is not installed (Scored)
class ciscentos6::benchmark::2_3_4 {
  if $cis_benchmark_2_3_4 == 'failed' {   # remediate
    package { 'telnet':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 2.3.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.3.4 : $cis_benchmark_2_3_4")
  }
}
