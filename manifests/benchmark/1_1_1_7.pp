# 1.1.1.7    Ensure mounting of udf filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_7 {

  ciscentos6::common::disabledfsmnt { 'udf':
    benchmark_number => '1.1.1.7',
    benchmark_status => $cis_benchmark_1_1_1_7,
  }
}
