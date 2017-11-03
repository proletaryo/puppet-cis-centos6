# 3.6.1    Ensure iptables is installed (Scored)
class ciscentos6::benchmark::3_6_1 {
  if $cis_benchmark_3_6_1 == 'failed' {   # remediate
    package { 'iptables':
      ensure => 'installed',
    } ->
    notify{ "CIS Benchmark 3.6.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.6.1 : $cis_benchmark_3_6_1")
  }
}
