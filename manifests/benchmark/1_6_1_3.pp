# 1.6.1.3    Ensure SELinux policy is configured (Scored)
class ciscentos6::benchmark::1_6_1_3 {
  if ! defined(Ciscentos6::Common::Add_file_line['1_6_1_3']) {
    if $cis_benchmark_1_6_1_3 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '1_6_1_3':
        filepath => '/etc/selinux/config',
        addline => 'SELINUXTYPE=targeted',
        regex => '^SELINUXTYPE',
      } ->
      notify{ "CIS Benchmark 1.6.1.3 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.6.1.3 : $cis_benchmark_1_6_1_3")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_6_1_3':
      benchmark_number => '1.6.1.3',
      benchmark_status => $cis_benchmark_1_6_1_3,
    }
  }
}
