# 2.2.8    Ensure DNS Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_8 {
  if $cis_benchmark_2_2_8 == 'failed' {   # remediate
    exec {'2_2_8 chkconfig named off':
      command => "chkconfig named off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P named | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.8 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.8 : $cis_benchmark_2_2_8")
  }
}
