# 6.1.5    Ensure permissions on /etc/gshadow are configured (Scored)
class ciscentos6::benchmark::6_1_5 {
  if ! defined(Ciscentos6::Common::Set_file_permissions['/etc/gshadow']) {
    ciscentos6::common::set_file_permissions { '/etc/gshadow':
      benchmark_number => '6.1.5',
      benchmark_status => $cis_benchmark_6_1_5,
      permissions    => '000',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '6.1.5':
      benchmark_number => '6.1.5',
      benchmark_status => $cis_benchmark_6_1_5,
    }
  }
}
