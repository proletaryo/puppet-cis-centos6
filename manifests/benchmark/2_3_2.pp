# 2.3.2    Ensure rsh client is not installed (Scored)
class ciscentos6::benchmark::2_3_2 {
  if $cis_benchmark_2_3_2 == 'failed' {   # remediate
    package { 'rsh':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 2.3.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.3.2 : $cis_benchmark_2_3_2")
  }
}
