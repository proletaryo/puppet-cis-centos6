# 1.1.15    Ensure nodev option set on /dev/shm partition (Scored)
class ciscentos6::benchmark::1_1_15 {

  if ! defined(Ciscentos6::Common::Set_mount_options['/dev/shm']) {
    ciscentos6::common::set_mount_options { '/dev/shm':
      benchmark_number => '1.1.15',
      benchmark_status => $cis_benchmark_1_1_15,
      mount_options    => 'nodev,nosuid,noexec',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.1.15':
      benchmark_number => '1.1.15',
      benchmark_status => $cis_benchmark_1_1_15,
    }
  }
}
