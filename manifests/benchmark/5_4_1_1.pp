# 5.4.1.1    Ensure password expiration is 90 days or less (Scored)
class ciscentos6::benchmark::5_4_1_1 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/login.defs']) {
    ciscentos6::common::set_file_parameter { '/etc/login.defs':
      benchmark_number => '5.4.1.1',
      benchmark_status => $cis_benchmark_5_4_1_1,
      filepath => '/files/etc/login.defs',
      parameter => 'set PASS_MAX_DAYS 90',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.4.1.1':
      benchmark_number => '5.4.1.1',
      benchmark_status => $cis_benchmark_5_4_1_1,
    }
  }
}
