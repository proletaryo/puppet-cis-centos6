# 5.1.8    Ensure at/cron is restricted to authorized users (Scored)
class ciscentos6::benchmark::5_1_8 {
  $set_permission_files = ['/etc/cron.allow','/etc/at.allow']
  $remove_files = ['/etc/cron.deny','/etc/at.deny']
  if ! defined(Ciscentos6::Common::Set_file_permissions[$set_permission_files]) {
    file { $remove_files:
      ensure => absent,
    } ->
    file { $set_permission_files:
      ensure => present,
    } ->
    ciscentos6::common::set_file_permissions { $set_permission_files:
      benchmark_number => '5.1.8',
      benchmark_status => $cis_benchmark_5_1_8,
      permissions => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.1.8':
      benchmark_number => '5.1.8',
      benchmark_status => $cis_benchmark_5_1_8,
    }
  }
}
