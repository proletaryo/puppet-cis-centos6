# 1.1.11    Ensure separate partition exists for /var/log (Scored)
class ciscentos6::benchmark::1_1_11 {

  ciscentos6::common::just_relay_fact_value { '/var/log':
    benchmark_number => '1.1.11',
    benchmark_status => $cis_benchmark_1_1_11,
  }
}
