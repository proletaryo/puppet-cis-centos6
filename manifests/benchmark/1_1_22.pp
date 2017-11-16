# 1.1.22    Disable Automounting (Scored)
class ciscentos6::benchmark::1_1_22 {
  if $cis_benchmark_1_1_22 == 'failed' {   # remediate
    exec {'1_1_22 chkconfig autofs off':
      command => "chkconfig autofs off",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 1.1.22 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.1.22 : $cis_benchmark_1_1_22")
  }
}
