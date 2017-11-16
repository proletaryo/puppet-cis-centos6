# 3.6.2    Ensure default deny firewall policy (Scored)
class ciscentos6::benchmark::3_6_2 {
  if $cis_benchmark_3_6_2 == 'failed' {   # remediate
    exec {'3_6_2 implement a default DROP policy':
      command => "iptables -P INPUT DROP; iptables -P OUTPUT DROP; iptables -P FORWARD DROP",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 3.6.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.6.2 : $cis_benchmark_3_6_2")
  }
}
