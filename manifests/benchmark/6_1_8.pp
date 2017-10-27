# 6.1.8    Ensure permissions on /etc/group- are configured (Scored)
class ciscentos6::benchmark::6_1_8 {
  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/group-']) {
    ciscentos6::common::set_file_permissions { '/etc/group-':
      benchmark_number => '6.1.8',
      benchmark_status => $cis_benchmark_6_1_8,
      permissions    => '600',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '6.1.8':
      benchmark_number => '6.1.8',
      benchmark_status => $cis_benchmark_6_1_8,
    }
  }
}
