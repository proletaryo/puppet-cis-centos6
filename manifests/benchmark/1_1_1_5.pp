# 1.1.1.5    Ensure mounting of hfsplus filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_5 {

  ciscentos6::common::disabledfsmnt { 'hfsplus':
    benchmark_number => '1.1.1.5',
    benchmark_status => $cis_benchmark_1_1_1_5,
  }
}
