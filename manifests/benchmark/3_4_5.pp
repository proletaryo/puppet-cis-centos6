# 3.4.5    Ensure permissions on /etc/hosts.deny are configured (Scored)
class ciscentos6::benchmark::3_4_5 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/hosts.deny']) {
    ciscentos6::common::set_file_permissions { '/etc/hosts.deny':
      benchmark_number => '3.4.5',
      benchmark_status => $cis_benchmark_3_4_5,
      permissions    => '644',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.4.5':
      benchmark_number => '3.4.5',
      benchmark_status => $cis_benchmark_3_4_5,
    }
  }
}
