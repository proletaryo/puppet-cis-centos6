# 2.1.3    Ensure discard services are not enabled (Scored)
class ciscentos6::benchmark::2_1_3 {
  if $cis_benchmark_2_1_3 == 'failed' {   # remediate
    exec {'2_1_3 chkconfig discard-dgram off':
      command => "chkconfig discard-dgram off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P discard-dgram | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'2_1_3 chkconfig discard-stream off':
      command => "chkconfig discard-stream off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P discard-stream | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.3 : $cis_benchmark_2_1_3")
  }
}
