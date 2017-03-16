# 1.1.13    Ensure separate partition exists for /home (Scored)
class ciscentos6::benchmark::1_1_13 {

  ciscentos6::common::just_relay_fact_value { '/home':
    benchmark_number => '1.1.13',
    benchmark_status => $cis_benchmark_1_1_13,
  }
}
