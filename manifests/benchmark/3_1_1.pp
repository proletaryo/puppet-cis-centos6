# 3.1.1    Ensure IP forwarding is disabled (Scored)
class ciscentos6::benchmark::3_1_1 {
  if ! defined(Ciscentos6::Common::Add_file_line['/etc/sysctl.conf']) {
    if $benchmark_status == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '/etc/sysctl.conf':
        filepath => '/etc/sysctl.conf'
        addline => 'net.ipv4.ip_forward = 0',
        regex => '^net.ipv4.ip_forward',
      }
      exec {'set the active kernel parameters':
        command => "sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1",
        path    => "/bin:/sbin",
        require => Ciscentos6::Common::Add_file_line['/etc/sysctl.conf'],
      }
      notify{ "CIS Benchmark 3.1.1 : remediated":
        require  => Exec['set the active kernel parameters'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 3.1.1 : $cis_benchmark_3_1_1")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.1.17':
      benchmark_number => '1.1.17',
      benchmark_status => $cis_benchmark_1_1_17,
    }
  }
}
