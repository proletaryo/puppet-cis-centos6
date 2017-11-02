# 3.6.4    Ensure outbound and established connections are configured (Not Scored)
class ciscentos6::benchmark::3_6_4 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'Configure iptables':
      command => "iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT; iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT; iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT; iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT; iptables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT; iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 3.6.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.6.4 : $cis_benchmark_3_6_4")
  }
}
