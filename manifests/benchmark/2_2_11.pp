# 2.2.11    Ensure IMAP and POP3 server is not enabled (Scored)
class ciscentos6::benchmark::2_2_11 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig dovecot off':
      command => "chkconfig dovecot off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P dovecot | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.11 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.11 : $cis_benchmark_2_2_11")
  }
}
