# 3.2.8    Ensure TCP SYN Cookies is enabled (Scored)
class ciscentos6::benchmark::3_2_8 {
  if ! defined(Ciscentos6::Common::Add_file_line['3_2_8 net.ipv4.tcp_syncookies = 1']) {
    if $cis_benchmark_3_2_8 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '3_2_8 net.ipv4.tcp_syncookies = 1':
        filepath => '/etc/sysctl.conf',
        addline => 'net.ipv4.tcp_syncookies = 1',
        regex => '^net.ipv4.tcp_syncookies',
      } ->
      exec {'3_2_8 set the active kernel parameters':
        command => "sysctl -w net.ipv4.tcp_syncookies=1; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.2.8 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.2.8 : $cis_benchmark_3_2_8")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.2.8':
      benchmark_number => '3.2.8',
      benchmark_status => $cis_benchmark_3_2_8,
    }
  }
}
