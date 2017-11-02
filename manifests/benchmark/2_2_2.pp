# 2.2.2    Ensure X Window System is not installed (Scored)
class ciscentos6::benchmark::2_2_2 {
  if $benchmark_status == 'failed' {   # remediate
    package { 'xorg-x11*':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 2.2.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.2 : $cis_benchmark_2_2_2")
  }
}
