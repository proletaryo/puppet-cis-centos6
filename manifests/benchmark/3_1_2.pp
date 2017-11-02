# 3.1.2    Ensure packet redirect sending is disabled (Scored)
class ciscentos6::benchmark::3_1_2 {
  if ! defined(Ciscentos6::Common::Add_file_line['net.ipv4.conf.all.log_martians = 1']) {
    if $benchmark_status == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'net.ipv4.conf.all.send_redirects = 0':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv4.conf.all.send_redirects = 0',
        regex => '^net.ipv4.conf.all.send_redirects',
      } ->
      ciscentos6::common::add_file_line { 'net.ipv4.conf.default.send_redirects = 0':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv4.conf.default.send_redirects = 0',
        regex => '^net.ipv4.conf.default.send_redirects',
      } ->
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv4.conf.all.send_redirects=0; sysctl -w net.ipv4.conf.default.send_redirects=0; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.1.2 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.1.2 : $cis_benchmark_3_1_2")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.1.2':
      benchmark_number => '3.1.2',
      benchmark_status => $cis_benchmark_3_1_2,
    }
  }
}
