# 1.1.6    Ensure separate partition exists for /var (Scored)
class ciscentos6::benchmark::1_1_6 {

  ciscentos6::common::just_relay_fact_value { '/var':
    benchmark_number => '1.1.6',
    benchmark_status => $cis_benchmark_1_1_6,
  }
}
