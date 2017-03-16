# 1.1.1.6    Ensure mounting of squashfs filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_6 {

  ciscentos6::common::disabledfsmnt { 'squashfs':
    benchmark_number => '1.1.1.6',
    benchmark_status => $cis_benchmark_1_1_1_6,
  }
}
