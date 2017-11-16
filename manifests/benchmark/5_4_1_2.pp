# 5.4.1.2    Ensure minimum days between password changes is 7 or more (Scored)
class ciscentos6::benchmark::5_4_1_2 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['5_4_1_2']) {
    ciscentos6::common::set_file_parameter { '5_4_1_2':
      benchmark_number => '5.4.1.2',
      benchmark_status => $cis_benchmark_5_4_1_2,
      filepath => '/files/etc/login.defs',
      parameter => 'PASS_MIN_DAYS 7',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.4.1.2':
      benchmark_number => '5.4.1.2',
      benchmark_status => $cis_benchmark_5_4_1_2,
    }
  }
}
