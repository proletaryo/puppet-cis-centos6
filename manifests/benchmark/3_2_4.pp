# 3.2.4    Ensure suspicious packets are logged (Scored)
class ciscentos6::benchmark::3_2_4 {
  if ! defined(Ciscentos6::Common::Add_file_line['net.ipv4.conf.all.log_martians = 1']) {
    if $cis_benchmark_3_2_4 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'net.ipv4.conf.all.log_martians = 1':
        filepath => '/etc/sysctl.conf',
        addline => 'net.ipv4.conf.all.log_martians = 1',
        regex => '^net.ipv4.conf.all.log_martians',
      } ->
      ciscentos6::common::add_file_line { 'net.ipv4.conf.default.log_martians = 1':
        filepath => '/etc/sysctl.conf',
        addline => 'net.ipv4.conf.default.log_martians = 1',
        regex => '^net.ipv4.conf.default.log_martians',
      } ->
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv4.conf.all.log_martians=1; sysctl -w net.ipv4.conf.default.log_martians=1; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.2.4 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.2.4 : $cis_benchmark_3_2_4")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.2.4':
      benchmark_number => '3.2.4',
      benchmark_status => $cis_benchmark_3_2_4,
    }
  }
}
