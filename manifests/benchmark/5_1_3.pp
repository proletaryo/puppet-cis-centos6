# 5.1.3    Ensure permissions on /etc/cron.hourly are configured (Scored)
class ciscentos6::benchmark::5_1_3 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/cron.hourly']) {
    ciscentos6::common::set_file_permissions { '/etc/cron.hourly':
      benchmark_number => '5.1.3',
      benchmark_status => $cis_benchmark_5_1_3,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.3':
      benchmark_number => '5.1.3',
      benchmark_status => $cis_benchmark_5_1_3,
    }
  }
}
