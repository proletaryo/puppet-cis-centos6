# 1.1.5    Ensure noexec option set on /tmp partition (Scored)
class ciscentos6::benchmark::1_1_5 {

  if ! defined(Ciscentos6::Common::Set_mount_options['/tmp']) {
    ciscentos6::common::set_mount_options { '/tmp':
      benchmark_number => '1.1.5',
      benchmark_status => $cis_benchmark_1_1_5,
      mount_options    => 'nodev,nosuid,noexec',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.1.5':
      benchmark_number => '1.1.5',
      benchmark_status => $cis_benchmark_1_1_5,
    }
  }
}
