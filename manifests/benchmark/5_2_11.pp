# 5.2.11    Ensure only approved ciphers are used (Scored)
class ciscentos6::benchmark::5_2_11 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/5_2_11']) {
    ciscentos6::common::set_file_parameter { '5_2_11':
      benchmark_number => '5.2.11',
      benchmark_status => $cis_benchmark_5_2_11,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set Ciphers aes256-ctr,aes192-ctr,aes128-ctr',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.11':
      benchmark_number => '5.2.11',
      benchmark_status => $cis_benchmark_5_2_11,
    }
  }
}
