# 6.1.7    Ensure permissions on /etc/shadow- are configured (Scored)
class ciscentos6::benchmark::6_1_7 {
  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/shadow-']) {
    ciscentos6::common::set_file_permissions { '/etc/shadow-':
      benchmark_number => '6.1.7',
      benchmark_status => $cis_benchmark_6_1_7,
      permissions    => '600',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '6.1.7':
      benchmark_number => '6.1.7',
      benchmark_status => $cis_benchmark_6_1_7,
    }
  }
}
