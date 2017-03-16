# 1.1.1.3    Ensure mounting of jffs2 filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_3 {

  ciscentos6::common::disabledfsmnt { 'jffs2':
    benchmark_number => '1.1.1.3',
    benchmark_status => $cis_benchmark_1_1_1_3,
  }
}
