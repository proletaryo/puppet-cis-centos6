# 6.1.4    Ensure permissions on /etc/group are configured (Scored)
class ciscentos6::benchmark::6_1_4 {
  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/group']) {
    ciscentos6::common::set_file_permissions { '/etc/group':
      benchmark_number => '6.1.4',
      benchmark_status => $cis_benchmark_6_1_4,
      permissions    => '644',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '6.1.4':
      benchmark_number => '6.1.4',
      benchmark_status => $cis_benchmark_6_1_4,
    }
  }
}
