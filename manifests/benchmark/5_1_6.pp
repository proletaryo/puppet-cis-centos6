# 5.1.6    Ensure permissions on /etc/cron.monthly are configured (Scored)
class ciscentos6::benchmark::5_1_6 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/cron.monthly']) {
    ciscentos6::common::set_file_permissions { '/etc/cron.monthly':
      benchmark_number => '5.1.6',
      benchmark_status => $cis_benchmark_5_1_6,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.6':
      benchmark_number => '5.1.6',
      benchmark_status => $cis_benchmark_5_1_6,
    }
  }
}
