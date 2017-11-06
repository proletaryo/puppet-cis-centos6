# 1.6.1.5    Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
class ciscentos6::benchmark::1_6_1_5 {
  if $cis_benchmark_1_6_1_5 == 'failed' {   # remediate
    package { 'mcstrans':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 1.6.1.5 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.6.1.5 : $cis_benchmark_1_6_1_5")
  }
}
