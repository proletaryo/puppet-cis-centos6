# 5.2.3    Ensure SSH LogLevel is set to INFO (Scored)
class ciscentos6::benchmark::5_2_3 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_3']) {
    ciscentos6::common::set_file_parameter { '5_2_3':
      benchmark_number => '5.2.3',
      benchmark_status => $cis_benchmark_5_2_3,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set LogLevel INFO',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.3':
      benchmark_number => '5.2.3',
      benchmark_status => $cis_benchmark_5_2_3,
    }
  }
}
