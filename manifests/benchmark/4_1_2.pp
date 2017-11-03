# 4.1.2    Ensure auditd service is enabled (Scored)
class ciscentos6::benchmark::4_1_2 {
  if $cis_benchmark_4_1_2 == 'failed' {   # remediate
    exec {'enable auditd':
      command => "chkconfig auditd on",
      path    => "/bin:/sbin",
    }
    notify{ "CIS Benchmark 4.1.2 : remediated":
      require => Exec['enable auditd'],
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.2 : $cis_benchmark_4_1_2")
  }
}
