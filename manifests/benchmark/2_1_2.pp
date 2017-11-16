# 2.1.2    Ensure daytime services are not enabled (Scored)
class ciscentos6::benchmark::2_1_2 {
  if $cis_benchmark_2_1_2 == 'failed' {   # remediate
    exec {'2_1_2 chkconfig daytime-dgram off':
      command => "chkconfig chargen-dgram off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P daytime-dgram | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'2_1_2 chkconfig daytime-stream off':
      command => "chkconfig chargen-stream off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P daytime-stream | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.2 : $cis_benchmark_2_1_2")
  }
}
