# 2.2.5    Ensure DHCP Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_5 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig dhcpd off':
      command => "chkconfig dhcpd off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P dhcpd | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.5 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.5 : $cis_benchmark_2_2_5")
  }
}
