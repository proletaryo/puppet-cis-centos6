# 5.2.1    Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
class ciscentos6::benchmark::5_2_1 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['5_2_1']) {
    ciscentos6::common::set_file_permissions { '5_2_1':
      benchmark_number => '5.2.1',
      benchmark_status => $cis_benchmark_5_2_1,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.2.1':
      benchmark_number => '5.2.1',
      benchmark_status => $cis_benchmark_5_2_1,
    }
  }
}
