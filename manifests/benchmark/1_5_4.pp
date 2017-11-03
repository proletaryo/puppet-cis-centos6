# 1.5.4    Ensure prelink is disabled (Scored)
class ciscentos6::benchmark::1_5_4 {
  if $cis_benchmark_1_5_4 == 'failed' {   # remediate
    exec {'prelink -ua':
      command => "prelink -ua",
      path    => "/bin:/sbin:/usr/sbin",
    } ->
    package { 'prelink':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 1.5.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.5.4 : $cis_benchmark_1_5_4")
  }
}
