# 5.2.2    Ensure SSH Protocol is set to 2 (Scored)
class ciscentos6::benchmark::5_2_2 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/ssh/sshd_config']) {
    ciscentos6::common::set_file_parameter { '/etc/ssh/sshd_config':
      benchmark_number => '5.2.2',
      benchmark_status => $cis_benchmark_5_2_2,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set Protocol 2',
      ],
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.2':
      benchmark_number => '5.2.2',
      benchmark_status => $cis_benchmark_5_2_2,
    }
  }
}
