# 5.1.7    Ensure permissions on /etc/cron.d are configured (Scored)
class ciscentos6::benchmark::5_1_7 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/cron.d']) {
    ciscentos6::common::set_file_permissions { '/etc/cron.d':
      benchmark_number => '5.1.7',
      benchmark_status => $cis_benchmark_5_1_7,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.7':
      benchmark_number => '5.1.7',
      benchmark_status => $cis_benchmark_5_1_7,
    }
  }
}
