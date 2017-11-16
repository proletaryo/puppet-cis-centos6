# 1.6.1.2    Ensure the SELinux state is enforcing (Scored)
class ciscentos6::benchmark::1_6_1_2 {
  if ! defined(Ciscentos6::Common::Add_file_line['1_6_1_2']) {
    if $cis_benchmark_1_6_1_2 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '1_6_1_2':
        filepath => '/etc/selinux/config',
        addline => 'SELINUX=enforcing',
        regex => '^SELINUX',
      } ->
      notify{ "CIS Benchmark 1.6.1.2 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.6.1.2 : $cis_benchmark_1_6_1_2")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_6_1_2':
      benchmark_number => '1.6.1.2',
      benchmark_status => $cis_benchmark_1_6_1_2,
    }
  }
}
