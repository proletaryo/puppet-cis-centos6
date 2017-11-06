# 1.7.1.5    Ensure permissions on /etc/issue are configured (Scored)
class ciscentos6::benchmark::1_7_1_5 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/issue']) {
    ciscentos6::common::set_file_permissions { '/etc/issue':
      benchmark_number => '1.7.1.5',
      benchmark_status => $cis_benchmark_1_7_1_5,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.7.1.5':
      benchmark_number => '1.7.1.5',
      benchmark_status => $cis_benchmark_1_7_1_5,
    }
  }
}
