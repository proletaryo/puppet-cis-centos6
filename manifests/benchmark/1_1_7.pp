# 1.1.7    Ensure separate partition exists for /var/tmp (Scored)
class ciscentos6::benchmark::1_1_7 {

  ciscentos6::common::just_relay_fact_value { '/var/tmp':
    benchmark_number => '1.1.7',
    benchmark_status => $cis_benchmark_1_1_7,
  }
}
