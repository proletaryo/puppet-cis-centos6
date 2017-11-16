# 5.2.16    Ensure SSH warning banner is configured (Scored)
class ciscentos6::benchmark::5_2_16 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_16']) {
    ciscentos6::common::set_file_parameter { '5_2_16':
      benchmark_number => '5.2.16',
      benchmark_status => $cis_benchmark_5_2_16,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set Banner /etc/issue.net',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.16':
      benchmark_number => '5.2.16',
      benchmark_status => $cis_benchmark_5_2_16,
    }
  }
}
