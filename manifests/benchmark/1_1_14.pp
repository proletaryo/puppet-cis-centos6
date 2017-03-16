# 1.1.14    Ensure nodev option set on /home partition (Scored)
class ciscentos6::benchmark::1_1_14 {

  if ! defined(Ciscentos6::Common::Set_mount_options['/home']) {
    ciscentos6::common::set_mount_options { '/home':
      benchmark_number => '1.1.14',
      benchmark_status => $cis_benchmark_1_1_14,
      mount_options    => 'nodev',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.1.14':
      benchmark_number => '1.1.14',
      benchmark_status => $cis_benchmark_1_1_14,
    }
  }
}
