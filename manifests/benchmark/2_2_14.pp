# 2.2.14    Ensure SNMP Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_14 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig snmpd off':
      command => "chkconfig snmpd off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P snmpd | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.14 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.14 : $cis_benchmark_2_2_14")
  }
}
