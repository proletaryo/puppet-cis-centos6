# 6.1.10    Ensure no world writable files exist (Scored)
class ciscentos6::benchmark::6_1_10 {
  if $cis_benchmark_6_1_10 == 'failed' {   # remediate
    exec {'6_1_10 remediate':
      command => "df --local -P | awk '{if (NR!=1) print \$6}' | xargs -I '{}' find '{}' -xdev -type f -perm -0002 | xargs -I '{}' chmod o-w '{}'",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 6.1.10 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.1.10 : $cis_benchmark_6_1_10")
  }
}
