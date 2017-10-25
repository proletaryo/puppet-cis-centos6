# 5.2.13    Ensure SSH Idle Timeout Interval is configured (Scored)
class ciscentos6::benchmark::5_2_13 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/ssh/sshd_config']) {
    ciscentos6::common::set_file_parameter { '/etc/ssh/sshd_config':
      benchmark_number => '5.2.13',
      benchmark_status => $cis_benchmark_5_2_13,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set ClientAliveInterval 300',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.13':
      benchmark_number => '5.2.13',
      benchmark_status => $cis_benchmark_5_2_13,
    }
  }
}
