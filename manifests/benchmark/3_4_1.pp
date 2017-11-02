# 3.4.1    Ensure TCP Wrappers is installed (Scored)
class ciscentos6::benchmark::3_4_1 {
  if $benchmark_status == 'failed' {   # remediate
    package { 'tcp_wrappers':
      ensure => 'installed',
    } ->
    notify{ "CIS Benchmark 3.4.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.4.1 : $cis_benchmark_3_4_1")
  }
}
