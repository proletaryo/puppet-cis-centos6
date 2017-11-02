# 3.3.2    Ensure IPv6 redirects are not accepted (Scored)
class ciscentos6::benchmark::3_3_2 {
  if ! defined(Ciscentos6::Common::Add_file_line['net.ipv6.conf.all.accept_redirects = 0']) {
    if $benchmark_status == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'net.ipv6.conf.all.accept_redirects = 0':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv6.conf.all.accept_redirects = 0',
        regex => '^net.ipv6.conf.all.accept_redirects',
      } ->
      ciscentos6::common::add_file_line { 'net.ipv6.conf.default.accept_redirects = 0':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv6.conf.default.accept_redirects = 0',
        regex => '^net.ipv6.conf.default.accept_redirects',
      } ->
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv6.conf.all.accept_redirects=0; sysctl -w net.ipv6.conf.default.accept_redirects=; sysctl -w net.ipv6.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.3.2 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.3.2 : $cis_benchmark_3_3_2")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.3.2':
      benchmark_number => '3.3.2',
      benchmark_status => $cis_benchmark_3_3_2,
    }
  }
}
