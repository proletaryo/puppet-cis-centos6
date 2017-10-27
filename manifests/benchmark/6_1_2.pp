# 6.1.2    Ensure permissions on /etc/passwd are configured (Scored)
class ciscentos6::benchmark::6_1_2 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/passwd']) {
    ciscentos6::common::set_file_permissions { '/etc/passwd':
      benchmark_number => '6.1.2',
      benchmark_status => $cis_benchmark_6_1_2,
      permissions    => '644',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '6.1.2':
      benchmark_number => '6.1.2',
      benchmark_status => $cis_benchmark_6_1_2,
    }
  }
}
