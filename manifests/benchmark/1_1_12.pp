# 1.1.12    Ensure separate partition exists for /var/log/audit (Scored)
class ciscentos6::benchmark::1_1_12 {

  ciscentos6::common::just_relay_fact_value { '/var/log/audit':
    benchmark_number => '1.1.12',
    benchmark_status => $cis_benchmark_1_1_12,
  }
}
