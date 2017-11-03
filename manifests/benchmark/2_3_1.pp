# 2.3.1    Ensure NIS Client is not installed (Scored)
class ciscentos6::benchmark::2_3_1 {
  if $cis_benchmark_2_3_1 == 'failed' {   # remediate
    package { 'ypbind':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 2.3.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.3.1 : $cis_benchmark_2_3_1")
  }
}
