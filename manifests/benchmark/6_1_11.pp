# 6.1.11    Ensure no unowned files or directories exist (Scored)
class ciscentos6::benchmark::6_1_11 {
  if $cis_benchmark_6_1_11 == 'failed' {   # remediate
    exec {'6_1_11 remediate':
      command => "df --local -P | awk '{if (NR!=1) print \$6}' | xargs -I '{}' find '{}' -xdev -nouser | xargs -I '{}' chown root '{}'",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 6.1.11 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.1.11 : $cis_benchmark_6_1_11")
  }
}
