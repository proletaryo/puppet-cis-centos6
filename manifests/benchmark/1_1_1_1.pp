# 1.1.1.1    Ensure mounting of cramfs filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_1 {

  ciscentos6::common::disabledfsmnt { 'cramfs':
    benchmark_number => '1.1.1.1',
    benchmark_status => $cis_benchmark_1_1_1_1,
  }
}
