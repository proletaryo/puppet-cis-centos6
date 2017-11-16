# 5.2.12    Ensure only approved MAC algorithms are used (Scored)
class ciscentos6::benchmark::5_2_12 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_12']) {
    ciscentos6::common::set_file_parameter { '5_2_12':
      benchmark_number => '5.2.12',
      benchmark_status => $cis_benchmark_5_2_12,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set MACs hmac-sha2-512,hmac-sha2-256',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.12':
      benchmark_number => '5.2.12',
      benchmark_status => $cis_benchmark_5_2_12,
    }
  }
}
