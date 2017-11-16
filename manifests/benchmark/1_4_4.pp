# 1.4.4    Ensure interactive boot is not enabled (Scored)
class ciscentos6::benchmark::1_4_4 {
  if ! defined(Ciscentos6::Common::Add_file_line['1_4_4']) {
    if $cis_benchmark_1_4_4 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '1_4_4':
        filepath => '/etc/sysconfig/init',
        addline => 'PROMPT=no',
        regex => '^PROMPT',
      } ->
      notify{ "CIS Benchmark 1.4.4 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.4.4 : $cis_benchmark_1_4_4")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_4_4':
      benchmark_number => '1.4.4',
      benchmark_status => $cis_benchmark_1_4_4,
    }
  }
}
