# 2.1.4    Ensure echo services are not enabled (Scored)
class ciscentos6::benchmark::2_1_4 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig echo-dgram off':
      command => "chkconfig echo-dgram off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P echo-dgram | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'chkconfig echo-stream off':
      command => "chkconfig echo-stream off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P echo-stream | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.4 : $cis_benchmark_2_1_4")
  }
}
