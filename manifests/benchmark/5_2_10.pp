# 5.2.10    Ensure SSH PermitUserEnvironment is disabled (Scored)
class ciscentos6::benchmark::5_2_10 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/ssh/sshd_config']) {
    ciscentos6::common::set_file_parameter { '/etc/ssh/sshd_config':
      benchmark_number => '5.2.10',
      benchmark_status => $cis_benchmark_5_2_10,
      filepath => '/files/etc/ssh/sshd_config',
      parameter => 'set PermitUserEnvironment no',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.10':
      benchmark_number => '5.2.10',
      benchmark_status => $cis_benchmark_5_2_10,
    }
  }
}
