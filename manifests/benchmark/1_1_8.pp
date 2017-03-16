# 1.1.8    Ensure nodev option set on /var/tmp partition (Scored)
class ciscentos6::benchmark::1_1_8 {

  if ! defined(Ciscentos6::Common::Set_mount_options['/var/tmp']) {
    ciscentos6::common::set_mount_options { '/var/tmp':
      benchmark_number => '1.1.8',
      benchmark_status => $cis_benchmark_1_1_8,
      mount_options    => 'nodev,nosuid,noexec',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.1.8':
      benchmark_number => '1.1.8',
      benchmark_status => $cis_benchmark_1_1_8,
    }
  }
}
