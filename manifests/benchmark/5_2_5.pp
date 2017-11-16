# 5.2.5    Ensure SSH MaxAuthTries is set to 4 or less (Scored)
class ciscentos6::benchmark::5_2_5 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_5']) {
    ciscentos6::common::set_file_parameter { '5_2_5':
      benchmark_number => '5.2.5',
      benchmark_status => $cis_benchmark_5_2_5,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set MaxAuthTries 4',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.5':
      benchmark_number => '5.2.5',
      benchmark_status => $cis_benchmark_5_2_5,
    }
  }
}
