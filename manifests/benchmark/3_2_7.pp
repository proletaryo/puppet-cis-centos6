# 3.2.7    Ensure bogus ICMP responses are ignored (Scored)
class ciscentos6::benchmark::3_2_7 {
  if ! defined(Ciscentos6::Common::Add_file_line['net.ipv4.conf.all.rp_filter = 1']) {
    if $cis_benchmark_3_2_7 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'net.ipv4.conf.all.rp_filter = 1':
        filepath => '/etc/sysctl.conf',
        addline => 'net.ipv4.conf.all.rp_filter = 1',
        regex => '^net.ipv4.conf.all.rp_filter',
      } ->
      ciscentos6::common::add_file_line { 'net.ipv4.conf.default.rp_filter = 1':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv4.icmp_ignore_bogus_error_responses = 1',
        regex => '^net.ipv4.icmp_ignore_bogus_error_responses',
      } ->
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv4.conf.all.rp_filter=1; sysctl -w net.ipv4.conf.default.rp_filter=1; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 3.2.7 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.2.7 : $cis_benchmark_3_2_7")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '3.2.7':
      benchmark_number => '3.2.7',
      benchmark_status => $cis_benchmark_3_2_7,
    }
  }
}
