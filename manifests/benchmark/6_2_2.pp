# 6.2.2    Ensure no legacy "+" entries exist in /etc/passwd (Scored)
class ciscentos6::benchmark::6_2_2 {
  if $cis_benchmark_6_2_2 == 'failed' {   # remediate
    exec {'6_2_2 remediate':
      command => "sed -i '/^+:/d' /etc/passwd",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 6.2.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.2 : $cis_benchmark_6_2_2")
  }
}
