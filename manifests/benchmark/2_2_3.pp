# 2.2.3    Ensure Avahi Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_3 {
  if $cis_benchmark_2_2_3 == 'failed' {   # remediate
    exec {'2_2_3 chkconfig avahi-daemon off':
      command => "chkconfig avahi-daemon off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P avahi-daemon | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.3 : $cis_benchmark_2_2_3")
  }
}
