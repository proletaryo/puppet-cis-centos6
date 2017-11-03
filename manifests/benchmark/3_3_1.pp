# 3.3.1    Ensure IPv6 router advertisements are not accepted (Scored)
class ciscentos6::benchmark::3_3_1 {
  if ! defined(Ciscentos6::Common::Add_file_line['net.ipv6.conf.all.accept_ra = 0']) {
    if $cis_benchmark_3_3_1 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'net.ipv6.conf.all.accept_ra = 0':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv6.conf.all.accept_ra = 0',
        regex => '^net.ipv6.conf.all.accept_ra',
      } ->
      ciscentos6::common::add_file_line { 'net.ipv6.conf.default.accept_ra = 0':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv6.conf.default.accept_ra = 0',
        regex => '^net.ipv6.conf.default.accept_ra',
      } ->
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv6.conf.all.accept_ra=0; sysctl -w net.ipv6.conf.default.accept_ra=0; sysctl -w net.ipv6.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.3.1 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.3.1 : $cis_benchmark_3_3_1")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.3.1':
      benchmark_number => '3.3.1',
      benchmark_status => $cis_benchmark_3_3_1,
    }
  }
}
