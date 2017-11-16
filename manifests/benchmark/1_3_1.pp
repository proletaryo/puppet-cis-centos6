# 1.3.1    Ensure AIDE is installed (Scored)
class ciscentos6::benchmark::1_3_1 {
  if $cis_benchmark_1_3_1 == 'failed' {   # remediate
    package { 'aide':
      ensure => 'installed',
    } ->
    exec{'1_3_1 initialize aide':
      command => "aide --init; mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 1.3.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.3.1 : $cis_benchmark_1_3_1")
  }
}
