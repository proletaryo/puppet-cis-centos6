# 4.2.1.3    Ensure rsyslog default file permissions configured (Scored)
class ciscentos6::benchmark::4_2_1_3 {
  if ! defined(Ciscentos6::Common::Set_file_parameter['4_2_1_3 /etc/rsyslog.conf']) {
    ciscentos6::common::set_file_parameter { '4_2_1_3 /etc/rsyslog.conf':
      benchmark_number => '4.2.1.3',
      benchmark_status => $cis_benchmark_4_2_1_3,
      filepath => '/files/etc/rsyslog.conf',
      parameter => 'set $FileCreateMode 0640',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.2.1.3':
      benchmark_number => '4.2.1.3',
      benchmark_status => $cis_benchmark_4_2_1_3,
    }
  }
}
