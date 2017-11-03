# 2.1.5    Ensure time services are not enabled (Scored)
class ciscentos6::benchmark::2_1_5 {
  if $cis_benchmark_2_1_5 == 'failed' {   # remediate
    exec {'chkconfig time-dgram off':
      command => "chkconfig time-dgram off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P time-dgram | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'chkconfig time-stream off':
      command => "chkconfig time-stream off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P time-stream | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.5 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.5 : $cis_benchmark_2_1_5")
  }
}
