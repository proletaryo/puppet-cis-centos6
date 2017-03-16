# 1.1.2    Ensure separate partition exists for /tmp (Scored)
class ciscentos6::benchmark::1_1_2 {

  ciscentos6::common::just_relay_fact_value { '/tmp':
    benchmark_number => '1.1.2',
    benchmark_status => $cis_benchmark_1_1_2,
  }
}
