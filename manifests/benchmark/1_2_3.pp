# 1.2.3    Ensure gpgcheck is globally activated (Scored)
class ciscentos6::benchmark::1_2_3 {
  if ! defined(Ciscentos6::Common::Add_file_line['1_2_3']) {
    if $cis_benchmark_1_2_3 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '1_2_3':
        filepath => '/etc/yum.conf',
        addline => 'gpgcheck=1',
        regex => '^gpgcheck',
      } ->
      exec{'1_2_3 gpgcheck yum.repos':
        command => "sed -i '/^gpgcheck=0/c\\gpgcheck=1' /etc/yum.repos.d/*",
        path    => "/bin:/sbin",
        onlyif  => "grep -P ^gpgcheck /etc/yum.repos.d/*",
      } ->
      notify{ "CIS Benchmark 1.2.3 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.2.3 : $cis_benchmark_1_2_3")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_2_3':
      benchmark_number => '1.2.3',
      benchmark_status => $cis_benchmark_1_2_3,
    }
  }
}
