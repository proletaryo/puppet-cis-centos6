# 5.2.15    Ensure SSH access is limited (Scored)
class ciscentos6::benchmark::5_2_15 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_15']) {
    ciscentos6::common::set_file_parameter { '5_2_15':
      benchmark_number => '5.2.15',
      benchmark_status => $cis_benchmark_5_2_15,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set AllowUsers <userlist>',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.15':
      benchmark_number => '5.2.15',
      benchmark_status => $cis_benchmark_5_2_15,
    }
  }
}
