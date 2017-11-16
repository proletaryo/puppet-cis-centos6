# 5.2.9    Ensure SSH PermitEmptyPasswords is disabled (Scored)
class ciscentos6::benchmark::5_2_9 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_2_9']) {
    ciscentos6::common::set_file_parameter { '5_2_9':
      benchmark_number => '5.2.9',
      benchmark_status => $cis_benchmark_5_2_9,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set PermitEmptyPasswords no',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.9':
      benchmark_number => '5.2.9',
      benchmark_status => $cis_benchmark_5_2_9,
    }
  }
}
