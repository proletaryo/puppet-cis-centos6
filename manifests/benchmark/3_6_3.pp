# 3.6.3    Ensure loopback traffic is configured (Scored)
class ciscentos6::benchmark::3_6_3 {
  if $cis_benchmark_3_6_3 == 'failed' {   # remediate
    exec {'3_6_3 implement the loopback rules':
      command => "iptables -A INPUT -i lo -j ACCEPT; iptables -A OUTPUT -o lo -j ACCEPT; iptables -A INPUT -s 127.0.0.0/8 -j DROP",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 3.6.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.6.3 : $cis_benchmark_3_6_3")
  }
}
