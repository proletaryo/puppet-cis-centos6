# 1.1.1.8    Ensure mounting of FAT filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_8 {

  ciscentos6::common::disabledfsmnt { 'vfat':
    benchmark_number => '1.1.1.8',
    benchmark_status => $cis_benchmark_1_1_1_8,
  }
}
