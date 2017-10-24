# 5.1.5    Ensure permissions on /etc/cron.weekly are configured (Scored)
class ciscentos6::benchmark::5_1_5 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/cron.weekly']) {
    ciscentos6::common::set_file_permissions { '/etc/cron.weekly':
      benchmark_number => '5.1.5',
      benchmark_status => $cis_benchmark_5_1_5,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.5':
      benchmark_number => '5.1.5',
      benchmark_status => $cis_benchmark_5_1_5,
    }
  }
}
