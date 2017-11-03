# 1.4.3    Ensure authentication required for single user mode (Scored)
class ciscentos6::benchmark::1_4_3 {
  if ! defined(Ciscentos6::Common::Add_file_line['/etc/sysconfig/init']) {
    if $cis_benchmark_1_4_3 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'SINGLE=\/sbin\/sulogin':
        filepath => '/etc/sysconfig/init',
        addline => 'SINGLE=\/sbin\/sulogin',
        regex => '^SINGLE',
      } ->
      notify{ "CIS Benchmark 1.4.3 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.4.3 : $cis_benchmark_1_4_3")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_4_3':
      benchmark_number => '1.4.3',
      benchmark_status => $cis_benchmark_1_4_3,
    }
  }
}
