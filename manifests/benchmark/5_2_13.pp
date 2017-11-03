# 5.2.13    Ensure SSH Idle Timeout Interval is configured (Scored)
class ciscentos6::benchmark::5_2_13 {
  if $cis_benchmark_5_2_13 == 'failed' {   # remediate
    augeas { 'set ClientAliveInterval 300':
      context => '/files/etc/ssh/sshd_config',
      changes => 'set ClientAliveInterval 300',
    } ->
    augeas { 'set ClientAliveCountMax 0':
      context => '/files/etc/ssh/sshd_config',
      changes => 'set ClientAliveCountMax 0',
    } ->
    notify{ "CIS Benchmark $benchmark_number : remediated":
      require  => Augeas['set ClientAliveCountMax 0'],
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 5.2.13  : $cis_benchmark_5_2_13")
  }
}
