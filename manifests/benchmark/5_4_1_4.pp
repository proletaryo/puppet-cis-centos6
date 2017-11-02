# 5.4.1.3    Ensure password expiration warning days is 7 or more (Scored)
class ciscentos6::benchmark::5_4_1_3 {
  if defined('$cis_benchmark_5_4_1_3') {
    if $cis_benchmark_5_4_1_3 == 'failed' {   # remediate
      exec {'useradd -D -f 30':
        command => "useradd -D -f 30",
        path    => "/bin:/sbin",
      }
      notify{ "CIS Benchmark 5.4.1.3 : remediated":
        require => Exec['useradd -D -f 30'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 5.4.1.3 : $cis_benchmark_5_4_1_3")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
