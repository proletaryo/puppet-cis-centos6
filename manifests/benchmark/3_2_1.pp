# 3.2.1    Ensure source routed packets are not accepted (Scored)
class ciscentos6::benchmark::3_2_1 {
  if ! defined(Ciscentos6::Common::Add_file_line['3_2_1 net.ipv4.conf.all.accept_source_route = 0']) {
    if $cis_benchmark_3_2_1 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '3_2_1 net.ipv4.conf.all.accept_source_route = 0':
        filepath => '/etc/sysctl.conf',
        addline => 'net.ipv4.conf.all.accept_source_route = 0',
        regex => '^net.ipv4.conf.all.accept_source_route',
      } ->
      ciscentos6::common::add_file_line { '3_2_1 net.ipv4.conf.default.accept_source_route = 0':
        filepath => '/etc/sysctl.conf',
        addline => 'net.ipv4.conf.default.accept_source_route = 0',
        regex => '^net.ipv4.conf.default.accept_source_route',
      } ->
      exec {'3_2_1 set the active kernel parameters':
        command => "sysctl -w net.ipv4.conf.all.accept_source_route=0; sysctl -w net.ipv4.conf.default.accept_source_route=0; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.2.1 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.2.1 : $cis_benchmark_3_2_1")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.2.1':
      benchmark_number => '3.2.1',
      benchmark_status => $cis_benchmark_3_2_1,
    }
  }
}
