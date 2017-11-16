# 5.2.14    Ensure SSH LoginGraceTime is set to one minute or less (Scored)
class ciscentos6::benchmark::5_2_14 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_14']) {
    ciscentos6::common::set_file_parameter { '5_2_14':
      benchmark_number => '5.2.14',
      benchmark_status => $cis_benchmark_5_2_14,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set LoginGraceTime 60',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.14':
      benchmark_number => '5.2.14',
      benchmark_status => $cis_benchmark_5_2_14,
    }
  }
}
