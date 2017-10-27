# 5.2.13    Ensure SSH Idle Timeout Interval is configured (Scored)
class ciscentos6::benchmark::5_2_13 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/ssh/sshd_config']) {
    if defined('$cis_benchmark_5_2_13') {
      if $cis_benchmark_5_2_13 == 'failed' {   # remediate
        augeas { 'set ClientAliveInterval 300':
          context => '/files/etc/ssh/sshd_config',
          changes => 'set ClientAliveInterval 300',
        }
        augeas { 'set ClientAliveCountMax 0':
          context => '/files/etc/ssh/sshd_config',
          changes => 'set ClientAliveCountMax 0',
          require  => Augeas['set ClientAliveInterval 300'],
        }

        notify{ "CIS Benchmark $benchmark_number : remediated":
          require  => Augeas['set ClientAliveCountMax 0'],
          loglevel => notice,
        }
      }
      else {
        notice( "CIS Benchmark 5.2.13  : $cis_benchmark_5_2_13")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.13':
      benchmark_number => '5.2.13',
      benchmark_status => $cis_benchmark_5_2_13,
    }
  }
}
