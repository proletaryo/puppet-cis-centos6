# 2.2.10    Ensure HTTP server is not enabled (Scored)
class ciscentos6::benchmark::2_2_10 {
  if $cis_benchmark_2_2_10 == 'failed' {   # remediate
    exec {'2_2_10 chkconfig httpd off':
      command => "chkconfig httpd off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P httpd | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.10 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.10 : $cis_benchmark_2_2_10")
  }
}
