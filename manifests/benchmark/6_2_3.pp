# 6.2.3    Ensure no legacy "+" entries exist in /etc/shadow (Scored)
class ciscentos6::benchmark::6_2_3 {
  if $cis_benchmark_6_2_3 == 'failed' {   # remediate
    exec {'6_2_3 remediate':
      command => "sed -i '/^+:/d' /etc/shadow",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 6.2.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.3 : $cis_benchmark_6_2_3")
  }
}
