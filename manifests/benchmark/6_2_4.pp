# 6.2.4    Ensure no legacy "+" entries exist in /etc/shadow (Scored)
class ciscentos6::benchmark::6_2_4 {
  if $cis_benchmark_6_2_4 == 'failed' {   # remediate
    exec {'6_2_4 remediate':
      command => "sed -i '/^+:/d' /etc/group",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 6.2.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.4 : $cis_benchmark_6_2_4")
  }
}
