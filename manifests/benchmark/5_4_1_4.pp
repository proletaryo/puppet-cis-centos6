# 5.4.1.3    Ensure password expiration warning days is 7 or more (Scored)
class ciscentos6::benchmark::5_4_1_3 {

  if ! defined(Exec['useradd -D -f 30']) {
    exec {'useradd -D -f 30':
      command => "useradd -D -f 30",
      path    => "/bin",
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.4.1.3':
      benchmark_number => '5.4.1.3',
      benchmark_status => $cis_benchmark_5_4_1_3,
    }
  }
}
