# 1.5.3    Ensure address space layout randomization (ASLR) is enabled (Scored)
class ciscentos6::benchmark::1_5_3 {
  if ! defined(Ciscentos6::Common::Add_file_line['1_5_3']) {
    if $cis_benchmark_1_5_3 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '1_5_3':
        filepath => '/etc/sysctl.conf',
        addline => 'kernel.randomize_va_space = 2',
        regex => '^kernel\.randomize_va_space',
      } ->
      exec {'1_5_3 sysctl -w kernel.randomize_va_space=2':
        command => "sysctl -w kernel.randomize_va_space=2",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 1.5.3 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.5.3 : $cis_benchmark_1_5_3")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_5_3':
      benchmark_number => '1.5.3',
      benchmark_status => $cis_benchmark_1_5_3,
    }
  }
}
