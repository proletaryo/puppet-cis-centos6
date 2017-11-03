# 2.3.5    Ensure LDAP client is not installed (Scored)
class ciscentos6::benchmark::2_3_5 {
  if $cis_benchmark_2_3_5 == 'failed' {   # remediate
    package { 'openldap-clients':
      ensure => 'purged',
    } ->
    notify{ "CIS Benchmark 2.3.5 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.3.5 : $cis_benchmark_2_3_5")
  }
}
