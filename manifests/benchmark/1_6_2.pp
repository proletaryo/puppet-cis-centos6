# 1.6.2    Ensure SELinux is installed (Scored)
class ciscentos6::benchmark::1_6_2 {
  if $cis_benchmark_1_6_2 == 'failed' {   # remediate
    package { 'libselinux':
      ensure => 'installed',
    } ->
    notify{ "CIS Benchmark 1.6.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.6.2 : $cis_benchmark_1_6_2")
  }
}
