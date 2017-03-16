# 1.1.1.4    Ensure mounting of hfs filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_4 {

  ciscentos6::common::disable_fs_mounting { 'hfs':
    benchmark_number => '1.1.1.4',
    benchmark_status => $cis_benchmark_1_1_1_4,
  }
}
