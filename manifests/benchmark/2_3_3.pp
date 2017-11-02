# 2.3.3    Ensure talk client is not installed (Scored)
class ciscentos6::benchmark::2_3_3 {
  if $benchmark_status == 'failed' {   # remediate
    package { 'talk':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 2.3.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.3.3 : $cis_benchmark_2_3_3")
  }
}
