# 2.2.6    Ensure LDAP server is not enabled (Scored)
class ciscentos6::benchmark::2_2_6 {
  if $cis_benchmark_2_2_6 == 'failed' {   # remediate
    exec {'2_2_6 chkconfig slapd off':
      command => "chkconfig slapd off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P slapd | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.6 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.6 : $cis_benchmark_2_2_6")
  }
}
