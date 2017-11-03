# 2.1.7    Ensure talk server is not enabled (Scored)
class ciscentos6::benchmark::2_1_7 {
  if $cis_benchmark_2_1_7 == 'failed' {   # remediate
    exec {'chkconfig talk off':
      command => "chkconfig talk off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P talk | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.1.7 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.1.7 : $cis_benchmark_2_1_7")
  }
}
