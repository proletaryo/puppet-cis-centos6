# 2.2.12    Ensure Samba is not enabled (Scored)
class ciscentos6::benchmark::2_2_12 {
  if $cis_benchmark_2_2_12 == 'failed' {   # remediate
    exec {'chkconfig smb off':
      command => "chkconfig smb off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P smb | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.12 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.12 : $cis_benchmark_2_2_12")
  }
}
