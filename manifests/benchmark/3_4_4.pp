# 3.4.4    Ensure permissions on /etc/hosts.allow are configured (Scored)
class ciscentos6::benchmark::3_4_4 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/hosts.allow']) {
    ciscentos6::common::set_file_permissions { '/etc/hosts.allow':
      benchmark_number => '3.4.4',
      benchmark_status => $cis_benchmark_3_4_4,
      permissions    => '644',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.4.4':
      benchmark_number => '3.4.4',
      benchmark_status => $cis_benchmark_3_4_4,
    }
  }
}
