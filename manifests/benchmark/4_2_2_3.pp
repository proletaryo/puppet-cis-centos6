# 4.2.2.3    Ensure syslog-ng default file permissions configured (Scored)
class ciscentos6::benchmark::4_2_2_3 {
  if $cis_benchmark_4_2_2_3 == 'failed' {   # remediate
    exec {'/etc/syslog-ng/syslog-ng.conf':
      command => "sed -i '/^options/ s/perm([0-9]*)/perm\(0640\)/' /etc/syslog-ng/syslog-ng.conf",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 4.2.2.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.2.2.3  : $cis_benchmark_4_2_2_3")
  }
}
