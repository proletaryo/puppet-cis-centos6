# 3.1.2    Ensure IP forwarding is disabled (Scored)
class ciscentos6::benchmark::3_1_2 {
  if ! defined(Ciscentos6::Common::Add_file_line['net.ipv4.conf.all.log_martians = 1']) {
    if $benchmark_status == 'failed' {   # remediate
      $addline1 = 'net.ipv4.conf.all.log_martians = 1'
      $regex1 = '^net.ipv4.conf.all.log_martians'
      $addline2 = 'net.ipv4.conf.default.log_martians = 1'
      $regex2 = '^net.ipv4.conf.default.log_martians'
      ciscentos6::common::add_file_line { 'net.ipv4.conf.all.log_martians = 1':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv4.conf.all.log_martians = 1',
        regex => '^net.ipv4.conf.all.log_martians',
      }
      ciscentos6::common::add_file_line { 'net.ipv4.conf.default.log_martians = 1':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv4.conf.default.log_martians = 1',
        regex => '^net.ipv4.conf.default.log_martians',
        require => Ciscentos6::Common::Add_file_line['net.ipv4.conf.all.log_martians = 1'],
      }
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv4.conf.all.log_martians=1; sysctl -w net.ipv4.conf.default.log_martians=1; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
        require => Ciscentos6::Common::Add_file_line['net.ipv4.conf.default.log_martians = 1'],
      }
      notify{ "CIS Benchmark 3.1.2 : remediated":
        require  => Exec['set the active kernel parameters'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.1.2 : $cis_benchmark_3_1_2")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.1.17':
      benchmark_number => '1.1.17',
      benchmark_status => $cis_benchmark_1_1_17,
    }
  }
}
