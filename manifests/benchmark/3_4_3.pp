# 3.4.3    Ensure /etc/hosts.deny is configured (Scored)
class ciscentos6::benchmark::3_4_3 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'create /etc/hosts.deny':
      command => "echo 'ALL: ALL' >> /etc/hosts.deny",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 3.4.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.4.3 : $cis_benchmark_3_4_3")
  }
}
