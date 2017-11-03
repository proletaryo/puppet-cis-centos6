# 1.1.21    Ensure sticky bit is set on all world-writable directories (Scored)
class ciscentos6::benchmark::1_1_21 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig time-dgram off':
      command => "df --local -P | awk '{ if (NR!=1) print $6 }' | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t",
      onlyif => "df --local -P | awk '{ if (NR!=1) print $6 }' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 1.1.21 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.1.21 : $cis_benchmark_1_1_21")
  }
}
