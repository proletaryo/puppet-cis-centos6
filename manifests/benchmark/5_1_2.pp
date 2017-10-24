# 5.1.2    Ensure permissions on /etc/crontab are configured (Scored)
class ciscentos6::benchmark::5_1_2 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/crontab']) {
    ciscentos6::common::set_file_permissions { '/etc/crontab':
      benchmark_number => '5.1.2',
      benchmark_status => $cis_benchmark_5_1_2,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.2':
      benchmark_number => '5.1.2',
      benchmark_status => $cis_benchmark_5_1_2,
    }
  }
}
