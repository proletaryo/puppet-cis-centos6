# 5.1.4    Ensure permissions on /etc/cron.daily are configured (Scored)
class ciscentos6::benchmark::5_1_4 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/cron.daily']) {
    ciscentos6::common::set_file_permissions { '/etc/cron.daily':
      benchmark_number => '5.1.4',
      benchmark_status => $cis_benchmark_5_1_4,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.4':
      benchmark_number => '5.1.4',
      benchmark_status => $cis_benchmark_5_1_4,
    }
  }
}
