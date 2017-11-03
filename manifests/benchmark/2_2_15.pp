# 2.2.15    Ensure mail transfer agent is configured for local-only mode (Scored)
class ciscentos6::benchmark::2_2_15 {
  if ! defined(Ciscentos6::Common::Add_file_line['inet_interfaces = localhost']) {
    if $cis_benchmark_2_2_15 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { 'inet_interfaces = localhost':
        filepath => '/etc/postfix/main.cf'
        addline => 'inet_interfaces = localhost',
        regex => '^inet_interfaces',
      } ->
      exec {'set the active kernel parameters':
        command => "service postfix restart",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 2.2.15 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 2.2.15 : $cis_benchmark_2_2_15")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '2.2.15':
      benchmark_number => '2.2.15',
      benchmark_status => $cis_benchmark_2_2_15,
    }
  }
}
