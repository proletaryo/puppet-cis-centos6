# 2.1.1    Ensure chargen services are not enabled (Scored)
class ciscentos6::benchmark::2_1_1 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig chargen-dgram off':
      command => "chkconfig chargen-dgram off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P chargen-dgram | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'chkconfig chargen-stream off':
      command => "chkconfig chargen-stream off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P chargen-stream | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.1 : $cis_benchmark_2_1_1")
  }
}
