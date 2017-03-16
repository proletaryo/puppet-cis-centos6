# 1.1.1.2    Ensure mounting of freevxfs filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_2 {

  ciscentos6::common::disabledfsmnt { 'freevxfs':
    benchmark_number => '1.1.1.2',
    benchmark_status => $cis_benchmark_1_1_1_2,
  }
}

