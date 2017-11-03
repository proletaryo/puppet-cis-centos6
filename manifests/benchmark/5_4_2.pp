# 5.4.2    Ensure system accounts are non-login (Scored)
class ciscentos6::benchmark::5_4_2 {
  if defined('$cis_benchmark_5_4_2') {
    if $cis_benchmark_5_4_2 == 'failed' {   # remediate
      exec {'run script':
        command => "for user in `awk -F: '(\$3 < 500) {print \$1 }' /etc/passwd` ; do if [ \$user != 'root' ]; then usermod -L \$user; if [ \$user != 'sync' ] && [ \$user != 'shutdown' ] && [ \$user != 'halt' ]; then usermod -s /sbin/nologin \$user; fi; fi; done",
        path    => "/bin:/sbin:/usr/bin/:/usr/sbin/",
        provider => shell,
      } ->
      notify{ "CIS Benchmark 5.4.2 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 5.4.2  : $cis_benchmark_5_4_2")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
