# 5.4.3    Ensure default group for the root account is GID 0 (Scored)
class ciscentos6::benchmark::5_4_3 {

  if ! defined(Exec['usermod -g 0 root']) {
    exec {'usermod -g 0 root':
      command => "usermod -g 0 root",
      path    => "/bin:/sbin",
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.4.3':
      benchmark_number => '5.4.3',
      benchmark_status => $cis_benchmark_5_4_3,
    }
  }
}
