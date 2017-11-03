# 1.5.1    Ensure core dumps are restricted (Scored)
class ciscentos6::benchmark::1_5_1 {
  if ! defined(Ciscentos6::Common::Add_file_line['/etc/sysconfig/init']) {
    if $cis_benchmark_1_5_1 == 'failed' {   # remediate
      ciscentos6::common::add_file_line { '* hard core 0':
        filepath => '/etc/security/limits.conf',
        addline => '\* hard core 0',
        regex => 'hard.+core',
      } ->
      ciscentos6::common::add_file_line { 'fs.suid_dumpable = 0':
        filepath => '/etc/sysctl.conf',
        addline => 'fs.suid_dumpable = 0',
        regex => '^fs\.suid_dumpable',
      } ->
      exec {'sysctl -w fs.suid_dumpable=0':
        command => "sysctl -w fs.suid_dumpable=0",
        path    => "/bin:/sbin",
      } ->
      notify{ "CIS Benchmark 1.5.1 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 1.5.1 : $cis_benchmark_1_5_1")
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1_5_1':
      benchmark_number => '1.5.1',
      benchmark_status => $cis_benchmark_1_5_1,
    }
  }
}
