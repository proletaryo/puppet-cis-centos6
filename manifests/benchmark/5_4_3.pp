# 5.4.3    Ensure default group for the root account is GID 0 (Scored)
class ciscentos6::benchmark::5_4_3 {
  if $cis_benchmark_5_4_3 == 'failed' {   # remediate
    exec {'usermod -g 0 root':
      command => "usermod -g 0 root",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 5.4.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 5.4.3 : $cis_benchmark_5_4_3")
  }
}
