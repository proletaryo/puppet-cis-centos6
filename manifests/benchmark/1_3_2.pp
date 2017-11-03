# 1.3.2    Ensure filesystem integrity is regularly checked (Scored)
class ciscentos6::benchmark::1_3_2 {
  if ! defined(Ciscentos6::Common::Add_file_line['crontab aide']) {
    if $cis_benchmark_1_3_2 == 'failed' {   # remediate
      exec{'crontab -u root -e':
        command => "crontab -u root -e",
        path    => "/bin:/sbin",
      } ->
      ciscentos6::common::add_file_line { 'crontab aide':
        filepath => '/etc/crontab',
        addline => '0 5 \* \* \* /usr/sbin/aide --check',
        regex => "\/usr\/sbin\/aide --check",
      } ->
      notify{ "CIS Benchmark 1.3.2 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.3.2 : $cis_benchmark_1_3_2")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_3_2':
      benchmark_number => '1.3_2',
      benchmark_status => $cis_benchmark_1_3_2,
    }
  }
}
