# 6.1.12    Ensure no ungrouped files or directories exist (Scored)
class ciscentos6::benchmark::6_1_12 {
  if $cis_benchmark_6_1_12 == 'failed' {   # remediate
    exec {'6_1_12 remediate':
      command => "cat /etc/shadow | awk -F: '(\$2 == \"\" ) { print \$1}' | xargs -I '{}' passwd -l '{}'",
      path    => "/bin:/sbin:/usr/bin",
    } ->
    notify{ "CIS Benchmark 6.1.12 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.1.12 : $cis_benchmark_6_1_12")
  }
}
