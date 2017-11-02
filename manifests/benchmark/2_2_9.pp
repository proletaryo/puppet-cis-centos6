# 2.2.9    Ensure FTP Server is not enabled (Scored)
class ciscentos6::benchmark::2_2_9 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig vsftpd off':
      command => "chkconfig vsftpd off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P vsftpd | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.9 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.9 : $cis_benchmark_2_2_9")
  }
}
