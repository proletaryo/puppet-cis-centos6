# 5.2.7    Ensure SSH HostbasedAuthentication is disabled (Scored)
class ciscentos6::benchmark::5_2_7 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_7']) {
    ciscentos6::common::set_file_parameter { '5_2_7':
      benchmark_number => '5.2.7',
      benchmark_status => $cis_benchmark_5_2_7,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set HostbasedAuthentication no',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.7':
      benchmark_number => '5.2.7',
      benchmark_status => $cis_benchmark_5_2_7,
    }
  }
}
