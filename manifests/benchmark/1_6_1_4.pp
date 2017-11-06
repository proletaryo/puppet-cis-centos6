# 1.6.1.4    Ensure SETroubleshoot is not installed (Scored)
class ciscentos6::benchmark::1_6_1_4 {
  if $cis_benchmark_1_6_1_4 == 'failed' {   # remediate
    package { 'setroubleshoot':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 1.6.1.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.6.1.4 : $cis_benchmark_1_6_1_4")
  }
}
