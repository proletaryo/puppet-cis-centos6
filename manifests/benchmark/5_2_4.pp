# 5.2.4    Ensure SSH X11 forwarding is disabled (Scored)
class ciscentos6::benchmark::5_2_4 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_4']) {
    ciscentos6::common::set_file_parameter { '5_2_4':
      benchmark_number => '5.2.4',
      benchmark_status => $cis_benchmark_5_2_4,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set X11Forwarding no',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.4':
      benchmark_number => '5.2.4',
      benchmark_status => $cis_benchmark_5_2_4,
    }
  }
}
