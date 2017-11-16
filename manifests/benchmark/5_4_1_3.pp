# 5.4.1.3    Ensure password expiration warning days is 7 or more (Scored)
class ciscentos6::benchmark::5_4_1_3 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5.4.1.3']) {
    ciscentos6::common::set_file_parameter { '5.4.1.3':
      benchmark_number => '5.4.1.3',
      benchmark_status => $cis_benchmark_5_4_1_3,
      filepath => '/files/etc/login.defs',
      parameter => 'PASS_WARN_AGE 7',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.4.1.3':
      benchmark_number => '5.4.1.3',
      benchmark_status => $cis_benchmark_5_4_1_3,
    }
  }
}
